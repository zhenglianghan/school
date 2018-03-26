package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.GradeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */

@Controller
@RequestMapping("/grade")
public class GradeController {

    @Autowired
    GradeDao gradeDao;
    @Autowired
    CourseDao courseDao;

    @RequestMapping("/{gradeId}")
    public String getCoursesByGrade(@PathVariable("gradeId") Integer gradeId, Model model) {
        List<Course> courseList = courseDao.getCoursesByGradeId(gradeId);
        model.addAttribute("courseList", courseList);
        return "course/courses_grade";
    }
}
