package com.example.demo;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {

    private static final int PAGE_SIZE = 10; // 페이지당 10개

    private final PostMapper postMapper;

    public PostService(PostMapper postMapper) {
        this.postMapper = postMapper;
    }

    public PageDto<Post> getPostList(int page){
        if (page < 1){
            page=1;
        }

        int totalCount = postMapper.countAll();
        int offset = (page - 1) * PAGE_SIZE;

        List<Post> list = postMapper.findAllpaged(offset, PAGE_SIZE);

        return new PageDto<>(list, page, PAGE_SIZE, totalCount);
    }

    public Post getPost(Long postId){
        return postMapper.findById(postId);
    }

    public void createPost(Member loginMember, String title, String content){
        Post post = new Post();
        post.setMemberId(loginMember.getMemberId());
        post.setTitle(title);
        post.setContent(content);
        postMapper.insert(post);
    }

    public void updatePost(Long postId, Member loginMember, String title, String content){
        Post post = postMapper.findById(postId);

        if (post == null){
            throw new IllegalArgumentException("글이 없습니다.");
        }

        // 본인 글만 수정 (실무 기본)
        if (!post.getMemberId().equals(loginMember.getMemberId()))
        {
        throw new IllegalArgumentException("수정 권한이 없습니다.");
        }

        post.setTitle(title);
        post.setContent(content);
        postMapper.update(post);
    }

    public void deletePost(Long postId, Member loginMember){
        Post post = postMapper.findById(postId);

        if (post == null){
            throw new IllegalArgumentException("글이 없습니다.");
        }

        if (!post.getMemberId().equals(loginMember.getMemberId())){
            throw new IllegalArgumentException("삭제 권한이 없습니다.");
        }

        postMapper.delete(postId);
    }
}
