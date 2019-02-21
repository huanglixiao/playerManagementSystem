package com.example.core.service;

import com.example.core.po.BaseDict;

import java.util.List;

/**
 * 数据字典Service接口,根据类型代码查询数据字典
 */
public interface BaseDictService {
    public List<BaseDict> findBaseDictByTypeCode(String typecode);
}
