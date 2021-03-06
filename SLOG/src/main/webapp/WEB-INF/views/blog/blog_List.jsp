<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/blog/Main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/blog/btn.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<!-- Main js -->
<script type="text/javascript" src="resources/script/blog/Main.js"></script>
<script type="text/javascript" src="resources/script/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	reloadList();
	Categet();
	/* 댓글등록 */
	$("#Comment_add").on("click", function() {
			var params = $("#replyForm").serialize();
			$.ajax({ 
				type : "post",
				url : "blogReplyRegisterAjax",
				dataType :"json",
				data : params,
				success:function(result) {
					if(result.res=="SUCCESS") {
// 						alert("등록되었습니다.");
						$("#actionForm").attr("action","blog_List");
						$("#actionForm").submit();
					} else {
						alert("등록에 실패하였습니다.");
					}
				},
				error:function(request,status,error) {
					console.log("status :" + request.status); //상태코드
					console.log("text :" + request.responceText); //request영역 반환텍스트
					console.log("error :" + request.error); //에러메세지
				}
			});
	});
	/* 글삭제 */
	$("#deleteBtn").on("click", function() {
		if ('${param.bmno}' == '${sBmNo}') {
			if (confirm("삭제하실겁니까?")) {
				var params = $("#actionForm").serialize();
				$.ajax({ 
					type : "post",
					url : "blogDeleteAjax",
					dataType :"json",
					data : params,
					success:function(result) {
						if(result.res=="SUCCESS") {
// 							alert("삭제되었습니다.");
							$("#actionForm").attr("action","blog_List");
							$("#actionForm").submit();
						} else {
							alert("삭제에 실패하였습니다.");
						}
					},
					error:function(request,status,error) {
						console.log("status :" + request.status); //상태코드
						console.log("text :" + request.responceText); //request영역 반환텍스트
						console.log("error :" + request.error); //에러메세지
					}
					
				});
			}
		}	else {
			alert("본인이 올린글만 삭제 가능합니다")
		}
	});
	/* 페이지버튼 클릭시 */
	$(".paging_area").on("click", "span", function() {
		console.log($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#page").val($(this).attr("name"));
			reloadList();	
		}
	});
	
	/*댓글 페이지버튼 클릭시 */
	$(".reply_paging_area").on("click", "span", function() {
		console.log($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#replypage").val($(this).attr("name"));
			reloadList();	
		}
	});
	/* 수정버튼 클릭시 */
	$("#updateBtn").on("click", function() {
		if ('${param.bmno}' == '${sBmNo}') {
			$("#actionForm").attr("action","blog_Update");
			$("#actionForm").submit();
		} else {
			alert("본인이 올린글만 수정가능합니다")
		}
	});
	
	/* 게시글목록 게시글 클릭시 */
	$("tbody").on("click","tr",function() {
		$("#no").val($(this).attr("name"));
		if($(this).attr("name") != "") {
			$("#no").val($(this).attr("name"));
			reloadDetailList();
// 			reloadList();
		}
	});
	
	/*  */
	$(".table_area").on("click", ".Blog_contents_area", function() {
		$("#no").val($(this).attr("name"));
		
		console.log($("#no").val());
	});
	
	/* 댓글 카운팅 */
	$("#Comment_textarea").on("keyup",function() {
		var content = $(this).val();
		console.log(content.length);
	    $('.Comment_cnt').html(content.length);    //글자수 실시간 카운팅

	    if (content.length > 200){
	        alert("최대 200자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 200));
	        $('#Comment_cnt').html("(200 / 최대 200자)");
	    }
	});
	
	/* 댓글 숨기기 보기 */
	$(".Blog_Comments_Button").on("click", function() {
		if($(".Blog_Comments_show").css("display") == "none"){
			console.log("체크");
			$(".Blog_Comments_show").show();
			$("#Blog_Comments_show").html("댓글 보기");
		}else{
			$(".Blog_Comments_show").hide();
			$("#Blog_Comments_show").html("댓글 숨기기");
		}
	});
	
// 	답글
// 	$(".Blog_Comments_reply_btn").on("click", function() {
// 		if($(this).parent().children(".Blog_Comments_reply").css("display") == "none"){
// 			replyshow($(this).parent().children(".Blog_Comments_reply"));
// 			console.log("체크");
// 			$(this).parent().children(".Blog_Comments_reply").show();
// 			$(this).css("background-color","#cacaca");
// 			$(this).css("color","#FFFFFF");
// 		}else{
// 			$(this).parent().children(".Blog_Comments_reply").hide();
// 			$(this).css("background-color","#F0F0F0");
// 			$(this).css("color","black");
// 		}
// 	});
	
	/* 카테고리 리스트 조회 */
	$(".category_list").on("click", "li", function(){
		$("#cate_no").val($(this).val());
		flag = false;
		$("#page").val("1");
		$("#no").val("");
		reloadList();
// 		reloadDetailList();
		
	});
	
	/* 댓글 삭제 */
	$(".Blog_Comments_show").on("click",".reply_del",function() {
		console.log("체크");
		console.log($(this).attr("name"));
		$("#replyno").val($(this).attr("name"));
		console.log($("#replyno").val())
		if($(this).attr("name") != "") {
// 			$("#page").val($(this).attr("name"));
// 			reloadList();	
		}
		
		if (confirm("삭제하실겁니까?")) {
			var params = $("#replyForm").serialize();
			$.ajax({ 
				type : "post",
				url : "blogreplyDeleteAjax",
				dataType :"json",
				data : params,
				success:function(result) {
					if(result.res=="SUCCESS") {
//							alert("삭제되었습니다.");
						$("#actionForm").attr("action","blog_List");
						$("#actionForm").submit();
					} else {
						alert("삭제에 실패하였습니다.");
					}
				},
				error:function(request,status,error) {
					console.log("status :" + request.status); //상태코드
					console.log("text :" + request.responceText); //request영역 반환텍스트
					console.log("error :" + request.error); //에러메세지
				}
				
			});
		}
	});
	
	/* 검색 */
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
});

