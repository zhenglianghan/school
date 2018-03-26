package org.liufree.onlineschool.controller.index;

import org.liufree.onlineschool.bean.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author lwx
 * @date 3/11/18
 * @email liufreeo@gmail.com
 */

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(HttpSession session) {
        User user = new User();
        session.setAttribute("user",user);
        return "index/index";
    }

    @RequestMapping("/register")
    public String register() {
        return "user/register";
    }

    @RequestMapping("/login")
    public String login() {
        return "user/login";
    }

    @RequestMapping("/school")
    public String school() {

        return "index/school";
    }

    @RequestMapping("/faq")
    public String faq() {
        return "index/faq";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "index/contact";
    }


}
