package org.liufree.onlineschool.bean.course;

import lombok.Data;
import org.liufree.onlineschool.bean.user.User;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */

@Entity
@Data
@Table(name = "course")
public class Course {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    Grade grade;            //所属年级id

    String title;           //标题
    String description;     //描述
    int type;               //课程类型
    String pic;             //课程图片
    double price;           //价格
    //  int buyCount;           //销售数量
    Date createTime;       //创建时间
    Date updateTime;      //更新时间
    double credit;             //学分

    @ManyToOne(fetch = FetchType.EAGER)
    User teacher;         //老师     就是userId



}
