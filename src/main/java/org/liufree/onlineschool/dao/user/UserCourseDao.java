package org.liufree.onlineschool.dao.user;

import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.UserCourse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

/**
 * @author lwx
 * @date 3/20/18
 * @email liufreeo@gmail.com
 */
public interface UserCourseDao extends JpaRepository<UserCourse, Integer> {

    UserCourse findTopByUserIdAndCourseId(int userId, int courseId);

}
