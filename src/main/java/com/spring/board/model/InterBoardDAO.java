package com.spring.board.model;

import java.util.List;
import java.util.Map;

public interface InterBoardDAO {

	// spring_test 테이블에 insert 하기
	int test_insert();

	// spring_test 테이블에서 select 하기
	List<TestVO> test_select();

	// view단의 form 태그에서 입력받은 값을 spring_test 테이블에 insert 하기
	int test_insert(Map<String, String> paraMap);

	// view단의 form 태그에서 입력받은 값을 spring_test 테이블에 insert 하기
	int test_insert(TestVO vo);

	// 시작페이지에서 메인 이미지를 보여주는 것
	List<String> getImgfilenameList();

	// 로그인 처리하기
	MemberVO getLoginMember(Map<String, String> paraMap);

	// tbl_member 테이블의 idle 컬럼의 값을 1로 변경하기
	int updateIdle(String string);

	// 글쓰기(파일첨부가 없는 글쓰기)
	int add(BoardVO boardvo);

	// 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기  
	List<BoardVO> boardListNoSearch();
	
	
	
	
	
}
