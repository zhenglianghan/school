package org.liufree.onlineschool.dao.exam;

import org.liufree.onlineschool.bean.exam.ExamResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lwx
 * @date 6/26/17
 * @email liufreeo@gmail.com
 */
public interface ExamResultDao extends JpaRepository<ExamResult, Integer> {

    @Query("select q from ExamResult q where q.courseId=:courseId and q.status=1")
    List<ExamResult> findByCourseId(@Param("courseId") int courseId);

    @Query("select er from ExamResult er where er.courseId=:courseId and er.user.id=:userId ")
    List<ExamResult> getByCourseIdAndUserId(@Param("courseId") int courseId, @Param("userId") int userId);

    @Modifying
    @Transactional
    @Query("delete from ExamResult er where er.exam.id=:examId")
    void deleteByExamId(@Param("examId") int examId);

    @Query("select er from ExamResult er where er.courseId =:courseId")
    List<ExamResult> getByCourseId(@Param("courseId") int courseId);

    @Query("select q from ExamResult q where q.courseId=:courseId and q.status=2")
    List<ExamResult> findByCourseIdAndStatus(@Param("courseId") int courseId);

   /* @Query("select e.title as title,e.percent as percent,e.score as  testScore ,er.socre as finalScore, er.time as time " +
            "from Exam e left join ExamResult er on e.id=er.examId where er.status<>0")
    List<ExamResultDto> getExamResultStatus();*/




}
