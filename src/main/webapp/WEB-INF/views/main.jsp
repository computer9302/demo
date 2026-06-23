<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h2>메인</h2>
<p>안녕하세요, <strong>${loginMember.name}</strong>님</p>

<form method="post" action="logout">
    <button type="submit" class="btn btn-secondary">로그아웃</button>
</form>

<a href="/posts" class="btn btn-primary">게시글 목록</a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>