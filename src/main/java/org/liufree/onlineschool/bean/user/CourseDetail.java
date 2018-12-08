package org.liufree.onlineschool.bean.user;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author lwx
 * @date 6/1/17
 * @email liufreeo@gmail.com
 */
@Entity
@Data

public class CourseDetail {       //用户和课程相关联，如果是学生，则是学生所选到科目
    //如果是老师，则是老师所教的科目

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    int userId;
    int courseId;
    String courseName;
    String UserName;
    double credit;
    int state;        //获得学分状态  0表示未获得学分 ，1 表示获得学分
}