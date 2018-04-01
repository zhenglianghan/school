package org.liufree.onlineschool.dao.exam;


import org.liufree.onlineschool.bean.exam.ExamQuestion;
import org.liufree.onlineschool.bean.exam.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lwx
 * @date 6/9/17
 * @email liufreeo@gmail.com
 */
public interface ExamQuestionDao extends JpaRepository<ExamQuestion,Integer> {

    @Query("select qu from ExamQuestion q,Question qu  where q.examId=:examId and q.question.id=qu.id")
    List<Question> getQuestionByExamId(@Param("examId") int examId);

    @Query("select q from ExamQuestion q,Question qu  where q.examId=:examId and q.question.id=qu.id")
    List<ExamQuestion> getExamQuestionByExamId(@Param("examId") int examId);

    @Query("select e from ExamQuestion e where e.examId=:examId and e.question.id=:questionId")
    ExamQuestion findByExamIdAndQuestionId(@Param("examId") int examId, @Param("questionId") int questionId);

    @Modifying
    @Transactional
    @Query("delete from ExamQuestion eq where eq.examId=:examId")
    void deleteByExamId(@Param("examId") int examId);


    @Query("select e from ExamQuestion e where e.question.id=:questionId")
    List<ExamQuestion> findByQuestion(@Param("questionId") int questionId);
}
