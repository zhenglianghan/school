package org.liufree.onlineschool.bean.exam;

import lombok.Data;

import javax.persistence.*;

/**
 * @author lwx
 * @date 5/28/17
 * @email liufreeo@gmail.com
 */
@Entity
@Data
@Table(name = "exam_result_question")
public class ExamResultQuestion {           //考试答题情况表

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @OneToOne
    ExamResult examResult;       //加上这个作为外键，定位到是哪一次的考试做题

    @OneToOne
    Exam exam;

    int userId;             //userId

    @OneToOne
    Question question;         //问题id

    String answer;          //这个questionId，该userId回答的答案
    double itemScore;          //这个题的分数
    Boolean isRight;             //回答正误,正为勾
}
