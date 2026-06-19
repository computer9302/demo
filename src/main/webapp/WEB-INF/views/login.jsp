<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h2>로그인</h2>

<c:if test="${not empty errorMsg}">
    <div class="alert alert-danger">${errorMsg}</div>
</c:if>

<form method="post" action="/login">
    <div class="mb-3">
        <label class="form-label">아이디</label>
        <input type="text" name="loginId" class="from-control" required>
    </div>
    <div class="mb3-3">
        <label class="form-label">비밀번호</label>
        <input type="password" name="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">로그인</button>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>