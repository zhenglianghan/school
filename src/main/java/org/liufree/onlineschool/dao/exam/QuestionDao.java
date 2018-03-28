package org.liufree.onlineschool.dao.exam;


import org.liufree.onlineschool.bean.exam.Question;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author lwx
 * @date 6/6/17
 * @email liufreeo@gmail.com
 */
public interface QuestionDao extends JpaRepository<Question, Integer> {

    @Query("select q from Question q where q.courseId=:courseId")
    List<Question> getQuestionListByCourseId(@Param("courseId") int courseId);

    @Query("select q from Question q where q.courseId=:courseId")
    Page<Question> getQuestionListByCourseId(@Param("courseId") int courseId, Pageable pageable);

    @Query("select q from Question q,ExamQuestion e where q.id=e.questionId and e.examId=:examId")
    List<Question> getQuestionListByExamId(@Param("examId") int examId);

}
