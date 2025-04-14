/**
 * 日期选择器初始化
 * 允许选择过去和未来的日期
 */
$(function() {
    // 初始化开始日期选择器
    $("#startDate").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:+10",
        onSelect: function(selectedDate) {
            // 当选择开始日期后，设置结束日期的最小日期
            $("#endDate").datepicker("option", "minDate", selectedDate);
        }
    });
    
    // 初始化结束日期选择器
    $("#endDate").datepicker({
        dateFormat: "yy-mm-dd",
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:+10"
    });
}); 