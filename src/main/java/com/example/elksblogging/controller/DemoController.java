package com.example.elksblogging.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

  @GetMapping("/endpoint1")
  public String endpoint1() {
    return "Response from endpoint1";
  }

  @GetMapping("/endpoint2")
  public String endpoint2() {
    return "Response from endpoint2";
  }

  @PostMapping("/endpoint3")
  public String endpoint3(@RequestBody String body) {
    return "Received data: " + body;
  }
}
