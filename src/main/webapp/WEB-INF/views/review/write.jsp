<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#btnWrite") );
		
		//form submit 수행하기
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<div class="container">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/review/write" method="post" enctype="multipart/form-data">

	<div class="form-group">
		<label for="rvTitle">제목</label>
		<input type="text" id="rvTitle" name="rvTitle" class="form-control" />
	</div>

	<div class="form-group">
		<label for="userId">작성자</label>
		<input type="text" id="userId" value="${sessionScope.id  }" readonly="readonly"
			class="form-control" />
	</div>
	
	<div class="form-group">
		<label for=""></label>
	</div>
	
	<div class="form-group">
		<label for="rvContent">본문</label>
		<textarea rows="10" style="width: 100%" id="rvContent" name="rvContent"></textarea>
	</div>
	
<!-- 	<label for="file">첨부파일</label> -->
<!-- 	<input type="file" name="file" id="file" /><br><br> -->
	
	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite">작성</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
	
</form>

</div>

<!-- 스마트 에디터 적용하는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "rvContent", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["rvContent"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
