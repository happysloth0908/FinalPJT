package com.ssafy.soda.model.dao;

import java.util.List;

import com.ssafy.soda.model.dto.Board;
import com.ssafy.soda.model.dto.SearchCondition;

public interface BoardDao {

	List<Board> selectAll();

	Board selectByNo(int no);

	void delete(int no);

	List<Board> selectBoardSearched(SearchCondition searchCondition);

	List<Integer> allLikesCount();

	int likesCount(int no);


}