var flag = false;

function replylist(replylist) {
	var html = "";
	
	var sBmNo= $("#bm_no").val(); 
	if(replylist.length == 0) {
		
	} else {
		for(var i in replylist) {
			html +="<div class=\"Blog_Comments_box\" name=\"" + replylist[i].REPLY_NO + "\">";
			html +="	<div class=\"Blog_Comments_author\">    ";
			html +="		 "+ replylist[i].BM_NM +"";
			html +="	</div>                                ";
			html +="	<div class=\"Blog_Comments_contents\">";
			html +="		"+ replylist[i].REPLY_CONTENTS +"";
			html +="	</div>                                ";
			html +="	<div class=\"Blog_Comments_date\">";
			html +="		"+ replylist[i].REPLY_DT +"";
			if(sBmNo == replylist[i].BM_NO) {
			var replycnt = replylist[i].BM_NO;
				html +="<input type=\"button\" name=\""+replylist[i].REPLY_NO+"\"  id=\"Comment_del\"  class=\"reply_del\"value=\"삭제\">" ;
			}
			html +="	</div>                                ";
			html +="</div>                                    ";
			}
	}
	
	$(".Blog_Comments_boxarea").html(html);
}
function replyCnt(recnt) {
	var html = "";
	html += recnt;
	$(".Blog_Comments_Cnt").html(html);
}
function replyshow(obj){
	var html ="";
		html += "<div class=\"Blog_Comments_textbox_area\">";
		html += "	<div class=\"Blog_Comments_textbox_author\">";
		html += "		작성자 : ${sBmNm}";
		html += "	</div>";
		html += "	<textarea class=\"Blog_Comments_textbox\"  placeholder=\"답글을 작성하려면 로그인 해주세요\" id=\"Comment_textarea\"></textarea>";
		html += "	<div class=\"Blog_Comments_textbox_cnt_area\"><span class=\"Comment_cnt\">0</span>/200<input type=\"button\" id=\"Comment_add\" value=\"등록\"></div>";
		html += "</div>";
	obj.html(html);

}

function reloadList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "blogListAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			redrawList(result.list);
			redrawList1(result.data);
			replylist(result.replylist);
			redrawreplyPaging(result.rppb);
			replyCnt(result.recnt);
			redrawPaging(result.pb);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}

