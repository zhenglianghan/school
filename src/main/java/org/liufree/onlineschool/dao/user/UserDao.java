package org.liufree.onlineschool.dao.user;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.bean.user.Log;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.sql.Timestamp;

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

    @Query("select u from User u where u.email=:email")
    User getUserList(@Param("email") String  email);

    @Transactional
    @Query(nativeQuery = true,value="insert into log(userName,role,loginTime,logoutTime,duration) values(?1,?2,?3,?4,?5) ")
    @Modifying
     void loginTime(@Param("userName") String userName,@Param("role") String role,@Param("loginTime") Timestamp loginTime,@Param("logoutTime") Timestamp logoutTime,@Param("duration") String duration);


    User findTopByEmailAndPassword(String email, String password);

    @Query("select c from User u,Course c,UserCourse uc where uc.userId=:userId and c.id=uc.courseId and u.id=:userId")
    List<Course> getCourseListByUserId(@Param("userId") int userId);

    @Query("select l from Log l order by l.id desc ")
    List<Log> selectLog();
}
