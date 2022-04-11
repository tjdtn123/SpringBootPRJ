package kopo.poly.controller;

import kopo.poly.service.impl.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Slf4j
@Controller
public class EmailController {

    @Autowired
    private EmailService EmailService;

    @PostMapping("/register/email")
    @ResponseBody
    private int sendEmail(HttpServletRequest request, String userEmail) {
        HttpSession session = request.getSession();
        log.info("Controller_start!");
        log.info(userEmail);

        EmailService.mailSend(session, userEmail);
        return 123;

    }
    @PostMapping("/register/certification")
    @ResponseBody
    private boolean emailCertification(HttpServletRequest request, String userEmail, String inputCode){
        HttpSession session = request.getSession();
        boolean result = EmailService.emailCertification(session, userEmail, Integer.parseInt(inputCode));

        return result;
    }

}
