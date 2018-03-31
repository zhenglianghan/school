package org.liufree.onlineschool.controller.exam;

import org.liufree.onlineschool.bean.exam.*;
import org.liufree.onlineschool.dao.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author lwx
 * @date 3/23/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/teacher")
public class TeacherExamController {


    @Autowired
    ExamDao examDao;
    @Autowired
    QuestionDao questionDao;
    @Autowired
    ExamQuestionDao examQuestionDao;
    @Autowired
    ExamResultDao examResultDao;
    @Autowired
    ExamResultQuestionDao examResultQuestionDao;


    @RequestMapping("/exam/examList")
    public String examList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<Exam> examList = examDao.getExamsByCourseId(courseId);
        model.addAttribute("examList", examList);
        return "teacher/tests";
    }

    /*@RequestMapping("/exam/{examId}")
    public String getExamById(@PathVariable("examId") int examId, Model model) {
        Exam exam = examDao.getOne(examId);
        model.addAttribute("exam", exam);
       *//* List<ExamQuestion> examQuestionList = examQuestionDao.getQuestionByExamId(examId);
        model.addAttribute("examQuestionList", examQuestionList);*//*
        List<Question> questionList = questionDao.getQuestionListByExamId(examId);
        model.addAttribute("questionList", questionList);
        return "exam/teacher_itemExam";
    }

    @RequestMapping("/exam/changePage/{examId}")
    public String changePage(@PathVariable("examId") int examId, Model model) {
        Exam exam = examDao.getOne(examId);
        List<Question> questionList = questionDao.getQuestionListByExamId(examId);
        List<ExamQuestion> examQuestionList = examQuestionDao.getExamQuestionByExamId(examId);
        model.addAttribute("examQuestionList", examQuestionList);
        model.addAttribute("exam", exam);
        model.addAttribute("questionList", questionList);
        return "teacher/test_change";
    }
*/
    @RequestMapping("/exam/change/{examId}")
    public String change(@PathVariable("examId") int examId, ExamQuestionModel examQuestionModel, Model model, HttpSession session) {
        Exam mExam = examDao.getOne(examId);

        Exam exam = examQuestionModel.getExam();
        mExam.setTitle(exam.getTitle());
        mExam.setPercent(exam.getPercent());
        examDao.save(exam);  //存了之后返回这个对象

        for (ExamQuestion examQuestion : examQuestionModel.getExamQuestionList()) {

            if (examQuestion.getQuestionId() != 0) {
                examQuestion.setExamId(examId);
                examQuestionDao.save(examQuestion);
            }
        }
        return "redirect:/teacher/exam/examList";
    }

    @RequestMapping("/exam/addPage")
    public String addPage(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        System.out.println(courseId);
        List<Question> questionList = questionDao.getQuestionListByCourseId(courseId);
        model.addAttribute("questionList", questionList);
        return "teacher/test_add";
    }

    @RequestMapping("exam/add")
    public String add(HttpSession session, Model model, ExamQuestionModel examQuestionModel) {
        int courseId = (Integer) session.getAttribute("courseId");
        Exam exam = examQuestionModel.getExam();
        exam.setCourseId(courseId);
        exam.setCreateTime(new Date());
        exam = examDao.save(exam);  //存了之后返回这个对象
        int examId = exam.getId();
        for (ExamQuestion examQuestion : examQuestionModel.getExamQuestionList()) {

            if (examQuestion.getQuestionId() != 0) {
                examQuestion.setExamId(examId);
                examQuestionDao.save(examQuestion);
            }
        }


        return "redirect:/teacher/exam/examList";
    }

    @RequestMapping("/exam/selectPage")
    public String selectPage(HttpSession session, Model model, Exam exam) {
        int courseId = (Integer) session.getAttribute("_courseId");
        exam.setCourseId(courseId);
        session.setAttribute("exam", exam);
        List<Question> questionList = questionDao.getQuestionListByCourseId(courseId);
        model.addAttribute("questionList", questionList);
        return "teacher/teacher_test_select";
    }

    //Todo 这里添加考试和选择试题应该在同一个界面
    @RequestMapping("/select")
    public String select(ExamQuestionModel examQuestionModel, HttpSession session, Model model) {
        for (ExamQuestion examQuestion : examQuestionModel.getExamQuestionList()) {

            examQuestionDao.save(examQuestion);
        }
        return null;
    }


    @RequestMapping("/exam/delete/{examId}")
    public String delete(@PathVariable("examId") int examId) {
        examDao.deleteById(examId);
        examQuestionDao.deleteByExamId(examId);
        examResultDao.deleteByExamId(examId);
        examResultQuestionDao.deleteByExamId(examId);
        return "redirect:/teacher/exam/examList";
    }

    @RequestMapping("/exam/random/{id}")
    public String random(@PathVariable("id") int id, Model model, HttpSession session) {
        /*List<ExamQuestion> examQuestionList = examQuestionDao.getExamQuestionByExamId(id);

        int courseId = (Integer) session.getAttribute("_courseId");
        Exam exam = examQuestionModel.getExam();
        System.out.println(exam.getBeginTime().toString());
        exam.setCourseId(courseId);
        exam = examDao.save(exam);  //存了之后返回这个对象
        int examId = exam.getId();

        for (ExamQuestion examQuestion : examQuestionList) {
            System.out.println(examQuestion.getId());
            examQuestion.setExamId(examId);
            examQuestionDao.save(examQuestion);
        }

        re
        return "redirect:/examList";*/
        return null;
    }

    @RequestMapping("/exam/markList")
    public String markList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");

        List<ExamResult> examResultList = examResultDao.findByCourseId(courseId);
        model.addAttribute("examResultList", examResultList);
        return "teacher/mark";
    }

    @RequestMapping("/exam/mark/{id}")
    public String markById(@PathVariable("id") int id, HttpSession session, Model model) {
        model.addAttribute("examResultId", id);

        List<ExamResultQuestion> examResultQuestionList = examResultQuestionDao.getByExamResultId(id);
        model.addAttribute("examResultQuestionList", examResultQuestionList);
        return "teacher/mark_mark";
    }


    @RequestMapping(value = "/exam/correct/{examResultId}", method = RequestMethod.POST)
    public String correct(@PathVariable("examResultId") int examResultId, MarkModel markModel, HttpSession session) {
        double totalScore = 0.0;

        for (ExamQuestion examQuestion : markModel.getExamQuestionList()) {
            totalScore += examQuestion.getItemScore();
        }

        ExamResult examResult = examResultDao.getOne(examResultId);
        examResult.setStatus(2);
        examResult.setScore(totalScore);
        examResultDao.save(examResult);
        return "redirect:/teacher/exam/markList";
    }

}