function reloadDetailList() {
	var params = $("#actionForm").serialize();
	$.ajax({ 
		type : "post",
		url : "blogDetailAjax",
		dataType :"json",
		data : params,
		success:function(result) {
			redrawList(result.list);
			redrawList1(result.data);
			replylist(result.replylist);
			redrawreplyPaging(result.rppb);
			replyCnt(result.recnt);
			redrawPaging(result.pb);
		},
		error:function(request,status,error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
		
	});
}

function redrawList(list) {
	var html ="";
	if(list.length == 0 ) {
		html += "<tr>";
		html += "<td colspan=\"2\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i in list) {
			html += "<tr name=\"" + list[i].B_NO + "\">";
			html += "<th>" + list[i].B_TITLE +"</th>";
			html += "<td>" + list[i].B_DT +"</td>";
			html += "<td>" + list[i].B_HIT +"</td>";
			html += "</tr>";
		}
	}
	
	$("tbody").html(html);
	
	$(".Blog_table>tbody>tr").each(function() {
		var loc = $(this);
		if(list.length > 0) {
			if(loc.attr("name") == list[0].B_NO && !flag) {
				flag = true;
				loc.click();
			}	
		}
	});
}
function redrawList1(data) {
	var html ="";
	var html1 ="";
	if(data == null ) {
		html += "<div name=\"" + "\">";
		html += "" + "<br/>";
		html += "" + "<br/>";
		html += "" + "<br/>";
		html += "<div class=\"Details_header\" name=\"" + "\">";
		html += "	<div class=\"Details_title\">";
		html += "		<h2>"+"</h2>";
		html += "	</div>";
		html += "	<div class=\"Details_author\">";
		html += "<input type=\"hidden\" name=\"CT_NAME\" id=\"CT_NAME\" value=\""+"\"/>";
		html += "		 카테고리 : "+" </br>" + "작성자 | " + "" + "&nbsp;&nbsp;&nbsp;&nbsp;	작성일 | " + "";
		html += "	</div>";
		html += "</div>";
		html += "<div class=\"Detail_contents\">";
		html += ""+  "조회된 글이 없습니다" + "";
		html += "</div>";
		
		$(".category_num").each(function() {
			if($(this).val() == $("#cate_no").val()) {
				html1 += $(this).children("a").html() + "카테고리의 다른글";
			} 
		});
	} else {
			html += "<div name=\"" + data.B_NO + "\">";
			html += "" + data.B_TITLE +"<br/>";
			html += "" + data.B_DT +"<br/>";
			html += "" + data.B_HIT +"<br/>";
			html += "<div class=\"Details_header\" name=\"" + data.B_NO + "\">";
			html += "	<div class=\"Details_title\">";
			html += "		<h2>"+ data.B_TITLE +"</h2>";
			html += "	</div>";
			html += "	<div class=\"Details_author\">";
			html += "<input type=\"hidden\" name=\"CT_NAME\" id=\"CT_NAME\" value=\""+data.CT_NAME+"\"/>";
			html += "		 카테고리 : "+data.CT_NAME+" </br>" + "작성자 | "+ data.BM_NM + "" + "&nbsp;&nbsp;&nbsp;&nbsp;	작성일 | " + data.B_DT + "";
			html += "	</div>";
			html += "</div>";
			html += "<div class=\"Detail_contents\">";
			html += ""+  data.B_CON + "";
			html += "</div>";
			if (($("#cate_no").val() != '')){
				if (($("#cate_no").val() != 0) || $("#cate_no").val() == '') {
					html1 += data.CT_NAME + " 카테고리의 다른글";
				}
				else {
					html1 += "전체글" ;
				}
			}
			else {
				html1 += "전체글" ;
			}
			
	}
	$(".Blog_Details").html(html);
	$(".Blog_table_title").html(html1);
	
}
function redrawreplyPaging(rppb) {
	var html ="";
	//첫페이지
	html += "<span name=\"1\"><<</span>&nbsp;";
	//이전페이지
	
	if($("#replypage").val() == "1" ) {
		html += "<span name=\"1\"><</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#replypage").val() * 1 - 1) + "\"><</span>&nbsp;";
	}
	
	//숫자
	for(var i = rppb.startPcount ; i <= rppb.endPcount ; i++) {
		if($("#replypage").val() == i ) {
			html += "<span><b>" + i + "</b></span>&nbsp;";
		} else{
			html += "<span name=\"" + i + "\">" + i + "</span>&nbsp;";
		}
	}
	//다음페이지
	
	if($("#replypage").val() == rppb.maxPcount ) {
		html += "<span name=\""+rppb.maxPcount+ "\">></span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#replypage").val() * 1 + 1) + "\">></span>&nbsp;";
	}
	
	//마지막
	html += "<span name=\"" + rppb.maxPcount + "\">>></span>";
	
	$(".reply_paging_area").html(html);
}
function redrawPaging(pb) {
	var html ="";
	//첫페이지
	html += "<span name=\"1\"><<</span>&nbsp;";
	//이전페이지
	
	if($("#page").val() == "1" ) {
		html += "<span name=\"1\"><</span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 - 1) + "\"><</span>&nbsp;";
	}
	
	//숫자
	for(var i = pb.startPcount ; i <= pb.endPcount ; i++) {
		if($("#page").val() == i ) {
			html += "<span><b>" + i + "</b></span>&nbsp;";
		} else{
			html += "<span name=\"" + i + "\">" + i + "</span>&nbsp;";
		}
	}
	//다음페이지
	
	if($("#page").val() == pb.maxPcount ) {
		html += "<span name=\""+pb.maxPcount+ "\">></span>&nbsp;";
	} else {
		html += "<span name=\"" + ($("#page").val() * 1 + 1) + "\">></span>&nbsp;";
	}
	
	//마지막
	html += "<span name=\"" + pb.maxPcount + "\">>></span>";
	
	$(".paging_area").html(html);
}
</script>
</head>
<body>
<div class="left_wrap">
	<div class="logo_wrap">
		<h1 style="cursor:pointer;">
			SLOG
		</h1>
	</div>
	<div class="category">
		<ul class="category_list">
			<li>
				<a>카테고리 <span class="c_cnt">(0)</span></a>
			</li>
				<ul>
					<li>
						<a>카테고리1 <span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리2<span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리3<span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리4<span class="c_cnt">(0)</span></a>
					</li>						
					<li>
						<a>카테고리5<span class="c_cnt">(0)</span></a>
					</li>						
				</ul>
		</ul>
	</div>
