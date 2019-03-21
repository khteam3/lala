package util;

import java.util.List;

//import dto.CalendarDto;

public class UtilClass {
	//문자열이 들어왔을 때 비어있거나 널이면 true리턴
		public static boolean nvl(String msg) {
			return msg==null || msg.trim().equals("")? true:false;
		}
		
		//날짜를 클릭하면, 그날의 일정이 모두 보이도록 하는 callist.jsp로 이동시키는 함수
		public static String callist(int year, int month, int day) {
			String s = "";
			
			s = String.format("<a href='%s?year=%d&month=%d&day=%d'>", "callist.jsp", year, month, day);
			s += String.format("%2d", day);
			s += "</a>";
			
			return s;
		}
		
		//일정을 추가하기 위한 calwrite.jsp로 이동하기 위한 함수로,
		//이미지(펜)를 클릭시 처리하는 함수
		public static String showPen(int year, int month, int day) {
			String s = "";
			
			String image = "<img src='./image/pen.gif'>";
			
			s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
					"calwrite.jsp", year, month, day, image);
			
			return s;
		}
		
		//1. 월 앞에 0을 붙여서 2자리로 만들어주는 함수
		public static String two(String msg) {
			return msg.trim().length()<2? "0"+msg.trim():msg.trim();
		}
		
		//각 날짜별로 테이블을 생성하는 함수
		/*public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
			String s = "";
			String dates = (year+"") + two(month+"") + two(day+""); //20190314
			
			//날짜당 테이블 하나 생성
			s += "<table>";
			s += "<col width='98'>";
			for(CalendarDto dto : list) {
				if(dto.getRdate().substring(0, 8).equals(dates)) {
					s += "<tr bgcolor='green'>";
					s += "<td>";
					
					s += "<a href='caldetail.jsp?seq=" + dto.getSeq() + "'>";
					s += "<font style='font-size:6; font-color:black;'>";
					s += dot3( dto.getTitle() );
					s += "</font>";
					s += "</a>";
					
					s += "</td>";
					s += "</tr>";
				}
			}
			s += "</table>";
			
			return s;
		}*/
		
		//제목이 너무 길면, ...으로 한줄로 만드는 함수
		//ex) 데이트약속이 7시 -> 데이트약... 이렇게 만들어줌
		public static String dot3(String msg) {
			String s = "";
			
			if(msg.length()>=5) {
				s = msg.substring(0, 5);
				s += "..."; 
			}
			else {
				s = msg.trim();
			}
			
			return s;
		}
		
		//날짜문자열을 잘라줄 함수
		public static String getTimeFormat(String msg) {
			String s = String.format("%s-%s-%s %s:%s", 
					msg.substring(0, 4),
					msg.substring(4, 6),
					msg.substring(6, 8),
					msg.substring(8, 10),
					msg.substring(10, 12)
					);
			
			return s;
		}
		
		//날짜문자열을 잘라줄 함수
		public static String[] getTimeFormat(String msg, int i) {
			/*int[] str = new int[5];
			str[0] = Integer.parseInt(msg.substring(0, 4));
			str[1] = Integer.parseInt(msg.substring(4, 6));
			str[2] = Integer.parseInt(msg.substring(6, 8));
			str[3] = Integer.parseInt(msg.substring(8, 10));
			str[4] = Integer.parseInt(msg.substring(10, 12));*/
			
			String[] str = new String[5];
			str[0] = msg.substring(0, 4);
			str[1] = msg.substring(4, 6);
			str[2] = msg.substring(6, 8);
			str[3] = msg.substring(8, 10);
			str[4] = msg.substring(10, 12);
			
			return str;
		}
}
