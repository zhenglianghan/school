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
@Table(name = "exam_question")
public class ExamQuestion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    int examId;             //

    @ManyToOne
    Question question;         //题目id
    int sort;               //题目排序，第几道题
    double itemScore;       //每题分数
}
