package kopo.poly.controller;


import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 *
 * slf4j는 스프링 프레임워크에서 로그 처리하는 인터페이스 기술이며,
 * 로그처리 기술인 log4j와 logback과 인터페이스 역할 수행함
 * 스프링 프레임워크는 기본으로 logback을 채택해서 로그 처리함
 * */
@Slf4j
@Controller
public class UserInfoController {

    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

    @GetMapping(value = "LoginPage")
    public String LoginPage() {
        return "/LoginPage";

    }

    @GetMapping(value = "register")
    public String Register() {
        return "/register";

    }
    @GetMapping("/Logout")
     public String Logout(HttpSession session, ModelMap model){
        String msg = "로그아웃 되었습니다";
        session.invalidate();
        model.addAttribute("msg", msg);
    return "/LogoutPage";
    }
    @GetMapping(value = "FindPwd")
    public String FindPwd() {
        return "/FindPwd";

    }
    @GetMapping(value = "PwdChange")
    public String PwdChange() {
        return "/PwdChange";

    }
    @GetMapping(value = "MyPage00")
    public String MyPage00() {
        return "/MyPage00";

    }


    @PostMapping("/Login")
    public String Login(HttpSession session, HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".Login start!");
        String msg = "";


        String user_id = CmmUtil.nvl(request.getParameter("user_id"));
        String password = CmmUtil.nvl(request.getParameter("password"));

        log.info("user_id : " + user_id);
        log.info("password : " + password);

        UserInfoDTO pDTO = new UserInfoDTO();

        pDTO.setUser_id(user_id);
        pDTO.setPassword(password);

        UserInfoDTO uDTO = userInfoService.Login(pDTO);

        msg = "로그인 성공";

        if (uDTO != null) {
            session.setAttribute("user_id", uDTO.getUser_id());
            session.setAttribute("user_seq", uDTO.getUser_seq());
            log.info(this.getClass().getName() + ".Login end!");

            log.info(uDTO.toString());
            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);
            return "/MsgToLogin";
        } else
            msg = "아이디 또는 비밀번호를 확인해주세요.";
            model.addAttribute("msg", msg);

        return "/MsgToLogin";



    }

    @PostMapping(value = "/Userinfoinsert")
    public String userinfoInsert(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".UserInfoInsert start!");

        String msg = "";

        try {
            /*
             * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
             */
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));
            String password = CmmUtil.nvl(request.getParameter("password")); // 제목
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            String email = CmmUtil.nvl(request.getParameter("emailText")); // 공지글 여부
            String addr1 = CmmUtil.nvl(request.getParameter("addr1")); // 내용
            String addr2 = CmmUtil.nvl(request.getParameter("addr2"));

            /*
             * ####################################################################################
             * 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함 반드시 작성할 것
             * ####################################################################################
             */
            log.info("user_id : " + user_id);
            log.info("password : " + password);
            log.info("user_name : " + user_name);
            log.info("email : " + email);
            log.info("addr1 : " + addr1);
            log.info("addr2 : " + addr2);

            UserInfoDTO uDTO = new UserInfoDTO();

            uDTO.setUser_id(user_id);
            uDTO.setPassword(password);
            uDTO.setUser_name(user_name);
            uDTO.setEmail(email);
            uDTO.setAddr1(addr1);
            uDTO.setAddr2(addr2);

            /*
             * 게시글 등록하기위한 비즈니스 로직을 호출
             */
            userInfoService.InsertUserInfo(uDTO);

            // 저장이 완료되면 사용자에게 보여줄 메시지
            msg = "등록되었습니다.";


        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".userinfoinsert end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/MsgToLogin";
    }

    @PostMapping("/register/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("user_id") String id){
        log.info("userIdCheck 진입");
        log.info("전달받은 id:"+id);
        int cnt = userInfoService.idCheck(id);
        log.info("확인 결과:"+cnt);
        return cnt;
    }

}
