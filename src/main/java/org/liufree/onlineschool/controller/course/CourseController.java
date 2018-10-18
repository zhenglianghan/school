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
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.liufree.onlineschool.service.course.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;
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
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);

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
        if(session.getAttribute("minute")==null)
        {
            model.addAttribute("minute", ut.getMinute());
            model.addAttribute("second", ut.getSecond());
        }
        else{
            model.addAttribute("minute",session.getAttribute("minute"));
            model.addAttribute("second",session.getAttribute("second"));
        }

     //  System.out.println("time:"+ut.getMinute()+ut.getSecond()+" toll: "+minutes);
        model.addAttribute("minutes",minutes );


        return "student/unitFiles";
    }
    @ResponseBody
    @RequestMapping(value="/student/time",method = RequestMethod.POST)
    public String timeContro(HttpSession session,HttpServletRequest request) {
        String minute=request.getParameter("minu");
        String second=request.getParameter("secon");
        System.out.println("TimeContro"+minute+second);
        session.setAttribute("minute",minute);
        session.setAttribute("second",second);
        return "success!";

    }
   /* @RequestMapping("/student/fileDetail")
    public String fileDetail(Model model) {
        String url = "https://minds.wisconsin.edu/bitstream/handle/1793/23487/Spring07.pdf?sequence=1";
        model.addAttribute("file", url);
        return "common/viewer";
    }*/
}
