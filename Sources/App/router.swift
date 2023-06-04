//
//  router.swift
//  
//
//  Created by Tiago Ferreira on 04/06/2023.
//

import Vapor
import PSNetworkVaporSharedLibrary

public func router(_ app: Application) async throws {

    app.get("") { _ in
        "Tiago"
    }

    GetRequest.register(with: app)
    PostRequest.register(with: app)
}
