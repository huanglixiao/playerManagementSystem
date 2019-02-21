package com.example.core.po;

import java.io.Serializable;

public class Player implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer player_id; // 球员编号
    private String player_name; // 球员名字
    private String player_position; // 球员位置
    private String player_team; // 球员球队
    private String player_level; // 球员级别
    private String player_salary; // 球员合同
    private String player_draft; // 选秀
    private Integer start; //起始行
    private Integer rows; // 所取行数

    public String getPlayer_team() {
        return player_team;
    }

    public void setPlayer_team(String player_team) {
        this.player_team = player_team;
    }

    public Integer getPlayer_id() {
        return player_id;
    }

    public void setPlayer_id(Integer player_id) {
        this.player_id = player_id;
    }

    public String getPlayer_name() {
        return player_name;
    }

    public void setPlayer_name(String player_name) {
        this.player_name = player_name;
    }

    public String getPlayer_position() {
        return player_position;
    }

    public void setPlayer_position(String player_position) {
        this.player_position = player_position;
    }

    public String getPlayer_level() {
        return player_level;
    }

    public void setPlayer_level(String player_level) {
        this.player_level = player_level;
    }

    public String getPlayer_salary() {
        return player_salary;
    }

    public void setPlayer_salary(String player_salary) {
        this.player_salary = player_salary;
    }

    public String getPlayer_draft() {
        return player_draft;
    }

    public void setPlayer_draft(String player_draft) {
        this.player_draft = player_draft;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }
}
