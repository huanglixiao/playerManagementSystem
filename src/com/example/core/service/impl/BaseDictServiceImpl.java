package com.example.core.service.impl;

import com.example.core.dao.BaseDictDao;
import com.example.core.po.BaseDict;
import com.example.core.service.BaseDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("baseDictService")
public class BaseDictServiceImpl implements BaseDictService {

    @Autowired
    private BaseDictDao baseDictDao;

    /**
     * 通过类型代码查询数据字典
     */
    @Override
    public List<BaseDict> findBaseDictByTypeCode(String typecode) {
        return baseDictDao.selectBaseDictByTypeCode(typecode);
    }
}