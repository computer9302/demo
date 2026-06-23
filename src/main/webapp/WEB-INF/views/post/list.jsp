<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h2>게시글 목록</h2>

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
            <td>${post.title}</td>
            <td>${post.writerName}</td>
            <td>${post.createdAt}</td>
        </tr>
    </c:forEach>
    <c:if test="${empty pageDto.list}">
        <tr>
            <td colspan="4" class="text-center">등록되 글이 없습니다.</td>
        </tr>
    </c:if>
    </tbody>
</table>

<!-- 페이징 버튼 -->
<nav>
    <ul class="pagination justify-content-center">
        <li class="page-item ${pageDto.hasPrev() ? '' : 'disabled'}">
            <a class="page-link" href="/posts?page=${pageDto.prevPage()}">이전</a>
        </li>

        <li class="page-item active">
            <span class="page-link">
                ${pageDto.page} / ${pageDto.totalPages}
            </span>
        </li>

        <li class="page-item ${pageDto.hasNext() ? '' : disabled}">
            <a class="page-link" href="/posts?page=${pageDto.nextPage()}">다음</a>
        </li>
    </ul>
</nav>

<a href="/main" class="btn btn-secondary">메인으로</a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>