package org.liufree.onlineschool.bean.user;

import lombok.Data;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Data
@Table(name = "Log")
public class Log {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String username;
    Timestamp loginTime;       //登录时间
    Timestamp logoutTime;      //注销时间
    String role;
    String duration;          //持续登录时间


}
