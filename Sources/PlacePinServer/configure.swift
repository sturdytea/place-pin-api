import JWT
import Vapor
import Fluent
import FluentSQLiteDriver

public func configure(_ app: Application) async throws {
    
    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)
    
    // MARK: Migrations
    app.migrations.add(CreatePlaceTableMigration())
    
    // JWT (YOUR backend tokens)
    let jwtSecret = Environment.get("JWT_SECRET") ?? "dev-secret"
    app.jwt.signers.use(.hs256(key: jwtSecret))
    
    try routes(app)
}
