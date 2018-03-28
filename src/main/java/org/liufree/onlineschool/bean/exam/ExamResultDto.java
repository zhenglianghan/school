package org.liufree.onlineschool.bean.exam;

import lombok.Data;

/**
 * @author lwx
 * @date 3/28/18
 * @email liufreeo@gmail.com
 */
@Data
public class ExamResultDto {

    String title;
    String time;
    String percent;
    String testScore;
    String finalScore;
}
