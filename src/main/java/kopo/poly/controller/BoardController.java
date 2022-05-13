package kopo.poly.controller;

import kopo.poly.Criteria.Criteria;
import kopo.poly.dto.BoardDTO;
import kopo.poly.dto.PageMakeDTO;
import kopo.poly.service.IBoardService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller

public class BoardController {
    @Resource(name = "BoardService")
    private IBoardService boardService;
    /**
     * GetMapping은 GET방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * PostMapping은 POST방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * GetMapping(value = "index") =>  GET방식을 통해 접속되는 URL이 index인 경우 아래 함수를 실행함
     */
    @GetMapping(value = "index")
    public String Index() {
        return "/index";

    }


    /**
     * 게시판 리스트 보여주기
     *
     * GetMapping(value = "board/boardList") =>  GET방식을 통해 접속되는 URL이 board/boardList인 경우 아래 함수를 실행함
     */
    @GetMapping(value = "board/BoardList")
    public String boardList(ModelMap model, Criteria cri)
            throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".BoardList start!");
        // 공지사항 리스트 가져오기
        List<BoardDTO> rList = boardService.getBoardList(cri);

        if (rList == null) {
            rList = new ArrayList<>();

        }

        //전체 글 개수
        int total = boardService.boardListCnt();

        //페이징 객체
        PageMakeDTO pageMake = new PageMakeDTO(cri, total);


        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("rList", rList);
        model.addAttribute("pageMaker",pageMake);

        // 로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".BoardList end!");

        // 함수 처리가 끝나고 보여줄 JSP 파일명(/WEB-INF/view/notice/NoticeList.jsp)
        return "/board/BoardList";

    }

    /**
     * 게시판 작성 페이지 이동
     *
     * 이 함수는 게시판 작성 페이지로 접근하기 위해 만듬. WEB-INF 밑에 존재하는 JSP는 직접 호출할 수 없음 따라서 WEB-INF 밑에
     * 존재하는 JSP를 호출하기 위해서는 반드시 Controller 등록해야함
     *
     * GetMapping(value = "board/boardReg") =>  GET방식을 통해 접속되는 URL이 board/boardReg인 경우 아래 함수를 실행함
     */
    @GetMapping(value = "board/BoardReg")
    public String boardReg() {

        log.info(this.getClass().getName() + ".boardReg start!");

        log.info(this.getClass().getName() + ".boardReg end!");

        return "/board/BoardReg";
    }

    /**
     * 게시판 글 등록
     */
    @PostMapping(value = "board/BoardInsert")
    public String boardInsert(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".boardInsert start!");

        String msg = "";

        try {
            /*
             * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
             */
            String user_id = CmmUtil.nvl((String) session.getAttribute("user_id"));
            String title = CmmUtil.nvl(request.getParameter("title")); // 제목
            String noticeYn = CmmUtil.nvl(request.getParameter("noticeYn")); // 공지글 여부
            String contents = CmmUtil.nvl(request.getParameter("contents")); // 내용

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("user_id : " + user_id);
            log.info("title : " + title);
            log.info("noticeYn : " + noticeYn);
            log.info("contents : " + contents);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setUser_id(user_id);
            pDTO.setTitle(title);
            pDTO.setNotice_yn(noticeYn);
            pDTO.setContents(contents);

            /*
             * 게시글 등록하기위한 비즈니스 로직을 호출
             */
            boardService.InsertBoardInfo(pDTO);

            // 저장이 완료되면 사용자에게 보여줄 메시지
            msg = "등록되었습니다.";


        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".boardInsert end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/board/MsgToList";
    }

    /**
     * 게시판 상세보기
     */
    @GetMapping(value = "board/BoardInfo")
    public String boardInfo(HttpServletRequest request, ModelMap model, Criteria cri) {

        log.info(this.getClass().getName() + ".getboardInfo start!");

        String msg = "";

        try {
            /*
             * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
             */
            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 공지글번호(PK)

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("nSeq : " + nSeq);

            /*
             * 값 전달은 반드시 DTO 객체를 이용해서 처리함 전달 받은 값을 DTO 객체에 넣는다.
             */
            BoardDTO pDTO = new BoardDTO();
            pDTO.setBoard_seq(nSeq);

            // 공지사항 상세정보 가져오기
            BoardDTO rDTO = boardService.getBoardInfo(pDTO);

            if (rDTO == null) {
                rDTO = new BoardDTO();

            }

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("pageInfo", rDTO);
            model.addAttribute("cri",cri);


        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".getboardInfo end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }



        return "/board/BoardInfo";
    }

    /**
     * 게시판 수정 보기
     */
    @GetMapping(value = "board/BoardEditInfo")
    public String boardEditInfo(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".boardEditInfo start!");

        String msg = "";

        try {

            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 공지글번호(PK)

            log.info("nSeq : " + nSeq);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setNotice_yn(nSeq);

            /*
             * ####################################################### 공지사항 수정정보 가져오기(상세보기
             * 쿼리와 동일하여, 같은 서비스 쿼리 사용함)
             * #######################################################
             */
            BoardDTO rDTO = boardService.getBoardInfo(pDTO);

            if (rDTO == null) {
                rDTO = new BoardDTO();

            }

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("rDTO", rDTO);

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".boardUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        log.info(this.getClass().getName() + ".boardEditInfo end!");

        return "/board/BoardEditInfo";
    }

    /**
     * 게시판 글 수정
     */
    @PostMapping(value = "board/BoardUpdate")
    public String boardUpdate(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".boardUpdate start!");

        String msg = "";

        try {

            String user_id = CmmUtil.nvl((String) session.getAttribute("user_id")); // 아이디
            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 글번호(PK)
            String title = CmmUtil.nvl(request.getParameter("title")); // 제목
            String noticeYn = CmmUtil.nvl(request.getParameter("noticeYn")); // 공지글 여부
            String contents = CmmUtil.nvl(request.getParameter("contents")); // 내용

            log.info("user_id : " + user_id);
            log.info("nSeq : " + nSeq);
            log.info("title : " + title);
            log.info("noticeYn : " + noticeYn);
            log.info("contents : " + contents);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setUser_id(user_id);
            pDTO.setBoard_seq(nSeq);
            pDTO.setTitle(title);
            pDTO.setNotice_yn(noticeYn);
            pDTO.setContents(contents);

            // 게시글 수정하기 DB
            boardService.updateBoardInfo(pDTO);

            msg = "수정되었습니다.";

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".boardUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/board/MsgToList";
    }

    /**
     * 게시판 글 삭제
     */
    @GetMapping(value = "board/BoardDelete")
    public String boardDelete(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".boardDelete start!");

        String msg = "";

        try {

            String nSeq = CmmUtil.nvl(request.getParameter("nSeq")); // 글번호(PK)

            log.info("nSeq : " + nSeq);

            BoardDTO pDTO = new BoardDTO();

            pDTO.setBoard_seq(nSeq);

            // 게시글 삭제하기 DB
            boardService.deleteBoardInfo(pDTO);

            msg = "삭제되었습니다.";

        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".boardDelete end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/board/MsgToList";
    }

}
