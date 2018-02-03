package com.ak47.cms.cms

import com.ak47.cms.cms.dao.CronTriggerDao
import com.ak47.cms.cms.dao.SearchKeyWordRepository
import com.ak47.cms.cms.entity.CronTrigger
import com.ak47.cms.cms.entity.SearchKeyWord
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.core.Ordered
import org.springframework.core.annotation.Order
import org.springframework.scheduling.annotation.EnableScheduling
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.EnableTransactionManagement
import java.io.File

@SpringBootApplication
@EnableScheduling
@EnableTransactionManagement
class CmsApplication

fun main(args: Array<String>) {
    runApplication<CmsApplication>(*args)
}

@Component
@Order(value = Ordered.HIGHEST_PRECEDENCE)
class initSearchKeyWordRunner : CommandLineRunner {
    @Autowired lateinit var searchKeyWordRepository: SearchKeyWordRepository
    override fun run(vararg args: String) {
        try {
            var keyWords = File("搜索关键词列表.data").readLines()
            keyWords.forEach {
                val SearchKeyWord = SearchKeyWord()
                SearchKeyWord.keyWord = it
                searchKeyWordRepository.saveOnNoDuplicateKey(it)
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
