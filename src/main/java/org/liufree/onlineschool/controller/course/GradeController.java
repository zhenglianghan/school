package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.course.CourseDto;
import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.liufree.onlineschool.dao.course.GradeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
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

    @Autowired
    CourseUnitDao courseUnitDao;

    @RequestMapping("/{gradeId}")
    public String getCoursesByGrade(@PathVariable("gradeId") Integer gradeId, Model model) {
        List<Course> courseList = courseDao.getCoursesByGradeId(gradeId);
        List<CourseDto> courseDtoList = new ArrayList<>();
        double sum=0;
        for (Course course : courseList) {
            CourseDto courseDto = new CourseDto();
            List<CourseUnit> courseUniList = courseUnitDao.getListByCourseId(course.getId());
            for (CourseUnit courseUnit : courseUniList) {
                sum = courseUnit.getSpendTime()+sum;
            }
            courseDto.setHours(sum);
            courseDto.setCourseName(course.getTitle());
            courseDto.setTeacher(course.getTeacher().getUsername());
            courseDto.setCourseId(course.getId());
            courseDto.setPrice(course.getPrice());
            courseDtoList.add(courseDto);
        }

        model.addAttribute("courseDtoList", courseDtoList);
        model.addAttribute("courseList", courseList);
        return "course/courses_grade";
    }
}
