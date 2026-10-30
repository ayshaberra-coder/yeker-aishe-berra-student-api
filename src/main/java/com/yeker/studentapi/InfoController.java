package com.yeker.studentapi;

import java.util.Map;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class InfoController {

    @GetMapping("/")
    public Map<String, String> info() {
        return Map.of(
                "application", "Student API",
                "student", "Yeker Aishe-berra",
                "studentId", "37162",
                "group", "IT2-2309",
                "version", "1.0");
    }
}
