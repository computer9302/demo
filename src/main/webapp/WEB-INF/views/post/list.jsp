<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<c:if test="${not empty errorMsg}">
    <div class="alert alert-danger">${errorMsg}</div>
</c:if>

<h2>게시글 목록</h2>

<form method="get" action="/posts" class="row g-2 mb-3">
    <div class="col-auto">
        <select name="type" class="form-select">
            <option value="title" ${type == 'title' ? 'selected' : ''}>제목</option>
            <option value="writer" ${type == 'writer' ? 'selected' : ''}>작성자</option>
        </select>
    </div>
    <div class="col-auto">
        <input type="text" name="keyword" class="form-control"
               value="${keyword}" placeholder="검색어">
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-outline-primary">검색</button>
    </div>
</form>

<div class="mb-3">
    <a href="/posts/new" class="btn btn-primary">글쓰기</a>
</div>

<table class="table table-striped">
    <thead>
    <tr>
        <th style="width:10%">번호</th>
        <th style="width:50%">제목</th>
        <th style="width:20%">작성자</th>
        <th style="width:20%">작성일</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${pageDto.list}">
        <tr>
            <td>${post.postId}</td>
            <td>
            <a href="/posts/${post.postId}">${post.title}</a>
            </td>
            <td>${post.writerName}</td>
            <td>${post.createdAt}</td>
        </tr>
    </c:forEach>
    <c:if test="${empty pageDto.list}">
        <tr>
            <td colspan="4" class="text-center">등록된 글이 없습니다.</td>
        </tr>
    </c:if>
    </tbody>
</table>

<!-- 페이징 버튼 -->
<nav>
    <ul class="pagination justify-content-center">
        <li class="page-item ${pageDto.hasPrev() ? '' : 'disabled'}">
            <a class="page-link" href="/posts?page=${pageDto.prevPage()}&type=${type}&keyword=${keyword}">이전</a>
        </li>

        <li class="page-item active">
            <span class="page-link">
                ${pageDto.page} / ${pageDto.totalPages}
            </span>
        </li>

        <li class="page-item ${pageDto.hasNext() ? '' : 'disabled'}">
            <a class="page-link" href="/posts?page=${pageDto.nextPage()}&type=${type}&keyword=${keyword}">다음</a>
        </li>
    </ul>
</nav>

<a href="/main" class="btn btn-secondary">메인으로</a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>