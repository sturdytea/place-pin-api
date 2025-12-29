//
//
// User.swift
// PlacePinServer
//
// Created by sturdytea on 19.12.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Vapor
import Fluent

final class User: Model, Content, @unchecked Sendable {
    
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "apple_user_id")
    var appleUserID: String
    
    @OptionalField(key: "email")
    var email: String?
    
    @OptionalField(key: "name")
    var name: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    init() {}
    init(appleUserID: String, email: String?, name: String?) {
        self.appleUserID = appleUserID
        self.email = email
        self.name = name
    }
}
