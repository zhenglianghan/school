package org.liufree.onlineschool.dao.user;

import org.hibernate.sql.Update;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.UserCourse;
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
public interface UserCourseDao extends JpaRepository<UserCourse, Integer> {

    UserCourse findTopByUserIdAndCourseId(int userId, int courseId);

    List<UserCourse> findUserCoursesByCourseId(int courseId);

    List<UserCourse> findUserCoursesByUserId(int userId);

    @Transactional
    @Query(nativeQuery = true,value="update user_course us set us.state= :state where us.userId= :userId and us.courseId= :courseId ")
    @Modifying
    void update(@Param("userId")int userId,@Param("courseId")int courseId,@Param("state")int state);
}
