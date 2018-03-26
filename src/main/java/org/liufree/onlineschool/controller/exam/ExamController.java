package org.liufree.onlineschool.controller.exam;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.liufree.onlineschool.bean.exam.Exam;
import org.liufree.onlineschool.dao.exam.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author lwx
 * @date 3/24/18
 * @email liufreeo@gmail.com
 */
@Controller
@RequestMapping("/student")
public class ExamController {

    @Autowired
    ExamDao examDao;
    @Autowired
    ExamQuestionDao examQuestionDao;
    @Autowired
    QuestionDao questionDao;
    @Autowired
    ExamResultDao examResultDao;
    @Autowired
    ExamResultQuestionDao examResultQuestionDao;

    @RequestMapping("/exam/examList")
    public String examList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<Exam> examList = examDao.getExamsByCourseId(courseId);
        model.addAttribute("examList", examList);
        return "student/test_paper";
    }


    @RequestMapping("/doExamPage/{examId}")
    public String doExamPage(@PathVariable("examId") int examId, Model model) {
        Exam exam = examDao.getOne(examId);
        model.addAttribute("exam", exam);
        List<?> questionList = questionDao.getQuestionListByExamId(examId);
        System.out.println();
        model.addAttribute("questionList", questionList);

        return "student/test_test";
    }
/*

    @RequestMapping("/doExam/{examId}")
    public String doExam(@PathVariable("examId") int examId, Model model, ExamAnswerModel examAnswerModel, HttpSession session) {
        List<ExamResultQuestionModel> examResultQuestionModelList = new ArrayList<>();
        Double totalScore = 0.0;


        int userId = (Integer) session.getAttribute("userId");
        int courseId = (Integer) session.getAttribute("_courseId");

        ExamResult examResult = new ExamResult();
        examResult.setExamId(examId);
        examResult.setUserId(userId);
        examResult.setCourseId(courseId);
        examResult.setScore(totalScore);
        examResult = examResultDao.save(examResult);

        for (ExamResultQuestion examResultQuestion : examAnswerModel.getExamResultQuestionList()) {
            ExamResultQuestionModel examResultQuestionModel = new ExamResultQuestionModel();

            examResultQuestion.setExamResultId(examResult.getId());  //对应哪次作答
            examResultQuestion.setExamId(examId);
            examResultQuestion.setUserId(userId);

            String answer = examResultQuestion.getAnswer();
            int questionId = examResultQuestion.getQuestionId();
            Question question = questionDao.getOne(questionId);


            ExamQuestion examQuestion = examQuestionDao.findByExamIdAndQuestionId(examId, questionId);
            if (question.getType() == 1) {
                if (answer.equals(question.getAnswer())) {
                    examResultQuestion.setIsRight(true);
                    examResultQuestion.setItemScore(examQuestion.getItemScore());
                    totalScore += examQuestion.getItemScore();


                } else
                    examResultQuestion.setIsRight(false);
                examResultQuestion.setItemScore(0.0);

            } else {
                totalScore += examQuestion.getItemScore();
            }
            System.out.println("总分是" + totalScore);
            examResultQuestionDao.save(examResultQuestion);

            examResultQuestionModel.setQuestion(question);  //添加问题
            examResultQuestionModel.setExamResultQuestion(examResultQuestion);  //判断这个问题是否正确
            examResultQuestionModelList.add(examResultQuestionModel);
        }
        Exam exam = examDao.getOne(examId);
        model.addAttribute("exam", exam);
        model.addAttribute("examResultQuestionModelList", examResultQuestionModelList);
        model.addAttribute("totalScore", totalScore);


        return "exam/user_doExamResult";
    }
*/

    @RequestMapping("/examed/{id}")
    public String examed(@PathVariable("id") int id, Model model) {
        return null;
    }


}
