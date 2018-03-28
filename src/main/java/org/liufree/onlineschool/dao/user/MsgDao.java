package org.liufree.onlineschool.dao.user;

import org.liufree.onlineschool.bean.message.Msg;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author lwx
 * @date 3/29/18
 * @email liufreeo@gmail.com
 */
public interface MsgDao extends JpaRepository<Msg, Integer> {


    List<Msg> findMsgsByReceiverId(@Param("receiverId") int receiverId);
}
