package org.liufree.onlineschool.dao.course;
import org.liufree.onlineschool.bean.course.UnitTime;
import org.liufree.onlineschool.bean.course.CourseUnit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lwx
 * @date 3/20/18
 * @email liufreeo@gmail.com
 */
public interface CourseUnitDao extends JpaRepository<CourseUnit, Integer> {


    @Query("select cu from CourseUnit cu where cu.course.id=:courseId order by sort asc")
    List<CourseUnit> getListByCourseIdOrderBySort(@Param("courseId") int courseId);

    @Query("select cu from CourseUnit cu where cu.sort=:unitId order by sort asc")
    List<CourseUnit> getListByUnitIdOrderBySort(@Param("unitId") int unitId);

    @Query("select cu from CourseUnit cu where course.id=:courseId")
    List<CourseUnit> getUnitNum(@Param("courseId") int courseId);


    List<CourseUnit> getCourseUnitsBySortAfter(@Param("sort") int sort);

    @Query("select t from UnitTime t where t.userId=:userId and t.unitId=:unitId")
    UnitTime ut(@Param("userId") int userId,@Param("unitId") int unitId);

    @Query("select cu from CourseUnit cu where id=:unitId")
    CourseUnit getUnitTime(@Param("unitId") int unitId);

    @Transactional
    //@Query(nativeQuery = true,value="insert into UnitTime x(userId,unitId,minute,second) values(?1,?2,?3,?4)")
    @Modifying
    @Query(nativeQuery = true,value = "insert into file_time(userId,unitId, minute, second) values (?1,?2,?3,?4)")
    void setTime(@Param("userId") int userId, @Param("unitId") int unitId, @Param("minute") int minute, @Param("second") int second);

    @Query("select count(ft) from UnitTime ft where ft.userId=:userId and ft.unitId=:unitId")
    Integer findNumTime(@Param("userId") int userId,@Param("unitId") int unitId);

    @Modifying
    @Transactional
    @Query("delete from UnitTime es where es.userId = ?1 and es.unitId = ?2")
    int deleteByEgId(int userId,int unitId);

    //@Query("select ut from UnitTime ut where ut.userId= ?1")
    //List<UnitTime> findAllByuserandAndCourse(int userId);

    @Query("select cu from CourseUnit cu")
    List<CourseUnit> findAllByUnitId();
    /*
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value="update file_time ut  set ut.minute=:minute and ut.second=:second where ut.userId=:userId and ut.unitId=:unitId",nativeQuery = true)
    void updateTime(@Param("userId") int userId, @Param("unitId") int unitId, @Param("minute") int minute, @Param("second") int second);
    */

}
