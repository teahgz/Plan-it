package com.jy.todolist.task.model.vo;

import java.util.Date;

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
	private String start_date;
	private String end_date;
	private String category_name;
}
