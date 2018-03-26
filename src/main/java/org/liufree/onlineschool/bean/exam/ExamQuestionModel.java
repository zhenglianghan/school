package org.liufree.onlineschool.bean.exam;

import lombok.Data;

import java.util.List;

/**
 * @author lwx
 * @date 6/9/17
 * @email liufreeo@gmail.com
 */
@Data
public class ExamQuestionModel {

    public Exam exam;
    public List<ExamQuestion> examQuestionList;
}
