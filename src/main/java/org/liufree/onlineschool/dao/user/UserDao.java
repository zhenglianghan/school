package org.liufree.onlineschool.dao.user;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */
@Service
public interface UserDao extends JpaRepository<User, Integer> {

    User findTopByEmail(@Param("email") String email);

    @Query("select u from User u where email=:email and password=:password")
    User login(String email, String password);

    @Query("select u from User u where role=:role")
    List<User> getListByRole(@Param("role") int role);




    User findTopByEmailAndPassword(String email, String password);

    @Query("select c from User u,Course c,UserCourse uc where uc.userId=:userId and c.id=uc.courseId and u.id=:userId")
    List<Course> getCourseListByUserId(@Param("userId") int userId);
}
