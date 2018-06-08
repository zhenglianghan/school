package org.liufree.onlineschool.bean.exam;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * @author lwx
 * @date 5/28/17
 * @email liufreeo@gmail.com
 */
@Entity
@Data
@Table(name = "exam")
public class Exam {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    int courseId;           //课程id

    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
    Date beginTime;         //开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Date endTime;           //终止时间

    Double time;            //考试时间

    String title;           //考试标题
    int type;               //考试类型，1为test,2为assignment,3为期中期末考试
    double score;           //总分数
    double percent;         //本次考试分数在总成绩中所占百分比

    Date createTime;        //创建时间

    int status;     //考试状态，是否过期，0为正常，1为过期
}
