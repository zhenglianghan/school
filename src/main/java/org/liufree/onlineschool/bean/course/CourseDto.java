package org.liufree.onlineschool.bean.course;

import lombok.Data;

/**
 * @author lwx
 * @date 3/31/18
 * @email liufreeo@gmail.com
 */
@Data
public class CourseDto {

    String courseName;

    String teacher;

    int unitNum;

    int studentNum;

    int courseId;
}
