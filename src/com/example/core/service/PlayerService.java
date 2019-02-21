package com.example.core.service;

import com.example.common.utils.Page;
import com.example.core.po.Player;

public interface PlayerService {
    public Page<Player> findPlayerList(Integer page, Integer rows, String playerName, String playerPosition,
                                       String playerTeam, String playerLevel); // 查询球员列表
    public int createPlayer(Player player); // 注册新球员
    public Player getPlayerById(Integer id); // 查询球员
    public  int updatePlayer(Player player); // 更新球员信息
    public int deletePlayer(Integer id); // 删除球员
}
