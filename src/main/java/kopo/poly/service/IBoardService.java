package kopo.poly.service;

import kopo.poly.Criteria.Criteria;
import kopo.poly.dto.BoardDTO;

import java.util.List;

public interface IBoardService {

    int boardListCnt() throws Exception;

    List<BoardDTO> getBoardList(Criteria cri) throws Exception;

    void InsertBoardInfo(BoardDTO pDTO) throws Exception;

    BoardDTO getBoardInfo(BoardDTO pDTO) throws Exception;

    void updateBoardInfo(BoardDTO pDTO) throws Exception;

    void deleteBoardInfo(BoardDTO pDTO) throws Exception;

}
