package com.matjip.dto;

import lombok.Data;

@Data
public class ReviewDTO {
	private int rev_idx;
	private String rs_idx;
	private String rev_title;
	private int rev_score;
	private String rev_id;
	private String rev_file;
	private String rev_content;
	private String rev_regdate;
}
