package org.liufree.onlineschool.controller.Message;

import org.liufree.onlineschool.bean.message.Msg;
import org.liufree.onlineschool.dao.user.MsgDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Action;
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

    @RequestMapping("/msgList")
    public String msgList(HttpSession session,Model model){

        int userId = (Integer) session.getAttribute("userId");
        return null;
    }

}