</div>
 
<div class="whole_body">
	<div class="wrap">
		<div class="gnb_area">
			<div class="gnb_btn_area">
			<div class="gnb_search_area">
				<form action="#" id="actionForm" method="post">
					<input type="hidden" name="page" id="page" value="1"/>
					<input type="hidden" name="replypage" id="replypage" value="1"/>
					
					<input type="hidden" name="no" id="no" value="${param.no}"/>
					<input type="hidden" name="bmno" id="bmno" value="${param.bmno}"/>
					<input type="hidden" name="bm_no" id="bm_no" value="${sBmNo}"/>
					<input type="hidden" name="cate_no" id="cate_no" value="${param.cate_no}"/>
<%-- 					<input type="hidden" name="searchGbn" value="${param.searchGbn}"/> --%>
<%-- 					<input type="hidden" name="searchTxt" value="${param.searchTxt}"/> --%>
					<div class="search_area">
						<select name="searchGbn" style="height: 100%;">
							<option value="0">제목</option>
							<option value="1">작성자</option>
							<option value="2">제목 + 작성자</option>
						</select>
						<input type="text" name="searchTxt"  style="height: calc(100% - 6px); vertical-align: top;"/>
						<input type="button" value="검색" id="searchBtn"  style="height: 100%;"/>
					
					<c:if test="${!empty sBmNo}">
						<input type="button" value="등록" id="writeBtn" style="height: calc(100%); vertical-align: top;"/>
					</c:if>
					</div>
				</form>
			</div>
			<c:choose>
				<c:when test="${!empty sBmNo}">
					${sBmNm}님 어서오세요. <input type="button" value="로그아웃" id="logoutBtn" style="height: 30px; vertical-align: top;"/>
					<div class="setting">
						설정
					</div>
					<div class="setting_area">
						<div class="setting_hover" style="border-bottom : 1px solid #cacaca;" id="modifyBtn">회원 정보 수정</div><br>
						<div class="setting_hover" id="categoryBtn">카테고리 설정</div>
					</div>
				</c:when>
				<c:otherwise>
					<input type="button" value="로그인" id="loginBtn"  />&nbsp;
					<input type="button" id="joinBtn" value="회원가입">
				</c:otherwise>
			</c:choose>
