package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class AdminController {
    @GetMapping(value = "Admin_top")
    public String Admin_top() {
        return "/Admin_top";

    }
}
