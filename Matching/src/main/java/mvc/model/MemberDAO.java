package mvc.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class MemberDAO {
	public void insertImage(ArrayList<MemberDTO> fileLists) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			for(int i=0; i<fileLists.size();i++) {
				MemberDTO memberDTO = fileLists.get(i);
				String sql = "insert into member_images values(?,?,?)";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, memberDTO.getNum());
				pstmt.setString(2, memberDTO.getPhoto());
				pstmt.setString(3, memberDTO.getId());
				pstmt.executeUpdate();
			}
			} catch (Exception ex) {
				System.out.println("insertImage() : " + ex);
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			} catch(Exception es) {
				throw new RuntimeException();
			}
		}
		
	}
	
	
	
}