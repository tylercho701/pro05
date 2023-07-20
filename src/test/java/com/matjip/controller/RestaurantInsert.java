package com.matjip.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class RestaurantInsert {

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testRestaurantInsert() {
		String sql = "insert into restaurant values(rest_seq.nextval, ?, ?, ?, ?, ?, ?, ?)";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			for (int i = 1; i <= 30; i++) {
				pstmt.setString(1, randomCateGen());
				pstmt.setString(2, "음식점" + i);
				pstmt.setString(3, "010" + randomPhoneGen());
				pstmt.setString(4, randomCateGen());
				pstmt.setString(5, "주소" + i);
				pstmt.setString(6, null);
				pstmt.setString(7, null);
				pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public String randomPhoneGen() {
		String p = "";
		for (int j = 0; j < 8; j++) {
			int i = (int) (Math.random() * 10);
			p += i;
		}
		return p;
	}

	public String randomCateGen() {
		return "0" + (int) (1 + Math.random() * 2);
	}
}
