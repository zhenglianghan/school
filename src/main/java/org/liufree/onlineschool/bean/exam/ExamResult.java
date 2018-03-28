package org.liufree.onlineschool.bean.exam;

import lombok.Data;
import org.liufree.onlineschool.bean.user.User;

import javax.persistence.*;
import java.util.Date;

/**
 * @author lwx
 * @date 5/28/17
 * @email liufreeo@gmail.com
 */
@Entity
@Data
@Table(name = "exam_result")
public class ExamResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    int courseId;           //课程id

    @ManyToOne
    Exam exam;              //对应那场考试

    double score;           //最后得分

    @OneToOne
    User user;             //学生id

    int status;              //状态，判断是否已批改，0为未做，1为已做，2为已批改
    Date time;              //时间


}
