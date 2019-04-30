package org.liufree.onlineschool.controller.exam;

import org.liufree.onlineschool.bean.exam.*;
import org.liufree.onlineschool.bean.user.User;
import org.liufree.onlineschool.dao.exam.*;
import org.liufree.onlineschool.dao.user.UserCourseDao;
import org.liufree.onlineschool.dao.user.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.liufree.onlineschool.bean.user.UserCourse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    UserDao userDao;
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
    @Autowired
    UserCourseDao userCourseDao;

    @RequestMapping("/exam/examList")
    public String examList(HttpSession session, Model model) {
        int courseId = (Integer) session.getAttribute("courseId");
        List<Exam> examList = examDao.getExamsByCourseId(courseId);
        List<Exam> exams = new ArrayList<>();

        int userId = (Integer) session.getAttribute("userId");
        List<ExamResult> examResultList = examResultDao.getByCourseIdAndUserId(courseId, userId);
        for (ExamResult examResult : examResultList) {
            Exam exam = examDao.getOne(examResult.getExam().getId());

            examList.remove(exam);
        }

        for(Exam exam:examList){
            System.out.println(exam.getEndTime().toString()+"刘文祥");
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            try {
                String now = df.format(new Date());
                Date dt1 = df.parse(now);
                Date dt2 = df.parse(exam.getEndTime().toString());
                if (dt1.getTime() > dt2.getTime()) {
                    exam.setStatus(1);
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
            exams.add(exam);
        }
        model.addAttribute("examResultList", examResultList);
        model.addAttribute("examList", examList);
        model.addAttribute("exams", exams);
        return "student/test_paper";
    }


    @RequestMapping("/doExamPage/{examId}")
    public String doExamPage(@PathVariable("examId") int examId, Model model, HttpSession session) {
        Exam exam = examDao.getOne(examId);
        model.addAttribute("exam", exam);
        List<Question> questionList = questionDao.getQuestionListByExamId(examId);
        List<ExamQuestion> examQuestionList = examQuestionDao.getExamQuestionByExamId(examId);
        model.addAttribute("examQuestionList", examQuestionList);
        model.addAttribute("questionList", questionList);
        return "student/test_test";
    }


    @RequestMapping("/doExam/{examId}")
    public String doExam(@PathVariable("examId") int examId, Model model, ExamAnswerModel examAnswerModel, HttpSession session) {
        List<ExamResultQuestionModel> examResultQuestionModelList = new ArrayList<>();
        Double totalScore = 0.0;


        int userId = (Integer) session.getAttribute("userId");
        int courseId = (Integer) session.getAttribute("courseId");

        ExamResult examResult = new ExamResult();
        Exam exam = examDao.getOne(examId);
        examResult.setExam(exam);
        User user = userDao.getOne(userId);
        examResult.setUser(user);
        examResult.setCourseId(courseId);
        examResult.setScore(totalScore);
        examResult.setStatus(1);
        examResult.setTime(new Date());
        examResult = examResultDao.save(examResult);

        for (ExamResultQuestion examResultQuestion : examAnswerModel.getExamResultQuestionList()) {
            ExamResultQuestionModel examResultQuestionModel = new ExamResultQuestionModel();

            examResultQuestion.setExamResult(examResultDao.getOne(examResult.getId()));  //对应哪次作答

            examResultQuestion.setExam(examDao.getOne(examId));
            examResultQuestion.setUser(userDao.getOne(userId));

            String answer = examResultQuestion.getAnswer();
            int questionId = examResultQuestion.getQuestion().getId();
            Question question = questionDao.getOne(questionId);


            ExamQuestion examQuestion = examQuestionDao.findByExamIdAndQuestionId(examId, questionId);
            if (question.getType() == 1) {
                if (answer != null) {
                    if (answer.equals(question.getAnswer())) {
                        examResultQuestion.setIsRight(true);
                        examResultQuestion.setItemScore(examQuestion.getItemScore());
                        totalScore += examQuestion.getItemScore();


                    }
                } else {
                    examResultQuestion.setIsRight(false);
                    examResultQuestion.setItemScore(0.0);
                }
            } else {
                totalScore += examQuestion.getItemScore();
            }
            System.out.println("总分是" + totalScore);
            examResultQuestionDao.save(examResultQuestion);
/*
            examResultQuestionModel.setQuestion(question);  //添加问题
            examResultQuestionModel.setExamResultQuestion(examResultQuestion);  //判断这个问题是否正确
            examResultQuestionModelList.add(examResultQuestionModel);*/
        }
        /*Exam exam = examDao.getOne(examId);
        model.addAttribute("exam", exam);
        model.addAttribute("examResultQuestionModelList", examResultQuestionModelList);
        model.addAttribute("totalScore", totalScore);
*/

        return "redirect:/student/exam/examList";
    }

    @RequestMapping("/exam/achievementList")
    public String achievementList(HttpSession session, Model model) {
        double sum = 0;
        int userId = (Integer) session.getAttribute("userId");
        int courseId = (Integer) session.getAttribute("courseId");
        List<ExamResult> examResultList = examResultDao.getByCourseIdAndUserId(courseId, userId);
        model.addAttribute("examResultList", examResultList);
        for (ExamResult examResult : examResultList) {
            sum += examResult.getScore() * examResult.getExam().getPercent() / 100;
        }
        model.addAttribute("sum", sum);
        UserCourse uc=userCourseDao.findTopByUserIdAndCourseId(userId,courseId);
        model.addAttribute("userCourse", uc);
        return "student/achievement";
    }

    @RequestMapping("/examed/{id}")
    public String examed(@PathVariable("id") int id, Model model) {
        ExamResult examResult = examResultDao.getOne(id);
        int userId = examResult.getUser().getId();
        int examId = examResult.getExam().getId();
        Exam exam = examDao.getOne(examId);
        System.out.println(exam.getTitle());
        List<Question> questionList = questionDao.getQuestionListByExamId(examId);
        List<ExamResultQuestion> examResultQuestionList = examResultQuestionDao.getByExamResultId(examResult.getId());
        model.addAttribute("examResultId", examResult.getId());
        model.addAttribute("exam", exam);
        List<ExamQuestion> examQuestionList = examQuestionDao.getExamQuestionByExamId(examId);
        model.addAttribute("examQuestionList", examQuestionList);
        model.addAttribute("questionList", questionList);
        model.addAttribute("examResultQuestionList", examResultQuestionList);

        return "student/mark_detail";
    }


}
