package com.jy.todolist.task.model.vo;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Task {

	private int task_no;
	private int user_no;
	private int category_no;
	private String task_title;
	private int status;
	private Timestamp start_date;
	private Timestamp end_date;
	private String category_name;
}
