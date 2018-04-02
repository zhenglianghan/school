package org.liufree.onlineschool.dao.course;

import org.liufree.onlineschool.bean.course.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */
public interface CourseDao extends JpaRepository<Course, Integer> {

    @Query("select c from Course c where c.grade.id=:gradeId")
    List<Course> getCoursesByGradeId(@Param("gradeId") int gradeId);

    @Query("select c.title from Course c where c.teacher.id=:teacherId")
    List<Course> getCourseListByTeacherId(@Param("teacherId") int teacherId);

    Course findByTitle(@Param("title") String title);


    @Query("select  c from  Course  c where c.teacher.id=:teacherId")
    List<Course> findByTeacher(@Param("teacherId") int teacherId);

    @Query("select c from Course c where  c.teacher.id=:teacherId and c.title=:title")
    Course findByTitleAndTeacher(@Param("title") String title,@Param("teacherId") int teacherId);
}
