<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

<h2>글쓰기</h2>

<form method="post" action="/posts">
    <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" name="title" class="form-control" required>
    </div>
    <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea name="content" class="form-control" rows="10" required></textarea>
    </div>
    <button type="submit" class="btn btn-primary">등록</button>
    <a href="/posts" class="btn btn-secondary">목록</a>
</form>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>