package org.liufree.onlineschool.dao.course;

import org.liufree.onlineschool.bean.course.CourseFile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lwx
 * @date 6/26/17
 * @email liufreeo@gmail.com
 */
public interface CourseFileDao extends JpaRepository<CourseFile, Integer> {


    List<CourseFile> findCourseFileByCourseId(@Param("courseId") int courseId);

    @Query("select cf from  CourseFile cf where cf.courseUnit.id =:unitId")
    List<CourseFile> findCourseFileByCourseUnit(@Param("unitId") int unitId);

    @Query("select cf from  CourseFile cf where cf.courseUnit.id =:unitId")
    List<CourseFile> findUnitFileByCourseUnit(@Param("unitId") int unitId);

    @Query("select count(*) from CourseFile cf where cf.courseId=:fileId")
    int findByFileId(@Param("fileId") int fileId);

    @Transactional
    @Query(nativeQuery = true,value="insert into file_time(id,userId,fileId,time) values(?,?,?,?)")
    @Modifying
    void setTime(@Param("id") int id,@Param("userId") int userId,@Param("fileId") int fileId,@Param("time") double time);

}