<!-- 				<span>내 블로그</span>&nbsp; | &nbsp; -->
<!-- 				<span>이웃블로그</span>&nbsp; | &nbsp; -->
<!-- 				<span>블로그 홈</span>&nbsp; | &nbsp; -->
			</div>
		</div>
	</div>	
	<div class="gnb_area_bottom">
		<div class="btn_area_left">
		</div>
	</div>
	<div class="Blog_Details_area">
		<div class="Blog_Details">
			<div class="Details_header">
				<div class="Details_title">
				</div>
				<div class="Details_author">
				</div>
			</div>
			<div class="Detail_contents">
			</div>
		</div>
		<div class="Blog_Comments_area">
			<div class="Blog_Comments_Button" id="Comments_show">
				<img style="width : 30px; height : 30px;"alt="comments_button" src="resources/images/blog/comment.PNG">
				<div class="Blog_Comments_text">
				<span id="Blog_Comments_show">댓글 보기</span>
				 (<span class="Blog_Comments_Cnt"> </span>)
				 
				 </div>
				
			</div>
			<div class="Blog_Comments_show">
				<div class="Blog_Comments_boxarea">
				</div>
				<div class="reply_paging_area">
					<span>처음</span>
					<span>이전</span>
					<span>1</span>
					<span>다음</span>
					<span>마지막</span>
				</div>
				
				<div class="Blog_Comments_textbox_area">
					<div class="Blog_Comments_textbox_author">
						작성자 : ${sBmNm}
					</div>
					<form action="#" id="replyForm" method="post">
						<c:choose>
							<c:when test="${!empty sBmNo}">
							<input type="hidden" name="rno" id="rno" value="${param.no}"/>
							<input type="hidden" name="replyno" id="replyno" value=""/>
								<textarea class="Blog_Comments_textbox" name="Comment_textarea" id="Comment_textarea"></textarea>
								<div class="Blog_Comments_textbox_cnt_area">
									<span class="Comment_cnt">0</span>/200 &nbsp;&nbsp;
									<input type="button" id="Comment_add" class="btn"value="등록">
								</div>
							</c:when>
							
							<c:otherwise>
								<textarea class="Blog_Comments_textbox" name="Comment_textarea" id="Comment_textarea" placeholder="댓글을 작성하려면 로그인 해주세요" readonly="readonly" id="Comment_textarea"></textarea>
								<div class="Blog_Comments_textbox_cnt_area">
								<span class="Comment_cnt">0</span>/200 &nbsp;&nbsp;</div>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
			</div>
		</div>
		<div class="btn_area" style="margin-right: 40px;">
			<c:choose>
				<c:when test="${sBmNo eq param.bmno}"> 
					<input type="button" class="btn" value="목록" id="listBtn"/>
					<input type="button" class="btn" value="수정" id="updateBtn"/>
					<input type="button" class="btn" value="삭제" id="deleteBtn"/>
				</c:when>
				<c:otherwise>
				 	<input type="button" class="btn" value="목록" id="listBtn"/>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="table_area">
		<div class="Blog_table_list">
				<h4 class="Blog_table_title">전체글</h4>
				<hr>
			<table class="Blog_table">
				<colgroup>
					<col width="70%">	
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
<!-- 						<th>번호</th> -->
						<th>제목</th>
<!-- 						<th>작성자</th> -->
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">조회된 데이터가 없습니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="Blog_list_area">
		</div>
		<div class="paging_area">
			<span><<</span>
			<span><</span>
			<span>1</span>
			<span>></span>
			<span>>></span>
		</div>
	</div>
</div>
</body>
</html>