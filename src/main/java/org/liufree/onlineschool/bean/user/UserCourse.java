package org.liufree.onlineschool.bean.user;

import lombok.Data;

import javax.persistence.*;

/**
 * @author lwx
 * @date 6/1/17
 * @email liufreeo@gmail.com
 */
@Entity
@Data
@Table(name = "user_course")
public class UserCourse {       //用户和课程相关联，如果是学生，则是学生所选到科目
                                    //如果是老师，则是老师所教的科目

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    int userId;
    int courseId;
}
