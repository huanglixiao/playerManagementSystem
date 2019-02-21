package com.example.core.dao;

import com.example.core.po.Player;

import java.util.List;

public interface PlayerDao {
    public List<Player> selectPlayerList(Player player); // 球员列表
    public Integer selectPlayerListCount(Player player); // 球员数
    public int createPlayer(Player player);
    public Player getPlayerById(Integer id);
    public int updatePlayer(Player player);
    public int deletePlayer(Integer id);
}
