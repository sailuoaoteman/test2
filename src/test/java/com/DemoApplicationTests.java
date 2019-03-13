package com;

import com.dao.WorksDao;
import com.entity.Works;
import com.service.WorksServcie;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class DemoApplicationTests {

    @Autowired
    private WorksDao dao;

    @Autowired
    private WorksServcie ws;

    @Test
    public void contextLoads() {
        List<Works> list = dao.selectAll();
        System.out.println(list+"sss");
    }

    @Test
    public void tets222(){
        Works works = new Works("4","2","3");
        dao.insert(works);
    }

    @Test
    public void test22222(){
        List<Works> list = ws.findAll();
        System.out.println(list);
        System.out.println("sss");
        System.out.println("qqq");
        System.out.println("www");
        System.out.println("aaa");
    }

}
