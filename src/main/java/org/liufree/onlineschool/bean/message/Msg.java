package org.liufree.onlineschool.bean.message;

import org.liufree.onlineschool.bean.user.User;

import javax.persistence.*;
import java.util.Date;

/**
 * @author lwx
 * @date 3/29/18
 * @email liufreeo@gmail.com
 */
@Table(name = "msg")
public class Msg {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String subject;             //主题
    String content;             //内容

    @OneToOne
    User sender;                 //发送者Id
    @OneToOne
    User receiver;              //收到者Id
    /*
      int msgId;                  //父级消息消息Id,便于回复;0表示根消息*/
    int status;                 //0未读，1已读；默认为0
    Date createTime;           //创建时间
}
