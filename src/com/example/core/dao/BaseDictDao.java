package com.example.core.dao;

import com.example.core.po.BaseDict;

import java.util.List;

public interface BaseDictDao {
    public List<BaseDict> selectBaseDictByTypeCode(String typecode);
}
