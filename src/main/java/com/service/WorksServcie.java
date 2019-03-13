package com.service;

import com.entity.Works;

import java.util.List;

public interface WorksServcie {

    void append(Works works);

    List<Works> findAll();

}
