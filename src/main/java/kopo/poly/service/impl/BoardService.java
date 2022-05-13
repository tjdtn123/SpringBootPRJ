package kopo.poly.service.impl;

import kopo.poly.Criteria.Criteria;
import kopo.poly.dto.BoardDTO;
import kopo.poly.persistance.mapper.IBoardMapper;
import kopo.poly.service.IBoardService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service("BoardService")
public class BoardService implements IBoardService {
   
    private final IBoardMapper boardMapper;

    @Autowired
    public BoardService(IBoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

    @Override
    public List<BoardDTO> getBoardList(Criteria cri) throws Exception {

        log.info(this.getClass().getName() + ".getBoardList start!");
        log.info(this.getClass().getName() + ".getBoardList End!");
        return boardMapper.getBoardList(cri);

    }

    @Override
    public int boardListCnt() throws Exception {
        return boardMapper.boardListCnt();
    }



    @Transactional
    @Override
    public void InsertBoardInfo(BoardDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertBoardInfo start!");
        log.info(this.getClass().getName() + ".InsertBoardInfo end!");

        boardMapper.InsertBoardInfo(pDTO);
    }

    @Transactional
    @Override
    public BoardDTO getBoardInfo(BoardDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".getBoardInfo start!");

        // 상세보기 할때마다, 조회수 증가하기
        log.info("Update ReadCNT");
        boardMapper.updateBoardReadCnt(pDTO);

        return boardMapper.getBoardInfo(pDTO);

    }

    @Transactional
    @Override
    public void updateBoardInfo(BoardDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".updateBoardInfo start!");

        boardMapper.updateBoardInfo(pDTO);

    }

    @Transactional
    @Override
    public void deleteBoardInfo(BoardDTO pDTO) throws Exception {

        log.info(this.getClass().getName() + ".deleteBoardInfo start!");

        boardMapper.deleteBoardInfo(pDTO);

    }

}
