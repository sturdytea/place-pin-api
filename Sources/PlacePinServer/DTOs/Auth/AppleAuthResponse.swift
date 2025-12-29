//
//
// AppleAuthResponse.swift
// PlacePinServer
//
// Created by sturdytea on 19.12.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Vapor

struct AppleAuthResponse: Content {
    let token: String
    let user: User
}
