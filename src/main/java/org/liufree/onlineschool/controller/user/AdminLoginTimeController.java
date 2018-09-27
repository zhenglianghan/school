package org.liufree.onlineschool.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by hama on 2018/9/27.
 */
@Controller
@RequestMapping("/admin")
public class AdminLoginTimeController {
    @RequestMapping("/login_log")
    public String login_log(){
        return "admin/login_log";
    }
}
