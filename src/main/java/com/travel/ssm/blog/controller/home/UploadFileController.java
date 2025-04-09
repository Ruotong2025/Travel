package com.travel.ssm.blog.controller.home;

import com.travel.ssm.blog.dto.JsonResult;
import com.travel.ssm.blog.dto.UploadFileVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

/**
 * @author travel
 */
@Slf4j
@RestController
@RequestMapping("/admin/upload")
public class UploadFileController {


    public final String allowSuffix = ".bmp.jpg.jpeg.png.gif.pdf.doc.zip.rar.gz";

    /**
     * 上传文件
     *
     * @param file
     * @return
     * @throws IOException
     */
    @RequestMapping(value = "/img", method = RequestMethod.POST)
    public JsonResult uploadFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {

        /**
         * 文件保存目录，物理路径
         */
        String realPath = request.getServletContext().getRealPath("/resource");

        String rootPath = realPath.split("target")[0] + "src\\main\\webapp\\resource\\assets\\img\\thumbnail";  // 以 target 为分隔点


        //1.文件后缀过滤，只允许部分后缀
        //文件的完整名称,如spring.jpeg
        String originalFilename = file.getOriginalFilename();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        //文件后缀,如.jpeg
        String extension = originalFilename.substring(originalFilename.lastIndexOf(".")); // .jpg .png 等
        //2.创建文件目录
        //创建年月文件夹

        String newFilename = UUID.randomUUID() + String.valueOf(timestamp.getTime()) + extension;        //文件名,如spring

        if (allowSuffix.indexOf(extension) == -1) {
            return new JsonResult().fail("不允许上传该后缀的文件！");
        }

        File descFile = new File(rootPath + '/' + newFilename);

        //判断目标文件所在的目录是否存在
        if (!descFile.getParentFile().exists()) {
            //如果目标文件所在的目录不存在，则创建父目录
            descFile.getParentFile().mkdirs();
        }

        //3.存储文件
        //将内存中的数据写入磁盘
        try {
            file.transferTo(descFile);
        } catch (Exception e) {
            e.printStackTrace();
            log.error("上传失败，cause:{}", e);
        }
        //完整的url
        String fileUrl = "/img/thumbnail" +"/" + newFilename;

        //4.返回URL
        UploadFileVO uploadFileVO = new UploadFileVO();
        uploadFileVO.setTitle(newFilename);
        uploadFileVO.setSrc(fileUrl);
        return new JsonResult().ok(uploadFileVO);
    }
}