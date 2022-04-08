package kopo.poly.service.impl;


import kopo.poly.Handler.MailHandler;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Random;

@Slf4j

@Service("EmailService")
public class EmailService {

    @Autowired
     private JavaMailSender javaMailSender;


    public void mailSend(HttpSession session, String userEmail) {
        try {
            log.info("EmailService_start!");
            MailHandler mailHandler = new MailHandler(javaMailSender);
            Random random = new Random(System.currentTimeMillis());
            long start = System.currentTimeMillis();

            int result = 100000 + random.nextInt(900000);

            mailHandler.setTo(userEmail);

            mailHandler.setFrom("tjdtndlwkd@naver.com");

            mailHandler.setSubject("인증번호입니다");

            String  htmlContent = "<p>인증번호 : "+result+"<p>";
            mailHandler.setText(htmlContent, true);
            
            mailHandler.send();

            long end = System.currentTimeMillis();

            session.setAttribute(""+userEmail,result);
            System.out.println("실행 시간 : " + (end -start)/1000.0);
            log.info("EmailService_end!");
        }
        catch (Exception e){
            e.printStackTrace();
        }



    }
}

