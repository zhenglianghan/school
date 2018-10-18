package org.liufree.onlineschool.common;

import org.liufree.onlineschool.dao.user.UserDao;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionListener;

import javax.servlet.http.HttpSessionEvent;

import javax.servlet.annotation.WebListener;
import java.sql.Timestamp;
import java.util.Date;


@WebListener
@Controller
public class SessionListener implements HttpSessionListener {
    @Autowired
    UserDao dao;
    @Autowired
    CourseUnitDao cu;
    @Override
    public void sessionCreated(HttpSessionEvent event) {
    //     System.out.println("-------session created!---------");
//         HttpSession session=event.getSession();
//        System.out.println(session.getId());
//         System.out.println(session.getAttributeNames());
//        User u=(User)session.getAttribute("user");
//        System.out.println(u.getUsername()+u.getRole()+u.getId());

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event){

        System.out.println("-------session destroyed!-------");
        HttpSession session=event.getSession();

            if(session.getAttribute("username")!=null || session.getAttribute("loginTime") != null)
            {
                System.out.println("-------username!=null-------");
                String username=(String)session.getAttribute("username");
                Timestamp timeStamp1=(Timestamp)session.getAttribute("loginTime");
                Date date=new Date();
                Timestamp timeStamp2 = new Timestamp(date.getTime());
           //     System.out.println("注销时间： "+timeStamp2);

                int role=(int)session.getAttribute("role");
                String iden="";
                System.out.println(username+";role: "+ role +";"+timeStamp1+" ; "+timeStamp2);
                long time=(timeStamp2.getTime()-timeStamp1.getTime())/60000;           //毫秒除以60000得到分钟
                String duration=time/60+"h "+time%60+"min";

                if(role==1)
                   iden="student";
                else if(role==2)
                    iden="teacher";
                else
                    iden = "xx";
                dao.loginTime(username,iden,timeStamp1,timeStamp2,duration);

                int minute=Integer.parseInt(session.getAttribute("minute").toString().trim());
                int second=Integer.parseInt(session.getAttribute("second").toString().trim());
                int userId=Integer.parseInt(session.getAttribute("userId").toString().trim());
                int unitId=Integer.parseInt(session.getAttribute("unitId").toString().trim());
                System.out.println("userId:"+userId+" ; unitId:"+unitId+" ; "+minute+second);
                cu.setTime(userId,unitId,minute,second);
            }




    }

}
