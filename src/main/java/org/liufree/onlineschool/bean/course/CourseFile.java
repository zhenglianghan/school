package org.liufree.onlineschool.bean.course;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @author lwx
 * @date 3/21/18
 * @email liufreeo@gmail.com
 */
@Data
@Table(name = "course_file")
@Entity
public class CourseFile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @ManyToOne
    CourseUnit courseUnit;           //course_unit表里面的id

    int courseId;       //课程id

    double size;        //文件大小
    String title;           //文件标题
    String url;             //文件路径
    Date time;              //上传时间

    int sort;               //排序
}
