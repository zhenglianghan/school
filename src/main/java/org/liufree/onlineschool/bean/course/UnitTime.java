package org.liufree.onlineschool.bean.course;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "file_time")
public class UnitTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    int userId;
    int unitId;
    int minute;
    int second;
}
