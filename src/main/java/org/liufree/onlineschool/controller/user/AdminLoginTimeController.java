package org.liufree.onlineschool.controller.user;
import org.liufree.onlineschool.bean.user.Log;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;
/**
 * Created by hama on 2018/9/27.
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginTimeController {

    @Autowired
    UserDao userDao;

    @RequestMapping("/login_log")
    public String login_log(Model model, HttpSession session){


        List<Log> list=userDao.selectLog();
        model.addAttribute("list", list);
        return "admin/login_log";
    }
}
