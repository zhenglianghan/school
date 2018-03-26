package org.liufree.onlineschool.dao.course;

import org.liufree.onlineschool.bean.course.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */
public interface GradeDao extends JpaRepository<Grade, Integer> {


    @Query("select g from Grade g where g.gradeName=:gradeName")
    List<Grade> gradeListBygradeName(String gradeName);

    Grade findTopByGradeName(String gradeName);
}
