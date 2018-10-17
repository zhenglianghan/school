package org.liufree.onlineschool.controller.user;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.course.CourseDto;
import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.common.MD5Util;
import org.liufree.onlineschool.controller.common.Config;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Timestamp;
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
    @Autowired
    CourseUnitDao courseUnitDao;

    @RequestMapping("/registerPage")
    public String registerPage() {
        return "user/register";
    }


    @RequestMapping("/loginPage")
    public String loginPage() {
        return "user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user, Model model) {
        User mUser = userDao.findTopByEmail(user.getEmail());
        if (mUser != null) {
            model.addAttribute("info", "have already registered");
            return "redirect:/user/registerPage";
        }
        String password = user.getPassword();
        password = MD5Util.string2MD5(password);
        user.setPassword(password);
        user.setRole(Config.isStudent);
        user.setCreateTime(new Date());
        userDao.save(user);
        return "redirect:/user/loginPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session) {
        String email = user.getEmail();
        String password = user.getPassword();
        password = MD5Util.string2MD5(password);
        User mUser = userDao.findTopByEmailAndPassword(email, password);

        if (mUser != null) {
            session.setAttribute("userId", mUser.getId());
            session.setAttribute("username", mUser.getUsername());
            session.setAttribute("user", mUser);

            int role = mUser.getRole();
            if (role == Config.isStudent || role == Config.isTeacher) {
                User u= userDao.getUserList(user.getEmail());
                Date date=new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());
                System.out.println(" 登录时间： "+timeStamp);
//                userDao.loginTime(u.getFirstName(),user.getRole(),timeStamp,null);
                session.setAttribute("loginTime", timeStamp);
                session.setAttribute("role", role);
                return "redirect:/user/courseList";
            } else if (role == Config.isAdmin) {
                return "redirect:/admin/course/courseList";
            }
        }
        model.addAttribute("info", "your password or email is wrong");
        return "forward:/user/loginPage";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
//        session.removeAttribute("userId");
//        session.removeAttribute("username");
//        session.removeAttribute("user");
        session.invalidate();
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
    public String informationUpdate(User user, BindingResult bindingResult, HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        User user1 = userDao.getOne(userId);
        user1.setFirstName(user.getFirstName());
        user1.setMobile(user.getMobile());
        user1.setLastName(user.getLastName());
        user1.setEmail(user.getEmail());
        user1.setPassword(user.getPassword());
        user1.setCountry(user.getCountry());
        user1.setSex(user.getSex());
        user1.setAddress(user.getAddress());
        user1.setMobile(user.getMobile());
        user1.setPic(user.getPic());
        //
        userDao.save(user1);
        session.setAttribute("user", user1);
        model.addAttribute("user1", user1);
        return "user/information";
    }

    @RequestMapping("/courseList")
    public String courseList(HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        List<Course> courseList = userDao.getCourseListByUserId(userId);

        List<CourseDto> list = new ArrayList<>();
        for (Course course : courseList) {
            CourseDto courseDto = new CourseDto();
            courseDto.setTeacher(course.getTeacher().getEmail());
            courseDto.setCourseId(course.getId());
            courseDto.setCourseName(course.getTitle());
            List<CourseUnit> courseUnitList = courseUnitDao.getUnitNum(course.getId());

            int unitNum = courseUnitList.size();
            courseDto.setUnitNum(unitNum);
            list.add(courseDto);
        }
        model.addAttribute("list", list);
        return "user/start";
    }

}
