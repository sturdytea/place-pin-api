//
//
// AppleAuthRequest.swift
// PlacePinServer
//
// Created by sturdytea on 19.12.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Vapor

struct AppleAuthRequest: Content {
    let identifyToken: String 
}
