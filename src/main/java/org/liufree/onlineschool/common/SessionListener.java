package org.liufree.onlineschool.common;

import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.bean.course.UnitTime;
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
import java.util.List;

@WebListener
@Controller
public class SessionListener implements HttpSessionListener {
    @Autowired
    UserDao dao;
    @Autowired
    CourseUnitDao cu;
    @Override
    public void sessionCreated(HttpSessionEvent event) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event){

        System.out.println("-------session destroyed!-------");
        HttpSession session=event.getSession();

            if(session.getAttribute("username")!=null && session.getAttribute("loginTime") != null)
            {
                System.out.println("-------username!=null-------");
                String username=session.getAttribute("username").toString();
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
                dao.loginTime(username,iden,timeStamp1,timeStamp2,duration);       //插入登录日志
                System.out.println(username+";"+iden+";"+timeStamp1+";"+timeStamp2+";"+duration);
                int userId=Integer.parseInt(session.getAttribute("userId").toString().trim());
                List<CourseUnit> courseUnit=cu.findAllByUnitId();

                for(CourseUnit cuu:courseUnit)
                {                                                                  //所有session值改变了的单元都需要更新时间
                    int unitId=cuu.getId();
                    System.out.println("unitId:"+ unitId);
                    if(session.getAttribute("minute"+unitId)!=null)
                    {
                        int minute=Integer.parseInt(session.getAttribute("minute"+unitId).toString().trim());
                        int second=Integer.parseInt(session.getAttribute("second"+unitId).toString().trim());
                        int timeNum=cu.findNumTime(userId,unitId);

                        if(timeNum==0)
                            cu.setTime(userId,unitId,minute,second);
                        else {
                            cu.deleteByEgId(userId,unitId);
                            cu.setTime(userId,unitId,minute,second);
                        }
                    }
                }

            }




    }

}
