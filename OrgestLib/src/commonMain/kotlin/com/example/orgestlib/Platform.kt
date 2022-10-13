package com.example.orgestlib

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform