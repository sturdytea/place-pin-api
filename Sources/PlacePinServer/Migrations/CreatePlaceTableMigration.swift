//
//
// CreatePlaceTableMigration.swift
// PlacePinServer
//
// Created by sturdytea on 18.11.2025.
//
// GitHub: https://github.com/sturdytea
//
    

import Fluent

struct CreatePlaceTableMigration: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("places")
            .id()
            .field("name", .string)
            .field("coordinates_latitude", .double, .required)
            .field("coordinates_longitude", .double, .required)
            .create()
    }
    
    func revert(on database: any Database) async throws {
        try await database.schema("places")
            .delete()
    }
}
