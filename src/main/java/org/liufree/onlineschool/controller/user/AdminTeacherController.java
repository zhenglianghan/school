package org.liufree.onlineschool.controller.user;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.controller.common.Config;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lwx
 * @date 3/15/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/admin")
public class AdminTeacherController {

    @Autowired
    UserDao userDao;
    @Autowired
    CourseDao courseDao;

    @RequestMapping("/teacher/addPage")
    public String addPage() {
        return "admin/teacher_add";
    }

    @PostMapping("/teacher/add")
    public String add(User teacher) {
        teacher.setRole(2);   //设置为老师
        userDao.save(teacher);
        return "redirect:/admin/teacher/teacherList";
    }

    @RequestMapping("/teacher/teacherList")
    public String teacherList(Model model, HttpSession session) {

        List<Course> courseList = courseDao.findAll();
        List<User> teacherList = userDao.getListByRole(Config.isTeacher);
        model.addAttribute("courseList", courseList);
        model.addAttribute("teacherList", teacherList);
        return "admin/teacher_management";
    }

    @RequestMapping("/teacher/updatePage/{teacherId}")
    public String updatePage(@PathVariable("teacherId") int teacherId, Model model) {
        User teacher = userDao.getOne(teacherId);
        model.addAttribute("teacher", teacher);
        return "admin/teacher_change";
    }

    @PostMapping("/teacher/update/{teacherId}")
    public String update(@PathVariable("teacherId") int teacherId, User teacher, Model model) {
        User user = userDao.getOne(teacherId);
        user.setUsername(teacher.getUsername());
        user.setCountry(teacher.getCountry());
        user.setAddress(teacher.getAddress());
        user.setEmail(teacher.getEmail());
        user.setSex(teacher.getSex());
        user.setPostalCode(teacher.getPostalCode());
        userDao.save(user);
        return "redirect:/admin/teacher/teacherList";
    }

    @RequestMapping("/teacher/delete/{teacherId}")
    public String delete(@PathVariable("teacherId") int teacherId) {
        userDao.deleteById(teacherId);
        return "redirect:/admin/teacher/teacherList";
    }
}
