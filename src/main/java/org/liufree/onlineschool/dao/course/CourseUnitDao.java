package org.liufree.onlineschool.dao.course;

import org.liufree.onlineschool.bean.course.CourseUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author lwx
 * @date 3/20/18
 * @email liufreeo@gmail.com
 */
public interface CourseUnitDao extends JpaRepository<CourseUnit, Integer> {


    @Query("select cu from CourseUnit cu where cu.course.id=:courseId")
    List<CourseUnit> getListByCourseId(@Param("courseId") int courseId);


}
