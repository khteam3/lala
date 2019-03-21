package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBClose;
import db.DBConnection;
import member.dto.MemberDto;

public class MemberDao implements iMemberDao {
	
	private static MemberDao memberDao = new MemberDao();
	
	private MemberDao() {
		DBConnection.initConnect();
	}
	
	public static MemberDao getInstance() {
		return memberDao;
	}

	//로그인체크
	@Override
	public MemberDto loginCheck(String id, String pwd) {
		
		String sql = " SELECT ID,PWD,NAME,GENDER,EMAIL,PHONE,BIRTH,ADDRESS,AUTH "
				+ " FROM MEMBER "
				+ " WHERE ID=? AND PWD=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		MemberDto mdto = null;
		
		System.out.println("0/6 logincheck suc");
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 logincheck suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println("2/6 logincheck suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 logincheck suc");
			
			if(rs.next()) {
				mdto = new MemberDto(
						rs.getString("ID"),//id,
						rs.getString("PWD"),//pwd,
						rs.getString("NAME"),//name, 
						rs.getString("GENDER"),//gender,
						rs.getString("EMAIL"),//email, 
						rs.getString("PHONE"),//phone, 
						rs.getString("BIRTH"),//birth,
						rs.getString("ADDRESS"),//address, 
						rs.getInt("AUTH"));//,auth);
			}
			
		} catch (Exception e) {
			System.out.println("logincheck fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return mdto;
	}

	//id중복체크
	@Override
	public boolean idSameCheck(String id) {
		
		String sql = " SELECT ID FROM MEMBER "
				+ " WHERE ID=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 idsamecheck suc");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("2/6 idsamecheck suc");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 idsamecheck suc");
			
			if(rs.next()) {
				count = 1;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count>0? true:false;
	}

	//회원가입
	@Override
	public boolean insertMember(MemberDto dto) {
		
		String sql = " INSERT INTO MEMBER "
				+ " (ID,PWD,NAME,GENDER,EMAIL,PHONE,BIRTH,ADDRESS,AUTH) "
				+ " VALUES(?,?,?,?,?,?,?,?,0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 insertmember suc");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 insertMember suc");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getPhone());
			psmt.setString(7, dto.getBirth());
			psmt.setString(8, dto.getAddress());
			
			count = psmt.executeUpdate();
			System.out.println("3/6 insertMember suc");
			
		} catch (Exception e) {
			System.out.println("insertMember fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0? true:false;
	}

}






















