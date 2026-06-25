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

<hr>
<h4>댓글</h4>

<ul class="list-group mb-3">
    <c:forEach var="comment" items="${comments}">
        <li class="list-group-item d-flex justify-content-between">
            <div>
                <strong>${comment.writerName}</strong>
        <span class="text-muted small ms-2">${comment.createdAt}</span>
        <div>${comment.content}</div>
        </div>
        <c:if test="${comment.memberId == loginMember.memberId}">
            <form method="post"
                action="/posts/${post.postId}/comments/${comment.commentId}/delete">
                <button type="submit" class="btn btn-sm btn-outline-danger">삭제</button>
            </form>
        </c:if>
        </li>
    </c:forEach>
    <c:if test="${empty comments}">
        <li class="list-group-item text-center text-muted">댓글이 없습니다.</li>
    </c:if>
</ul>

<form method="post" action="/posts/${post.postId}/comments">
    <div class="input-group">
        <input type="text" name="content" class="form-control"
            placeholder="댓글을 입력하세요" required>
        <button type="submit" class="btn btn-primary">등록</button>
    </div>
</form>

<a href="/posts" class="btn btn-secondary">목록</a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>