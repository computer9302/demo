<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h2>${post.title}</h2>

<div class="mb-3 text-muted">
    작성자: ${post.writerName} |
    작성일: ${post.createdAt}
</div>

<div class="mb-4" style="white-space: pre-wrap;">${post.content}</div>

<!-- 본인 글일 때만 수정/삭제 -->
<c:if test="${post.memberId == loginMember.memberId}">
    <a href="/posts/${post.postId}/edit" class="btn btn-warning">수정</a>

<form method="post" action="/posts/${post.postId}/delete" class="d-inline">
    <button type="submit" class="btn btn-danger"
            onclick="return confirm('삭제하시겠습니까?')">삭제</button>
</form>
</c:if>

<a href="/posts" class="btn btn-secondary">목록</a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>