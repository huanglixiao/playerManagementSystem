package com.example.core.service.impl;

import com.example.common.utils.Page;
import com.example.core.dao.PlayerDao;
import com.example.core.po.Player;
import com.example.core.service.PlayerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 *  实现playService接口
 */
@Service("playerService")
public class PlayerServiceImpl implements PlayerService {

    @Autowired
    private PlayerDao playerDao;

    //查询球员列表
    @Override
    public Page<Player> findPlayerList(Integer page, Integer rows, String playerName, String playerPosition,
                                       String playerTeam, String playerLevel) {
        Player player = new Player();

        if (StringUtils.isNotBlank(playerName)){
            player.setPlayer_name(playerName);
        }
        if (StringUtils.isNotBlank(playerPosition)){
            player.setPlayer_position(playerPosition);
        }
        if (StringUtils.isNotBlank(playerTeam)){
            player.setPlayer_team(playerTeam);
        }
        if (StringUtils.isNotBlank(playerLevel)){
            player.setPlayer_level(playerLevel);
        }
        player.setStart((page - 1) * rows);

        player.setRows(rows);

        List<Player> players = playerDao.selectPlayerList(player);
        Integer count = playerDao.selectPlayerListCount(player);
        Page<Player> result = new Page<>();
        result.setPage(page);
        result.setRows(players);
        result.setSize(rows);
        result.setTotal(count);
        return result;
    }

    // 创建球员
    @Override
    public int createPlayer(Player player) {
        return playerDao.createPlayer(player);
    }
    // 通过Id查询球员
    @Override
    public Player getPlayerById(Integer id) {
        Player player = playerDao.getPlayerById(id);
        return player;
    }
    // 更新球员信息
    @Override
    public int updatePlayer(Player player) {
        return playerDao.updatePlayer(player);
    }

    // 删除球员
    @Override
    public int deletePlayer(Integer id) {
        return playerDao.deletePlayer(id);
    }
}
