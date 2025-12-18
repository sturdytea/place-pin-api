import Vapor
import Fluent
import FluentSQLiteDriver

public func configure(_ app: Application) async throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    // MARK: Migrations
    app.migrations.add(CreatePlaceTableMigration())
    
    try routes(app)
}
