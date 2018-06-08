package org.liufree.onlineschool.controller.Message;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.message.Msg;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.UserCourse;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.user.MsgDao;
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/29/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/msg")
public class MsgController {

    @Autowired
    MsgDao msgDao;
    @Autowired
    UserDao userDao;
    @Autowired
    UserCourseDao userCourseDao;
    @Autowired
    CourseDao courseDao;


    @RequestMapping("/msgList")
    public String msgList(HttpSession session, Model model) {

        int userId = (Integer) session.getAttribute("userId");
        List<Msg> msgList = msgDao.findMsgsByReceiverId(userId);
        model.addAttribute("msgList", msgList);
        System.out.println(msgList);
        return "user/inbox";
    }

    @RequestMapping("/composePage")
    public String composePage(HttpSession session, Model model) {
        int userId = (int) session.getAttribute("userId");
        List<Course> courseList = new ArrayList<>();
        List<User> userList = userDao.findAll();
        model.addAttribute("userList", userList);
        List<UserCourse> userCourseList = userCourseDao.findUserCoursesByUserId(userId);
        for (UserCourse userCourse : userCourseList) {
            Course course = courseDao.getOne(userCourse.getCourseId());
            courseList.add(course);
        }
        model.addAttribute("courseList", courseList);
        return "user/compose";
    }

    @RequestMapping("/compose")
    public String compose(Msg msg, HttpSession session, Model model) {
        int senderId = (Integer) session.getAttribute("userId");
        User user = userDao.getOne(senderId);
        msg.setSender(user);

        msg.setCreateTime(new Date());
        msgDao.save(msg);
        return "redirect:/msg/msgList";
    }

    @GetMapping("/readMsg/{msgId}")
    public String readMsg(Model model,@PathVariable("msgId")int msgId) {
        Msg msg = msgDao.getOne(msgId);
        model.addAttribute("msg", msg);
        return "user/read-mail";
    }

    @GetMapping("/getUsers/{courseId}")
    @ResponseBody
    public List<User> getUsers(@PathVariable("courseId") int courseId) {
        List<User> userList = new ArrayList<>();
        List<UserCourse> userCourseList = userCourseDao.findUserCoursesByCourseId(courseId);
        for (UserCourse userCourse : userCourseList) {
            int userId = userCourse.getUserId();
            User user = userDao.getOne(userId);
            userList.add(user);
        }
        return userList;
    }

    @GetMapping("/delete/{msgId}")
    public String delete(Model model, @PathVariable("msgId") int msgId) {
        msgDao.deleteById(msgId);
        return "redirect:/msg/msgList";
    }
}
