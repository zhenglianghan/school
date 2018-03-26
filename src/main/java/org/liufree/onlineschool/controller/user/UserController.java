package org.liufree.onlineschool.controller.user;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.controller.common.Config;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */
@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    UserDao userDao;
    @Autowired
    CourseDao courseDao;

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "user/register";
    }


    @RequestMapping("/loginPage")
    public String loginPage() {
        return "user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user) {
        user.setRole(Config.isStudent);
        user.setCreateTime(new Date());
        userDao.save(user);
        return "redirect:/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session) {
        String email = user.getEmail();
        String password = user.getPassword();
        User mUser = userDao.findTopByEmailAndPassword(email, password);

        if (mUser != null) {
            session.setAttribute("userId", mUser.getId());
            session.setAttribute("username", mUser.getUsername());
            session.setAttribute("user", mUser);
            int role = mUser.getRole();
            if (role == Config.isStudent || role == Config.isTeacher) {
                return "redirect:/user/courseList";
            } else if (role == Config.isAdmin) {
                return "redirect:/admin/course/courseList";
            }
        }
        return "/";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userId");
        session.removeAttribute("username");
        session.removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping(value = "/information")
    public String information(Model model, HttpSession session) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userDao.getOne(userId);
        model.addAttribute("user", user);
        return "user/information";
    }

    @RequestMapping(value = "/information/updatePage")
    public String informationUpdatePage(HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user = userDao.getOne(userId);
        model.addAttribute("user", user);
        return "user/information_update";
    }

    @RequestMapping(value = "/information/update", method = RequestMethod.POST)
    public String informationUpdate(User user, HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user1 = userDao.getOne(userId);
        user1.setFirstName(user.getFirstName());
        user1.setLastName(user.getLastName());
        user1.setEmail(user.getEmail());
        user1.setCountry(user.getCountry());
        user1.setSex(user.getSex());
        user1.setAddress(user.getAddress());
        user1.setMobile(user.getMobile());
        //
        userDao.save(user1);
        model.addAttribute("user1", user1);
        return "user/information";
    }

    @RequestMapping("/courseList")
    public String courseList(HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        List<Course> courseList = userDao.getCourseListByUserId(userId);
        model.addAttribute("courseList", courseList);
        return "user/start";
    }

}
