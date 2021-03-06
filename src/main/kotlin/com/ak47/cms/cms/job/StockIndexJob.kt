package com.ak47.cms.cms.job

import com.ak47.cms.cms.task.StockIndexTask
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Component
import org.springframework.transaction.annotation.Transactional
import java.util.*

@Component
class StockIndexJob {
    @Autowired lateinit var StockIndexTask: StockIndexTask

    @Scheduled(cron = "0 0 */1 * * ?")
    @Transactional
    fun doStockIndexTask() {
        println("开始执行定时任务 doStockIndexTask： ${Date()}")
        StockIndexTask.doSyncStockIndexData()
    }

}