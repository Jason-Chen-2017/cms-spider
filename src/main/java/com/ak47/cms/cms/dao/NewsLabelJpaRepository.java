package com.ak47.cms.cms.dao;

import com.ak47.cms.cms.entity.NewsArtical;
import com.ak47.cms.cms.entity.NewsLabel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by wb-cmx239369 on 2017/11/6.
 */
public interface NewsLabelJpaRepository extends JpaRepository<NewsLabel,Long>{
}
