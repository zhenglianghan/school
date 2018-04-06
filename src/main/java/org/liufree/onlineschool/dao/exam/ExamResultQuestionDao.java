package org.liufree.onlineschool.dao.exam;


import org.liufree.onlineschool.bean.exam.ExamResultQuestion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lwx
 * @date 6/25/17
 * @email liufreeo@gmail.com
 */
public interface ExamResultQuestionDao extends JpaRepository<ExamResultQuestion, Integer> {


    @Query("select q from ExamResultQuestion q where q.exam.id=:examId")
    List<ExamResultQuestion> findByExamId(@Param("examId") int examId);

    @Query("select eq from ExamResultQuestion eq  where eq.user.id=:userId and eq.exam.id=:examId")
    List<ExamResultQuestion> getByUserIdAndExamId(@Param("userId") int userId, @Param("examId") int examId);

    @Query("select eq from ExamResultQuestion eq  where eq.examResult.id=:examResultId order by eq.question.type asc")
    List<ExamResultQuestion> getByExamResultId(@Param("examResultId") int examResultId);

    @Modifying
    @Transactional
    @Query("delete from ExamResultQuestion erq where erq.exam.id=:examId")
    void deleteByExamId(@Param("examId") int examId);


    @Query("select c from ExamResultQuestion c where c.question.id=:questionId and c.exam.id=:examId")
    ExamResultQuestion findByExamAndQuestion(@Param("examId") int examId, @Param("questionId") int questionId);


}
