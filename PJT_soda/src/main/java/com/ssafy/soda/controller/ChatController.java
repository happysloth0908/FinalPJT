package com.ssafy.soda.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ChatController {
	 	@Autowired
	    private ChatGptClient chatGptClient;

	    @PostMapping("ecto/chat")
	    public String chat(@RequestBody Map<String, String> request) {
	        return chatGptClient.askGpt(request.get("message"));
	    }
	}