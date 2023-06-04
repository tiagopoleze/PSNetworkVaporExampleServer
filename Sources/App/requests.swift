//
//  requests.swift
//  
//
//  Created by Tiago Ferreira on 04/06/2023.
//

import Vapor
import PSNetworkVapor
import PSNetworkVaporSharedLibrary

extension GetRequest: PSEndpoint {
    public static func register(with routes: Vapor.RoutesBuilder) {
        routes.endpoint(self) { request, _ in
            .init(id: UUID().uuidString, name: "Tiago")
        }
    }
}

extension PostRequest: PSEndpoint {
    public static func register(with routes: RoutesBuilder) {
        routes.endpoint(self) { request, body in
            .init(id: UUID().uuidString, name: body?.name ?? "No name")
        }
    }
}
