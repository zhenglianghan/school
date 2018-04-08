package org.liufree.onlineschool.controller.upload;

import org.liufree.onlineschool.bean.course.CourseFile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @author lwx
 * @date 3/18/18
 * @email liufreeo@gmail.com
 */
@RestController
public class UploadController {


    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public Object addFile(HttpSession session, @RequestParam(name = "file") MultipartFile file, HttpServletRequest request, CourseFile courseFile, Model model) {
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("/upload");
        String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
        String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
        double msize = (double) file.getSize();
        double size = msize / 1024 / 1024;
        BigDecimal bg = new BigDecimal(size);
        size = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        System.out.println(size);

        System.out.println(path);
        File targetFile = new File(path, filename);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String url = request.getContextPath() + "/upload/" + filename;
        System.out.println(url);
        return url;

    }
}
