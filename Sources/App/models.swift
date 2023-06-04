//
//  models.swift
//  
//
//  Created by Tiago Ferreira on 04/06/2023.
//

import Vapor
import PSNetwork
import PSNetworkVaporSharedLibrary

extension GetOutput: Content { }
extension EmptyBodyParameter: Content { }
extension EmptyResponseModel: Content { }

extension PostInput: Content { }
extension PostOutput: Content { }
