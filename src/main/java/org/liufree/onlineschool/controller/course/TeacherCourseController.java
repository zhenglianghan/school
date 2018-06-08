package org.liufree.onlineschool.controller.course;

import org.liufree.onlineschool.bean.course.Course;
import org.liufree.onlineschool.bean.course.CourseDto;
import org.liufree.onlineschool.bean.course.CourseFile;
import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.bean.exam.Question;
import org.liufree.onlineschool.dao.course.CourseDao;
import org.liufree.onlineschool.dao.course.CourseFileDao;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.liufree.onlineschool.dao.exam.QuestionDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/20/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/teacher")
public class TeacherCourseController {


    @Autowired
    UserDao userDao;
    @Autowired
    CourseUnitDao courseUnitDao;
    @Autowired
    CourseDao courseDao;
    @Autowired
    CourseFileDao courseFileDao;
    @Autowired
    QuestionDao questionDao;

    @RequestMapping("/course/courseList")
    public String courseList(HttpSession session, Model model) {
        int userId = (Integer) session.getAttribute("userId");
        List<Course> courseList = userDao.getCourseListByUserId(userId);

        List<CourseDto> list = new ArrayList<>();
        for (Course course : courseList) {
            CourseDto courseDto = new CourseDto();
            courseDto.setTeacher(course.getTeacher().getEmail());
            courseDto.setCourseId(course.getId());
            courseDto.setCourseName(course.getTitle());
            List<CourseUnit> courseUnitList = courseUnitDao.getUnitNum(course.getId());
            int unitNum = courseUnitList.size();
            courseDto.setUnitNum(unitNum);
            list.add(courseDto);
        }
        model.addAttribute("list", list);

        model.addAttribute("courseList", courseList);
        return "user/start";
    }

