package com.jy.todolist.member.model.vo;

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
public class Member {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Timestamp create_date;
	private int status;
}