//
//
// Place.swift
// PlacePinServer
//
// Created by sturdytea on 18.11.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Vapor
import Fluent

final class Coordinates: Fields, @unchecked Sendable {
    @Field(key: "latitude")
    var latitude: Double
    
    @Field(key: "longitude")
    var longitude: Double
    
    init() { }
}

final class Place: Model, Content, @unchecked Sendable {
    static let schema = "places"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "coordinates")
    var coordinates: Coordinates
    
    init() { }
    
    init(id: UUID? = nil, name: String, coordinates: Coordinates) {
        self.id = id
        self.name = name
        self.coordinates = coordinates
    }
}
