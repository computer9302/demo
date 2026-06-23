package com.example.demo;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface PostMapper {

    // 전체 글 개수 (페이징 계산용)
    int countAll();

    // 목록 조회 (페이징)
    List<Post> findAllpaged(@Param("offset") int offset,
                            @Param("size") int size);


}
