---- **** 계정 생성 **** ----
show user; 
-- USER이(가) "SYS"입니다.

-- 오라클 계정생성시 계정명앞에 c## 을 붙이지 않고 생성하도록 하겠다.
alter session set "_ORACLE_SCRIPT" = true;
-- Session이(가) 변경되었습니다.
-- 그러면 이제부터는 계정생성시 c## 없이 계정 생성이 가능하다.

create user board_review identified by aclass default tablespace users;
-- User BOARD_REVIEW이(가) 생성되었습니다.

grant connect, resource, create view, unlimited tablespace to board_review;
-- Grant을(를) 성공했습니다.

show user;
-- USER이(가) "MYMVC_USER"입니다.
------------------------------------------------------------------------------

