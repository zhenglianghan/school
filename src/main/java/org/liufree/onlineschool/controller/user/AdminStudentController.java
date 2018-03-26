package org.liufree.onlineschool.controller.user;

import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.controller.common.Config;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/18/18
 * @email liufreeo@gmail.com
 */

@Controller
@RequestMapping("/admin")
public class AdminStudentController {


    @Autowired
    UserDao userDao;

    @RequestMapping("/student/addPage")
    public String addPage() {
        return "admin/student_add";
    }

    @PostMapping("/student/add")
    public String add(User teacher) {
        teacher.setRole(Config.isStudent);   //设置为学生
        teacher.setCreateTime(new Date());
        userDao.save(teacher);
        return "redirect:/admin/student/studentList";
    }

    @RequestMapping("/student/studentList")
    public String studentList(Model model) {
        List<User> studentList = userDao.getListByRole(Config.isStudent);
        model.addAttribute("studentList", studentList);
        return "admin/student_management";
    }

    @RequestMapping("/student/updatePage/{teacherId}")
    public String updatePage(@PathVariable("teacherId") int teacherId, Model model) {
        User teacher = userDao.getOne(teacherId);
        model.addAttribute("teacher", teacher);
        return "admin/student_change";
    }

    @PostMapping("/student/update/{teacherId}")
    public String update(@PathVariable("teacherId") int teacherId, User teacher, Model model) {
        return null;
    }

}
