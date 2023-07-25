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
public class ReviewInsert {

	@Setter(onMethod_ = @Autowired)
	private DataSource ds;

	@Test
	public void testReviewInsert() {
		String sql = "insert into review(rev_idx, rs_idx, rev_title, rev_score, rev_id, rev_file, rev_content) values(rev_seq.nextval, ?, ?, ?, ?, ?, ?)";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			for (int i = 1; i <= 1000; i++) {
				pstmt.setString(1, randomResIdxGen());
				pstmt.setInt(2, i);
				pstmt.setInt(3, randomScoreGen());
				pstmt.setString(4, randomRevIdGen());
				pstmt.setString(5, null);
				pstmt.setString(6, "내용" + i);
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

	public String randomResIdxGen() {
		return ((int) (1 + Math.random() * 30))+"";
	}
	
	public int randomScoreGen() {
		return (int) (1 + Math.random() * 5);
	}

	public String randomRevIdGen() {
		return "user" + (int) (41 + Math.random() * 60);
	}
}
