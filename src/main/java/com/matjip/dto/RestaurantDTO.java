package com.matjip.dto;

import lombok.Data;

@Data
public class RestaurantDTO {
	private int rs_idx;
	private String rs_food_cate;
	private String rs_name;
	private String rs_phone;
	private String rs_region_cate;
	private String rs_addr;
	private String rs_file;
	private String rs_content;    
}
