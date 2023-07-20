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
public class UserInsert {

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testUserInsert() {
		String sql = "insert into user_tbl values(?, ?, ?, ?, ?)";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			for (int i = 1; i <= 100; i++) {
				if (i == 1) {
					pstmt.setString(1, "admin");
					pstmt.setString(2, "1234");
					pstmt.setString(3, "관리자");
					pstmt.setString(4, "010" + randomPhoneGen());
					pstmt.setString(5, "admin@gmail.com");
					pstmt.executeUpdate();
				} else if (1 < i && i < 41) {
					pstmt.setString(1, "enter" + i);
					pstmt.setString(2, "1234");
					pstmt.setString(3, "사업자" + i);
					pstmt.setString(4, "010" + randomPhoneGen());
					pstmt.setString(5, "enter" + i + "@gmail.com");
					pstmt.executeUpdate();
				} else {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "1234");
					pstmt.setString(3, "일반사용자" + i);
					pstmt.setString(4, "010" + randomPhoneGen());
					pstmt.setString(5, "user" + i + "@gmail.com");
					pstmt.executeUpdate();
				}
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
}
