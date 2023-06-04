import Vapor
import Dispatch
import Logging

private extension Vapor.Application {
    static let baseExecutionQueue = DispatchQueue(label: "vapor.codes.entrypoint")

    func runFromAsyncMainEntryPoint() async throws {
        try await withCheckedThrowingContinuation { continuation in
            Vapor.Application.baseExecutionQueue.async { [self] in
                do {
                    try self.run()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

@main
enum Entrypoint {
    
    static func main() async throws {
        var env = try Environment.detect()
        try LoggingSystem.bootstrap(from: &env)

        let app = Application(env)
        defer { app.shutdown() }

        try await configure(app)
        try await app.runFromAsyncMainEntryPoint()
    }
}

import PSNetwork
import PSNetworkVapor
import PSNetworkVaporSharedLibrary

extension GetOutput: Content { }
extension EmptyBodyParameter: Content { }
extension EmptyResponseModel: Content { }

extension PostInput: Content { }
extension PostOutput: Content { }

extension GetRequest: PSNetworkVapor.Endpoint {
    public static func register(with routes: Vapor.RoutesBuilder) {
        routes.endpoint(self) { request, _ in
            .init(id: UUID().uuidString, name: "Tiago")
        }
    }
}

extension PostRequest: PSNetworkVapor.Endpoint {
    public static func register(with routes: RoutesBuilder) {
        routes.endpoint(self) { request, body in
            .init(id: UUID().uuidString, name: body?.name ?? "No name")
        }
    }
}

public func configure(_ app: Application) async throws {
    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .all,
        allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin]
    )
    let cors = CORSMiddleware(configuration: corsConfiguration)
    app.middleware.use(cors, at: .beginning)
    GetRequest.register(with: app)
    PostRequest.register(with: app)
    app.get("") { _ in
        "Tiago"
    }
}
