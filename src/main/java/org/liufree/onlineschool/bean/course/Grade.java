package org.liufree.onlineschool.bean.course;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

/**
 * @author lwx
 * @date 3/14/18
 * @email liufreeo@gmail.com
 */

@Data
@Entity
@Table(name = "grade")
public class Grade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    String gradeName;           //年级名字
    String description;              //描述
    Date createTime;           //创建时间
    Date updateTime;          //更新时间
    // int status;                 //状态，1为正常，0为删除

}
