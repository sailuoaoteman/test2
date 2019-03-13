package com.service;

import com.dao.WorksDao;
import com.entity.Works;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class WorksServiceImpl implements WorksServcie {

    @Autowired
    private WorksDao dao;

    @Transactional(propagation = Propagation.REQUIRED)
    @Override
    public void append(Works works) {
        works.setId(UUID.randomUUID().toString());
        dao.insert(works);
    }

    @Override
    public List<Works> findAll() {
        return dao.selectAll();
    }
}
