package com.youyouxi.photo.wall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

/**
 * 首页控制器
 *
 * @author chenjianbin
 */
@Controller
public class IndexController {

    @GetMapping("/")
    public RedirectView redirectToIndex() {
        return new RedirectView("/index");
    }

    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("message", "Hello, this is a FreeMarker example!");
        return "index";
    }

}
