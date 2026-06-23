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
}
