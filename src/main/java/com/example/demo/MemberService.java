package com.example.demo;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    private final MemberMapper memberMapper;
    private final PasswordEncoder passwordEncoder;

    public MemberService(MemberMapper memberMapper,
                         PasswordEncoder passwordEncoder){
        this.memberMapper = memberMapper;
        this.passwordEncoder = passwordEncoder;
    }

    public Member login(String loginId, String password){
        Member member = memberMapper.findByLoginId(loginId);

        // 회원 없음
        if (member == null){
            return null;
        }

        // BCrypt 해시 비교 (실무 방식)
        if (!passwordEncoder.matches(password, member.getPassword())){
            return null;
        }

        return member;
    }
}
