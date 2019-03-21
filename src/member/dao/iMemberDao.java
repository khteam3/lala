package member.dao;

import member.dto.MemberDto;

public interface iMemberDao {

	public MemberDto loginCheck(String id, String pwd);
	public boolean idSameCheck(String id);
	public boolean insertMember(MemberDto dto);
}
