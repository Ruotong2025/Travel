// Comment AJAX functionality
$(document).ready(function() {
    // 调试日志
    console.log("Comment AJAX script loaded");
    
    // Global variables
    let polling = false;
    let lastCommentId = 0;
    let isSubmitting = false; // Flag to prevent duplicate submissions
    let commentSubmitTimer = null; // For debouncing
    let canSubmitAgain = true; // Flag to control submission timing
    
    // Function to escape HTML for displaying comments safely
    function escapeHtml(text) {
        if (!text) return '';
        return $('<div>').text(text).html();
    }
    
    // Function to limit comment length to 255 characters
    function limitCommentLength(text, limit = 255) {
        if (!text) return '';
        return text.length <= limit ? text : text.substring(0, limit);
    }
    
    // Initialize by finding the highest comment ID
    function initializeComments() {
        console.log("Initializing comments");
        $('.comment').each(function() {
            const commentId = parseInt($(this).find('.comment-body').attr('id').replace('div-comment-', ''));
            if (!isNaN(commentId) && commentId > lastCommentId) {
                lastCommentId = commentId;
            }
        });
        console.log("Found highest comment ID:", lastCommentId);
        
        // Start polling for new comments
        startPolling();
    }
    
    // Debounce function to prevent rapid submissions
    function debounce(func, wait) {
        return function() {
            const context = this;
            const args = arguments;
            
            clearTimeout(commentSubmitTimer);
            commentSubmitTimer = setTimeout(function() {
                func.apply(context, args);
            }, wait);
        };
    }
    
    // 移除旧的提交处理程序，防止重复绑定
    $("#comment_form").off('submit');
    
    // Handle comment form submission with debounce
    $("#comment_form").on('submit', debounce(function(e) {
        e.preventDefault();
        console.log("Form submitted");
        submitComment();
        return false;
    }, 300)); // 300ms debounce
    
    // Submit comment via AJAX
    function submitComment() {
        console.log("Submitting comment, isSubmitting:", isSubmitting, "canSubmitAgain:", canSubmitAgain);
        
        // Prevent duplicate submissions
        if (isSubmitting || !canSubmitAgain) {
            if (!canSubmitAgain) {
                layer.msg("请稍等片刻再提交评论");
            }
            console.log("Submission prevented - already submitting or too frequent");
            return false;
        }
        
        // Get comment content and limit length
        let commentContent = $("#comment").val();
        if (!commentContent || commentContent.trim() === "") {
            layer.msg("评论内容不能为空！");
            return false;
        }
        
        if (commentContent.length > 255) {
            commentContent = limitCommentLength(commentContent);
            $("#comment").val(commentContent);
        }
        
        // Set submitting flag to prevent duplicates
        isSubmitting = true;
        canSubmitAgain = false; // Prevent rapid resubmission
        
        // Disable submit button to prevent multiple submissions
        $("#submit").prop('disabled', true);
        
        console.log("Sending AJAX request");
        
        $.ajax({
            type: "POST",
            url: '/comment',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: $("#comment_form").serialize(),
            success: function(data) {
                console.log("AJAX success:", data);
                if (data.code == 0) {
                    // Clear the form
                    $("#comment").val('');
                    
                    // Cancel any reply
                    $("#cancel-comment-reply-link").hide();
                    $("input[name=commentPid]").attr("value", 0);
                    $("input[name=commentPname]").attr("value", "");
                    $("#reply-title-word").html("发表评论");
                    
                    // Fetch the latest comments immediately with a short delay
                    // to allow the server to process the comment
                    setTimeout(function() {
                        fetchNewComments();
                    }, 800); // 增加延迟时间，确保服务器处理完成
                    
                    layer.msg("评论成功！");
                } else {
                    // Check if it's the "too frequent" error
                    if (data.msg && data.msg.indexOf("提交太频繁") !== -1) {
                        layer.msg("评论提交太频繁，请稍后再试");
                    } else {
                        layer.msg(data.msg || "评论提交失败，请稍后再试！");
                    }
                }
                // Re-enable the submit button and reset flag
                $("#submit").prop('disabled', false);
                isSubmitting = false;
                
                // Allow submission again after 2.5 seconds
                setTimeout(function() {
                    canSubmitAgain = true;
                    console.log("Can submit again set to true");
                }, 2500);
            },
            error: function(xhr) {
                console.log("AJAX error:", xhr);
                let errorMsg = "评论提交失败，请稍后再试！";
                if (xhr.responseJSON && xhr.responseJSON.msg) {
                    errorMsg = xhr.responseJSON.msg;
                }
                layer.msg(errorMsg);
                $("#submit").prop('disabled', false);
                isSubmitting = false;
                
                // Allow submission again after 2.5 seconds
                setTimeout(function() {
                    canSubmitAgain = true;
                }, 2500);
            }
        });
    }
    
    // Start polling for new comments
    function startPolling() {
        if (!polling) {
            polling = true;
            // Poll every 5 seconds (reduced from 10 for more responsive updates)
            setInterval(fetchNewComments, 5000);
            console.log("Comment polling started");
        }
    }
    
    // Function to fetch new comments
    function fetchNewComments() {
        const articleId = $("#articleDetail").attr("data-id");
        if (!articleId) {
            console.error("Article ID not found");
            return;
        }
        
        $.ajax({
            type: "GET",
            url: '/comment/new',
            data: {
                articleId: articleId,
                lastCommentId: lastCommentId
            },
            dataType: 'json',
            success: function(data) {
                console.log("Fetched new comments:", data ? data.length : 0);
                if (data && data.length > 0) {
                    updateCommentDisplay(data);
                }
            },
            error: function(xhr, status, error) {
                console.error("Error fetching comments:", error);
            }
        });
    }
    
    // Function to update the comment display with new comments
    function updateCommentDisplay(newComments) {
        // Process new comments (they're already in reverse chronological order from server)
        for (let i = 0; i < newComments.length; i++) {
            const comment = newComments[i];
            
            // Check if this comment already exists on the page
            if ($("#div-comment-" + comment.commentId).length > 0) {
                console.log("Skipping existing comment:", comment.commentId);
                continue; // Skip if comment already exists
            }
            
            // Update lastCommentId to the highest ID
            if (comment.commentId > lastCommentId) {
                lastCommentId = comment.commentId;
            }
            
            // If it's a top-level comment
            if (comment.commentPid == 0) {
                // Insert at the beginning of the comment list
                insertNewTopLevelComment(comment);
            } else {
                // It's a reply, add it to the appropriate parent
                insertNewReplyComment(comment);
            }
        }
        
        // Update the comment count
        $(".comment-count").text($(".comment").length);
    }
    
    // Function to insert a new top-level comment
    function insertNewTopLevelComment(comment) {
        console.log("Inserting new top-level comment:", comment.commentId);
        
        // Create anchor
        const anchorHtml = `
            <li class="comments-anchor">
                <ul id="anchor-comment-${comment.commentId}"></ul>
            </li>
        `;
        
        // Create the comment HTML with the same structure as existing comments
        const commentHtml = `
            <li class="comment">
                <div id="div-comment-${comment.commentId}" class="comment-body">
                    <div class="comment-author vcard">
                        <img class="avatar" src="${comment.commentAuthorAvatar}" alt="avatar" style="display: block;">
                        <strong>${escapeHtml(comment.commentAuthorName)} </strong>
                        ${comment.commentRole == 1 ? 
                            '<i class="fa fa-black-tie" style="color: #c40000;"></i><span class="" style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>' : 
                            ''}
                        <span class="comment-meta commentmetadata">
                            <span class="ua-info" style="display: inline;">
                                <br>
                                <span class="comment-aux">
                                    <span class="reply">
                                        <a rel="nofollow" class="comment-reply-link" href="#respond">回复</a>
                                    </span>
                                    ${new Date(comment.commentCreateTime).toLocaleString()}&nbsp;
                                    <a href="javascript:void(0)" class="comment-delete-link" data-id="${comment.commentId}">删除</a>
                                    <a class="comment-edit-link" href="/admin/comment/edit/${comment.commentId}" target="_blank">编辑</a>
                                    <span class="floor"> &nbsp;${$(".comment").length + 1}楼 </span>
                                </span>
                            </span>
                        </span>
                        <p>${escapeHtml(comment.commentContent)}</p>
                    </div>
                </div>
                <ul class="children"></ul>
            </li>
        `;
        
        // Insert the new comment at the top of the list with animation
        const $newComment = $(anchorHtml + commentHtml).hide();
        $(".comment-list").prepend($newComment);
        $newComment.fadeIn(500);
    }
    
    // Function to insert a reply comment
    function insertNewReplyComment(comment) {
        console.log("Inserting new reply comment:", comment.commentId, "to parent:", comment.commentPid);
        
        // Find the parent comment
        const parentComment = $(`#div-comment-${comment.commentPid}`).closest('li.comment');
        if (parentComment.length > 0) {
            // Create anchor
            const anchorHtml = `
                <li class="comments-anchor">
                    <ul id="anchor-comment-${comment.commentId}"></ul>
                </li>
            `;
            
            // Create the comment HTML
            const commentHtml = `
                <li class="comment">
                    <div id="div-comment-${comment.commentId}" class="comment-body">
                        <div class="comment-author vcard">
                            <img class="avatar" src="${comment.commentAuthorAvatar}" alt="avatar" style="display: block;">
                            <strong>${escapeHtml(comment.commentAuthorName)} </strong>
                            ${comment.commentRole == 1 ? 
                                '<i class="fa fa-black-tie" style="color: #c40000;"></i><span class="" style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>博主</b></span>' : 
                                ''}
                            <span class="comment-meta">
                                <span class="ua-info" style="display: inline;">
                                <br>
                                <span class="comment-aux">
                                    <span class="reply">
                                        <a rel="nofollow" class="comment-reply-link" href="#respond">回复</a>
                                    </span>
                                    ${new Date(comment.commentCreateTime).toLocaleString()}&nbsp;
                                    <a href="javascript:void(0)" class="comment-delete-link" data-id="${comment.commentId}">删除</a>
                                    <a class="comment-edit-link" href="/admin/comment/edit/${comment.commentId}" target="_blank">编辑</a>
                                    <span class="floor"> &nbsp;${parentComment.find('.children .comment').length + 1}层 </span>
                                </span>
                            </span>
                            </span>
                            <p>
                                <span class="at">@ ${escapeHtml(comment.commentPname)}</span>
                                ${escapeHtml(comment.commentContent)}
                            </p>
                        </div>
                    </div>
                </li>
            `;
            
            // Add to the parent's children with animation
            const $newReply = $(anchorHtml + commentHtml).hide();
            parentComment.find('.children').prepend($newReply);
            $newReply.fadeIn(500);
        } else {
            console.error("Parent comment not found:", comment.commentPid);
        }
    }
    
    // Handle reply button clicks for dynamically added comments
    $(document).on('click', '.comment-reply-link', function() {
        var commentId = $(this).closest('.comment-body').attr('id').replace('div-comment-', '');
        var commentAuthorName = $(this).closest('.comment-body').find('strong').first().text().trim();
        
        console.log("Reply clicked for comment ID:", commentId, "author:", commentAuthorName);
        
        $("#reply-title-word").html("回复给 " + commentAuthorName);
        $("#comment_pid").val(commentId);
        $("input[name=commentPname]").attr("value", commentAuthorName);
        $("#cancel-comment-reply-link").show();
        
        // Scroll to comment form
        $('html, body').animate({
            scrollTop: $('#respond').offset().top
        }, 500);
        
        return false;
    });
    
    // Handle delete button clicks for dynamically added comments
    $(document).on('click', '.comment-delete-link', function() {
        var commentId = $(this).data('id');
        console.log("Delete clicked for comment ID:", commentId);
        
        if (confirmDelete()) {
            deleteComment(commentId);
        }
        return false;
    });
    
    // Initialize comment functionality with a short delay to ensure DOM is fully loaded
    setTimeout(initializeComments, 500); // 增加延迟，确保DOM完全加载
});