package kr.co.ictedu;

import java.sql.*;

//DAOŬ������ DB������ ������ ó���մϴ�. 
public class UsersDAO {
	
	// DB�ּ� ���̵� �н����� �̸� ����
	private static final String URL = "jdbc:mysql://localhost/ict03";
	private static final String DBID = "root";
	private static final String DBPW = "mysql";
	
	/*
	 * DAO Ŭ������ �ϳ��� ��ü�����ε� DB������ ������ �� �ֱ� ������
	 * �޸� ���� �������� Ŭ������ ��ü�� �� 1���� �����ϵ���
	 * �̱��� ������ �����Ͽ� Ŭ������ �������մϴ�.
	 */
	
	// ��Ŭ�� ���� Ŭ���� ������ ���
	// 1. �ܺο��� ��ü�� new Ű����� ����� �� �� ������ �����ڿ�
	// private�� �ٿ��ݴϴ�.
	private UsersDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 2. �ܺο��� ��ü������ �� �ϱ� ������ �ڱ� Ŭ���� ���ο��� �׳�
	// ������ �ڱ� �ڽ��� 1�� �����մϴ�.
	private static UsersDAO dao = new UsersDAO();
	
	// 3. �ܺο��� ��ü ������ �ʿ��� �� public �������� ó����
	// getter�� �̿��� 2���� ���� ��ü�� ���ϸ� ���ݴϴ�.
	// �̷��� UsersDAO�� ������ �����̱� ������ �ּҰ��� ���޵˴ϴ�.
	public static UsersDAO getInstance() {
		return dao;
	}
	
	// ������ �ִ� ȸ�� ���� ������ DAOŬ������ �̰��մϴ�.
	// ȸ�������� ó���ϴ� �޼��� ����
	// DB�� ���� ��, Ȥ�� DB���� ��µǾ� ������ ������
	// ��ΰ� UsersVO ���� �ڷ������� ��� �� �����Ƿ�
	// ��ټ� ������� ����VO�� �Ű��� �����մϴ�.
	public int joinUsers(UsersVO user) {
		// users_join.jsp�ּ� ������ �ڵ带 �̰��� �ٿ��ֱ⸦ �մϴ�.
		// DB������ ���� Connector ����
		// Connection ��ü ����
		Connection con = null;
		// ������ ������ ���� preparedStatement ��ü ����
		PreparedStatement pstmt = null;
		
		
		try{
			
			// ���� �ּ�, ����, ��й�ȣ�� �̿��� ���Ӱ���
			con = DriverManager.getConnection(URL, DBID, DBPW);
			
			// 1. �������� �ۼ��մϴ�.
			String sql = "INSERT INTO users VALUES(?, ?, ?, ?)";
			
			// 2. ���� �������� ? �ڸ��� ������ �ڹ� ������ ����ֽ��ϴ�.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getUid());
			pstmt.setString(2, user.getUpw());
			pstmt.setString(3, user.getUname());
			pstmt.setString(4, user.getEmail());
			
			// 3. ���� ������ �����ϱ�
			pstmt.executeUpdate();
			
			
		}catch(SQLException e){
			System.out.println("���� : " + e);
		}finally{
			try{
				if(con!=null && !con.isClosed()){
					con.close();
				}// pstmt �ݱ�
				if(pstmt!=null && !pstmt.isClosed()) {
					pstmt.close();
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return 1;
	}// end joinUser
}