    @RequestMapping("/course/{courseId}")
    public String unitList(@PathVariable("courseId") int courseId, HttpSession session, Model model) {
        session.setAttribute("courseId", courseId);
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);
        return "teacher/units";
    }

    @RequestMapping("/course/units/add")
    public String unitAdd(CourseUnit courseUnit, HttpSession session) {
        int courseId = (Integer) session.getAttribute("courseId");
        Course course = courseDao.getOne(courseId);
        courseUnit.setCourse(course);
        courseUnit.setCreateTime(new Date());
        courseUnit.setUpdateTime(new Date());
        if (courseUnit.getSort() == null) {
            courseUnit.setSort(1);
        } else {
            int sort = courseUnit.getSort();

            List<CourseUnit> courseUnitList = courseUnitDao.getCourseUnitsBySortAfter(sort);
            for (CourseUnit courseUnit1 : courseUnitList) {
                int sort1 = courseUnit1.getSort();
                courseUnit1.setSort(++sort1);
                courseUnitDao.save(courseUnit1);
            }
            courseUnit.setSort(++sort);
        }

        courseUnitDao.save(courseUnit);


        return "redirect:/teacher/course/" + courseId;
    }

    @RequestMapping("/course/units/updatePage/{unitId}")
    public String unitUpdatePage(HttpSession session, Model model, @PathVariable("unitId") int unitId) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);
        CourseUnit courseUnit = courseUnitDao.getOne(unitId);
        model.addAttribute("courseUnit", courseUnit);
        model.addAttribute("unitId", unitId);
        return "teacher/units_update";
    }

    @RequestMapping("/course/units/update/{unitId}")
    public String unitUpdate(HttpSession session, @PathVariable("unitId") int unitId, CourseUnit courseUnit) {
        CourseUnit courseUnit1 = courseUnitDao.getOne(unitId);
        courseUnit1.setTitle(courseUnit.getTitle());
        courseUnit1.setDescription(courseUnit.getDescription());
        courseUnit1.setSpendTime(courseUnit.getSpendTime());
        courseUnit1.setUpdateTime(new Date());
        int courseId = (Integer) session.getAttribute("courseId");
        Course course = courseDao.getOne(courseId);
        courseUnit1.setCourse(course);
        courseUnitDao.save(courseUnit1);
        return "redirect:/teacher/course/" + courseId;
    }


    @RequestMapping("/course/units/addPage")
    public String unitAddPage(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<CourseUnit> courseUnits = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnits);
        return "teacher/units_add";
    }

    @RequestMapping("/course/units/delete/{unitId}")
    public String unitDelete(@PathVariable("unitId") int unitId, HttpSession session) {

        List<Question> questionList = questionDao.getQuestionByCourseUnit(unitId);
        for (Question question : questionList) {
            questionDao.delete(question);
        }
        List<CourseFile> courseFileList = courseFileDao.findCourseFileByCourseUnit(unitId);
        for (CourseFile courseFile : courseFileList) {
            courseFileDao.delete(courseFile);
        }
        CourseUnit courseUnit = courseUnitDao.getOne(unitId);
        int sort = courseUnit.getSort();
        List<CourseUnit> courseUnits = courseUnitDao.getCourseUnitsBySortAfter(sort);
        for (CourseUnit courseUnit1 : courseUnits) {
            int sort1 = courseUnit1.getSort();
            sort1--;
            courseUnit1.setSort(sort1);
            courseUnitDao.save(courseUnit1);
        }
        courseUnitDao.deleteById(unitId);

        int courseId = (Integer) session.getAttribute("courseId");
        return "redirect:/teacher/course/" + courseId;
    }


    @RequestMapping("/detail/{courseId}")
    public String courseDetail(@PathVariable("courseId") int courseId, Model model) {

        // Course course = courseDao.getOne(courseId);
        //  model.addAttribute("course", course);
       /* Course course = courseDao.findOne(courseId);

        List<CourseUnit> courseUnitList = courseUnitDao.getCourseUnitListByCourseId(courseId);
        model.addAttribute("course", course);
        model.addAttribute("courseUnitList", courseUnitList);*/
        return "course/course_detail";
    }

   /* @RequestMapping("/student/add/{courseId}")  //学生注册该课程
    public String studentAdd(@PathVariable("courseId") int courseId, Model model, HttpSession session) {

        int userId = (Integer) session.getAttribute("userId");
        UserCourse userCourse = new UserCourse();
        userCourse.setUserId(userId);
        userCourse.setCourseId(courseId);
        userCourseDao.save(userCourse);
        return "redirect:/course/courseList";

    }*/

    @RequestMapping("/fileList")
    public String fileList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<CourseFile> courseFileList = courseFileDao.findCourseFileByCourseId(courseId);
        model.addAttribute("courseFileList", courseFileList);
        return "teacher/files";
    }

    @RequestMapping("/addFilePage")
    public String addFilePage(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseIdOrderBySort(courseId);
        model.addAttribute("courseUnitList", courseUnitList);
        return "teacher/file_add";
    }

    @RequestMapping(value = "/addFile", method = RequestMethod.POST)
    public String addFile(HttpSession session, @RequestParam(value = "courseFile.url", required = false) MultipartFile file, HttpServletRequest request, CourseFile courseFile, Model model) {
        System.out.println("开始");
        String path = request.getSession().getServletContext().getRealPath("/upload");
        String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
        String filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
        double msize = (double) file.getSize();
        double size = msize / 1024 / 1024;
        BigDecimal bg = new BigDecimal(size);
        size = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        System.out.println(size);

        System.out.println(path);
        File targetFile = new File(path, filename);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        courseFile.setTime(new Date());
        String url = request.getContextPath() + "/upload/" + filename;
        /*String title = courseFile.getTitle();
        title = title+ type;
        courseFile.setTitle(title);*/
        courseFile.setSize(size);
        courseFile.setUrl(url);
        courseFile.setCourseId((Integer) session.getAttribute("courseId"));
        courseFileDao.save(courseFile);
        return "redirect:/teacher/fileList";
    }

    @RequestMapping("/deleteFile/{id}")
    public String deleteFile(@PathVariable("id") int id) {
        courseFileDao.deleteById(id);
        return "redirect:/teacher/fileList";
    }


}
