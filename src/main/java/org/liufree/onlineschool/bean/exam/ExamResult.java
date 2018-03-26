package org.liufree.onlineschool.bean.exam;

import lombok.Data;

import javax.persistence.*;
import java.math.BigInteger;
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

    @OneToOne
    Exam exam;

    double score;           //最后得分
    int userId;             //学生id

    int status;              //状态，判断是否已批改，0为未批改，1为已批改
    Date time;              //时间


}
