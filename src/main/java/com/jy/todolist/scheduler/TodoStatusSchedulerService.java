package com.jy.todolist.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.jy.todolist.task.model.dao.TaskDao;


@Configuration
@EnableScheduling
public class TodoStatusSchedulerService {

	 private static final Logger logger = LoggerFactory.getLogger(TodoStatusSchedulerService.class);
	
	@Autowired
	private TaskDao taskDao;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void updateTomorrowTasksStatus() {
		logger.info("Scheduler is running at {}", new java.util.Date());
		taskDao.updateTasksStatusForTomorrow();
    }	
}
