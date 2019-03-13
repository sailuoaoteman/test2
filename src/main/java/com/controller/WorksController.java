package com.controller;

import com.entity.Works;
import com.service.WorksServcie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("works")
public class WorksController {

    @Autowired
    private WorksServcie ws;


    @RequestMapping("/showAll")
    public List<Works> showAll(){
        List<Works> list = ws.findAll();

        return list;
    }

    @RequestMapping("/add")
    public void add(Works works , MultipartFile upFile, HttpSession session )throws Exception{
        String originalFilename = upFile.getOriginalFilename();
        String realPath = session.getServletContext().getRealPath("/mmmm");

        System.out.println(realPath+"\\"+originalFilename);

        upFile.transferTo(
                new File(realPath+"\\"+originalFilename)
        );

        ws.append(works);

    }

    @RequestMapping("/download")
    public void download(String name, HttpSession session, HttpServletResponse response) throws Exception{
        //获取文件路径
        String realPath = session.getServletContext().getRealPath("/mmmm");
        //获取文件
        File file = new File(realPath,name);
        //根据文件后缀设置响应类型
        String substring = name.substring(name.lastIndexOf("."));
        response.setContentType(session.getServletContext().getMimeType(substring));
        //设置响应头
        response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(name, "utf-8"));
        //响应
        FileInputStream inputStream = new FileInputStream(file);
        FileCopyUtils.copy(inputStream, response.getOutputStream());

    }


}
