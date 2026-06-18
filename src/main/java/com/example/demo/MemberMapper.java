package com.example.demo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

    // Login_Id로 회원 1명 조회 (Day 1 연동 테스트용)
    Member findByLoginId(String loginId);
}
