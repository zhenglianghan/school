package org.liufree.onlineschool.service.course;

import org.liufree.onlineschool.bean.user.UserCourse;
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lwx
 * @date 3/24/18
 * @email liufreeo@gmail.com
 */
@Service
public class CourseService {

    @Autowired
    UserCourseDao userCourseDao;

    /**
     * 重複添加課程
     */
    public boolean studentHaveCourse(int userId, int courseId) {

        UserCourse userCourse = userCourseDao.findTopByUserIdAndCourseId(userId, courseId);
        return userCourse == null ? false : true;
    }

}
