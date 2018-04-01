package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.course.Grade;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.UserCourse;
import org.liufree.onlineschool.controller.common.Config;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.GradeDao;
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author lwx
 * @date 3/15/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/admin")
public class AdminCourseController {

    @Autowired
    CourseDao courseDao;
    @Autowired
    GradeDao gradeDao;
    @Autowired
    UserDao userDao;
    @Autowired
    UserCourseDao userCourseDao;

    @RequestMapping("/course/courseList")
    public String courseList(Model model) {
        List<Course> courseList = courseDao.findAll();
        model.addAttribute("courseList", courseList);
        return "admin/course_management";
    }

    @RequestMapping("/course/addPage")
    public String courseAdd(Model model) {

        List<Grade> gradeList = gradeDao.findAll();
        List<User> teacherList = userDao.getListByRole(Config.isTeacher);
        model.addAttribute("gradeList", gradeList);
        model.addAttribute("teacherList", teacherList);
        return "admin/course_add";
    }

    @PostMapping("/course/add")
    public String add(Course course, Model model) {

        String title = course.getTitle();
        int teacherId = course.getTeacher().getId();
        Course course11 = courseDao.findByTitleAndTeacher(title,teacherId);
        if (course11 != null) {
            model.addAttribute("msg", "have already added");
            return "forward:/admin/course/addPage";
        }
        Course course1 = courseDao.save(course);
        int courseId = course1.getId();
        int userId = course.getTeacher().getId();
        UserCourse userCourse = new UserCourse();
        userCourse.setCourseId(courseId);
        userCourse.setUserId(userId);
        userCourseDao.save(userCourse);
        return "redirect:/admin/course/courseList";
    }

    @RequestMapping("/course/delete/{courseId}")
    public String delete(@PathVariable("courseId") int courseId) {
        courseDao.deleteById(courseId);
        return "redirect:/admin/course/courseList";
    }

    @RequestMapping("/course/updatePage/{courseId}")
    public String updatePage(@PathVariable("courseId") int courseId, Model model) {
        Course course = courseDao.getOne(courseId);
        List<Grade> gradeList = gradeDao.findAll();
        List<User> teacherList = userDao.getListByRole(Config.isTeacher);
        model.addAttribute("teacherList", teacherList);
        model.addAttribute("gradeList", gradeList);
        model.addAttribute("course", course);
        return "admin/course_change";
    }

    @PostMapping("/course/update/{courseId}")
    public String update(@PathVariable("courseId") int courseId, Course course, Model model) {
        Course mCourse = courseDao.getOne(courseId);
        mCourse.setTitle(course.getTitle());
        mCourse.setTeacher(course.getTeacher());
        mCourse.setGrade(course.getGrade());
        mCourse.setPrice(course.getPrice());
        mCourse.setDescription(course.getDescription());
        courseDao.save(mCourse);
        return "redirect:/admin/course/courseList";
    }
}
