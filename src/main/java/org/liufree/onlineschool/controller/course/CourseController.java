package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.course.UnitTime;
import org.liufree.onlineschool.bean.course.CourseFile;
import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.UserCourse;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.CourseFileDao;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.liufree.onlineschool.dao.course.GradeDao;
import org.liufree.onlineschool.dao.exam.ExamResultDao;
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.liufree.onlineschool.service.course.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.liufree.onlineschool.bean.exam.*;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */

@Controller
@RequestMapping("/course")
public class CourseController {


    @Autowired
    GradeDao gradeDao;
    @Autowired
    CourseDao courseDao;
    @Autowired
    UserDao userDao;
    @Autowired
    UserCourseDao userCourseDao;
    @Autowired
    CourseUnitDao courseUnitDao;
    @Autowired
    CourseService courseService;
    @Autowired
    CourseFileDao courseFileDao;
    @Autowired
    ExamResultDao examResultDao;

    @RequestMapping("/detail/{courseId}")
    public String courseDetail(@PathVariable("courseId") int courseId, Model model, HttpSession session) {

        User user = (User) session.getAttribute("user");
        int userId = user.getId();

        Course course = courseDao.getOne(courseId);
        model.addAttribute("course", course);
        if (courseService.studentHaveCourse(userId, courseId)) {
            model.addAttribute("studentHaveCourse", 1);
        }

        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);
        return "course/course_detail";
    }

    @RequestMapping("/student/add/{courseId}")  //学生注册该课程 TODO 重复注册问题
    public String studentAdd(@PathVariable("courseId") int courseId, Model model, HttpSession session) {

        int userId = (Integer) session.getAttribute("userId");
        boolean flag = courseService.studentHaveCourse(userId, courseId);
        if (flag == true) {

        }
        UserCourse userCourse = new UserCourse();
        userCourse.setUserId(userId);
        userCourse.setCourseId(courseId);
        userCourse.setState(0);
        userCourseDao.save(userCourse);
        return "redirect:/user/courseList";
    }


    @RequestMapping("/student/course/{courseId}")
    public String getCourse(@PathVariable("courseId") int courseId, Model model, HttpSession session) {

        session.setAttribute("courseId", courseId);

        return "redirect:/student/exam/examList";
    }

    @RequestMapping("/student/fileList")
    public String fileList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        System.out.println("courseId:"+courseId);
        int userId=(int)session.getAttribute("userId");
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);

        List<String> statement=new ArrayList<>();
        for(CourseUnit cu:courseUnitList)
        {
            int unitId=cu.getId();
            int minute, second;
            if(session.getAttribute("minute"+unitId)!=null)   //服务器session中是否存在时间进度
            {
                minute=Integer.parseInt(session.getAttribute("minute"+unitId).toString().trim());
                second=Integer.parseInt(session.getAttribute("second"+unitId).toString().trim());
            }
           else if(courseUnitDao.ut(userId,unitId)!=null)    //数据库中是否有时间进度
            {
                minute = courseUnitDao.ut(userId, unitId).getMinute();
                second = courseUnitDao.ut(userId, unitId).getSecond();
            }
            else {
                minute=0;                         //第一次进入  时间进度置0
                second=0;
            }
           cu.setDescription(minute+"m "+second+"s");

        }

        model.addAttribute("message", statement);
        return "student/files";
    }


    @RequestMapping("/student/oneUnit/{unitId}")
    public String unitfileList(@PathVariable("unitId") int unitId, Model model,HttpSession session,HttpServletRequest request) {
        List<CourseFile> unitFiles=courseFileDao.findUnitFileByCourseUnit(unitId);
        model.addAttribute("unitFiles", unitFiles);
        double longtime=courseUnitDao.getUnitTime(unitId).getSpendTime();
        int minutes=(int)longtime*60;
        int userId=(int)session.getAttribute("userId");
        session.setAttribute("unitId",unitId);
        UnitTime ut= courseUnitDao.ut(userId,unitId);
        if(session.getAttribute("minute"+unitId)==null)
        {
            if(ut!=null) {
                model.addAttribute("minute", ut.getMinute());   //session 中没有记录，读取数据库
                model.addAttribute("second", ut.getSecond());
            }else{
                model.addAttribute("minute", 0);  //没有session ，数据库没记录，时间记为0
                model.addAttribute("second", 0);
            }
        }
        else{                                                  //session 中有记录，直接读取

            model.addAttribute("minute",session.getAttribute("minute"+unitId));
            model.addAttribute("second",session.getAttribute("second"+unitId));
        }

     //  System.out.println("time:"+ut.getMinute()+ut.getSecond()+" toll: "+minutes);
        model.addAttribute("minutes",minutes );


        return "student/unitFiles";
    }


    @RequestMapping(value="/student/time",method = RequestMethod.POST)
    @ResponseBody
    public String timeControl(@RequestBody UnitTime ut,HttpSession session) {
        System.out.println("执行course/student/time");

     //   System.out.println("TimeContro："+minute+second);
        session.setAttribute("minute"+session.getAttribute("unitId"),ut.getMinute());
        session.setAttribute("second"+session.getAttribute("unitId"),ut.getSecond());
        return "success";

    }

    @RequestMapping(value="/student/example",method = RequestMethod.POST)
    @ResponseBody
    public String example(@RequestBody UnitTime ut,HttpSession session) {
        System.out.println("执行course/student/example");

        //   System.out.println("TimeContro："+minute+second);
        return "successful";

    }
   /* @RequestMapping("/student/fileDetail")
    public String fileDetail(Model model) {
        String url = "https://minds.wisconsin.edu/bitstream/handle/1793/23487/Spring07.pdf?sequence=1";
        model.addAttribute("file", url);
        return "common/viewer";
    }*/

    @RequestMapping("/student/audit")
    public String auditScore(){
       List<User> userlist=userDao.findAll();
        for(User u:userlist){
            if(u.getRole()==1){
                List<UserCourse> us=userCourseDao.findUserCoursesByUserId(u.getId());
                for(UserCourse usercourse:us){
                    int state=usercourse.getState();
                      int userId=u.getId();
                      int courseId=usercourse.getCourseId();
                      List<ExamResult> examResultList = examResultDao.getByCourseIdAndUserId(courseId, userId);
                      for(ExamResult ex:examResultList){
                          double score=0;
                          score+=ex.getScore();
                          if(score>60)
                              state=1;
                    }
                    userCourseDao.update(userId,courseId,state);

                }


            }
        }


        return "teacher/achievement";
    }
}
