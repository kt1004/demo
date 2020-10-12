package com.example.demo

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/")
class WelcomeController {

    @GetMapping()
    fun welcome(): ResponseEntity<String> {
        var msg = "Nice to meet you for the first time"
        return ResponseEntity.ok(msg)
    }
}