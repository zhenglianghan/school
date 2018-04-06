package org.liufree.onlineschool.bean.exam;

import lombok.Data;

import javax.persistence.ManyToOne;

/**
 * @author lwx
 * @date 4/6/18
 * @email liufreeo@gmail.com
 */
@Data
public class ExamResultQuestionDto {

    int id;
    

    @ManyToOne
    Question question;         //题目id
    int sort;               //题目排序，第几道题
    double itemScore;       //每题分数
}
