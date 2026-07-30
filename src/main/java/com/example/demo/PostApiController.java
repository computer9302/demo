package com.example.demo;

import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

@RestController
@RequestMapping("/api/posts")
public class PostApiController {

    private final PostService postService;
    private final CommentService commentService;

    public PostApiController(PostService postService, CommentService commentService) {
        this.postService = postService;
        this.commentService = commentService;
    }

    private Member getLoginMember(HttpSession session){
        Member member = (Member) session.getAttribute("loginMember");
        if (member == null){
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "로그인이 필요합니다.");
        }
        return member;
    }

    // 댓글 등록 (AJAX)
    @PostMapping("/{postId}/comments")
    public CommentResponse addComment(@PathVariable Long postId,
                                      @RequestParam String content,
                                      HttpSession session){
        Member loginMember = getLoginMember(session);
        Comment comment = commentService.addComment(postId, loginMember, content);
        return CommentResponse.from(comment);
    }

    // 댓글 삭제 (AJAX)
    @DeleteMapping("/{postId}/comments/{commentId}")
    public ApiResponse deleteComment(@PathVariable Long postId,
                                     @PathVariable Long commentId,
                                     HttpSession session){
        Member loginMember = getLoginMember(session);
        try {
            commentService.deleteComment(commentId, loginMember);
            return new ApiResponse(true, "댓글이 삭제되었습니다.");
        } catch(IllegalArgumentException e){
            return new ApiResponse(false, e.getMessage());
        }
    }

    // 게시글 삭제 (AJAX)
    @DeleteMapping("/{postId}")
    public ApiResponse delePost(@PathVariable Long postId,
                                HttpSession session){
        Member loginMember = getLoginMember(session);
        try{
            postService.deletePost(postId, loginMember);
            return new ApiResponse(true, "삭제되었습니다.");
        }catch (IllegalArgumentException e){
            return new ApiResponse(false, e.getMessage());
        }
    }
}
