package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;
import member.dao.iMemberDao;
import member.dto.MemberDto;

@WebServlet(urlPatterns="/InsertMember")
public class InsertMember extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("InsertMember get");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("InsertMember post");
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		
		//System.out.println("name: " + name);
		
		MemberDto mdto = new MemberDto(id, name, pwd, email, phone, address, 0);
		
		iMemberDao mdao = MemberDao.getInstance();
		boolean isS = mdao.insertMember(mdto);
		
		String msg = "";
		PrintWriter out = resp.getWriter();
		if(isS) {
			msg = "회원가입에 성공했습니다";
		}
		else {
			msg = "회원가입에 실패했습니다";
		}
		
		msg = "<script>alert('" + msg + "'); location.href='index.jsp';</script>";
		out.println(msg);
		
		//resp.sendRedirect("index.jsp");
	}
}
