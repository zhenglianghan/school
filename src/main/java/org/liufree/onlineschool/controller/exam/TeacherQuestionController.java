package org.liufree.onlineschool.controller.exam;

import org.liufree.onlineschool.bean.course.CourseUnit;
import org.liufree.onlineschool.bean.exam.Question;
import org.liufree.onlineschool.dao.course.CourseUnitDao;
import org.liufree.onlineschool.dao.exam.QuestionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lwx
 * @date 3/21/18
 * @email liufreeo@gmail.com
 */


@Controller
@RequestMapping("/teacher")
public class TeacherQuestionController {

    @Autowired
    QuestionDao questionDao;
    @Autowired
    CourseUnitDao courseUnitDao;


    @RequestMapping("/questionList")
    public String questionList(HttpSession session, Model model) {

        int courseId = (Integer) session.getAttribute("courseId");
        List<Question> questionList = questionDao.getQuestionListByCourseId(courseId);
        model.addAttribute("questionList", questionList);

        return "exam/teacher_questions";
    }

    @RequestMapping("/question/addPage")
    public String addPage(Model model, HttpSession session) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<CourseUnit> courseUnitList = courseUnitDao.getListByCourseId(courseId);
        model.addAttribute("courseUnitList", courseUnitList);

        return "exam/question_add";
    }

    @PostMapping("/question/add")
    public String add(Question question, HttpSession session) {
        int courseId = (Integer) session.getAttribute("courseId");
        question.setCourseId(courseId);
        if (question.getOptiona() != null)
            question.setType(1);    //选择题
        else
            question.setType(2);      //主观题
        questionDao.save(question);
        return "redirect:/teacher/questionList";
    }


    @RequestMapping("/question/delete/{id}")
    public String delete(@PathVariable("id") int id) {
        questionDao.deleteById(id);
        return "redirect:/teacher/questionList";
    }

    @RequestMapping("/question/update/{id}")
    public String beforeQuestionUpdate(@PathVariable("id") int id,Model model,HttpSession session) {
      /*  Question question = questionDao.findOne(id);
        model.addAttribute("question", question);
        int courseId = (Integer) session.getAttribute("_courseId");
        List<CourseUnit> courseUnitList = courseUnitDao.getCourseUnitListByCourseId(courseId);//这门课的所有单元

        model.addAttribute("courseUnitList",courseUnitList);
        if (question.getType() == 1) {
            return "teacher/question_update_single";
        }
        return "teacher/question_update_subjective";*/
      return null;
    }

    @RequestMapping(value = "/question/update/{id}", method = RequestMethod.POST)
    public String questionUpdate(@PathVariable("id")int id, Question question,HttpSession session) {
     /*   Question question1 = questionDao.findOne(id);
        question1.setAnswer(question.getAnswer());
        question1.setTitle(question.getTitle());
        question1.setOptiona(question.getOptiona());
        question1.setOptionb(question.getOptionb());
        question1.setOptionc(question.getOptionc());
        question1.setOptiond(question.getOptiond());
        question1.setUnitId(question.getUnitId());

        if (question.getOptiona() != null)
            question1.setType(1);    //选择题
        else
            question1.setType(2);      //主观题
        questionDao.save(question1);
        return "redirect:/teacher/questions/questionList";*/
     return null;
    }



}
