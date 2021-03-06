package com.ak47.cms.cms.dao;

import com.ak47.cms.cms.entity.NewsArtical;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by wb-cmx239369 on 2017/11/6.
 */
public interface NewsArticalJpaRepository extends JpaRepository<NewsArtical,Long>{
    @Query("select n from NewsArtical n where n.url = :url")
    List<NewsArtical> findByUrl(@Param("url") String url);
}
