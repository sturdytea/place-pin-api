import JWT
import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "It works!"
    }

    app.get("places") { req async throws -> [Place] in
        try await Place.query(on: req.db).all()
    }
    
    app.post("places") { req async throws -> Place in
        let place = try req.content.decode(Place.self)
        try await place.save(on: req.db)
        return place
    }
    
    app.get("places", "id") { req async throws -> Place in
        guard let place = try await Place.find(req.parameters.get("id"), on: req.db) else {
            throw Abort(.notFound)
        }
        return place
    }
    
    app.post("login") { req async throws -> [String: String] in
        let payload = AppleIdentityTokenPayload(
            subject: "vapor",
            expiration: .init(value: .distantFuture),
            isAdmin: true
        )
        return try ["token": req.jwt.sign(payload)]
    }
    
    // Fetch and verify JWT from incoming request.
    app.get("me") { req async throws -> HTTPStatus in
        let payload = try req.jwt.verify(as: AppleIdentityTokenPayload.self)
        print(payload)
        return .ok
    }
}
