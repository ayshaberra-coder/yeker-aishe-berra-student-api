package com.yeker.studentapi;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class StudentTest {

    @Test
    void studentKeepsName() {
        Student student = new Student("Yeker Aishe-berra", "aishe.berra@example.com");
        assertEquals("WRONG NAME", student.getFullName());
    }
}
