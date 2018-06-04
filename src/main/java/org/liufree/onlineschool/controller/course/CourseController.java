package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
        List<CourseFile> courseFileList = courseFileDao.findCourseFileByCourseId(courseId);
        model.addAttribute("courseFileList", courseFileList);
        return "student/files";
    }
}
