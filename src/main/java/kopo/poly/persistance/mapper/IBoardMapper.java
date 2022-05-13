package kopo.poly.persistance.mapper;

import kopo.poly.Criteria.Criteria;
import kopo.poly.dto.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IBoardMapper {


    //게시글 총 개수
    int boardListCnt() throws Exception;

    //게시판 리스트
    List<BoardDTO> getBoardList(Criteria cri) throws Exception;

    //게시판 글 등록
    void InsertBoardInfo(BoardDTO pDTO) throws Exception;

    //게시판 상세보기
    BoardDTO getBoardInfo(BoardDTO pDTO) throws Exception;

    //게시판 조회수 업데이트
    void updateBoardReadCnt(BoardDTO pDTO) throws Exception;

    //게시판 글 수정
    void updateBoardInfo(BoardDTO pDTO) throws Exception;

    //게시판 글 삭제
    void deleteBoardInfo(BoardDTO pDTO) throws Exception;
}
