package com.app.ruralworkers.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReadMeController {
    @GetMapping("/ReadMe")
    public String SayAboutMe()
    {
        return "Hi Sabeek How are you";
    }
}
