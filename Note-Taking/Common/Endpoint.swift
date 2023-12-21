//
//  ApiEndpoint.swift
//  CodeForces
//
//  Created by Yousuf on 9/30/23.
//

import Foundation
import SwiftUI

import Alamofire

protocol Endpoint {
    var httpMethod: HTTPMethod { get }
    var baseURLString: String { get }
    var path: String { get }
    var headers: [String: Any]? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    // a default extension that creates the full URL
    var url: String {
        return baseURLString + path
    }
}

enum EndpointCases: Endpoint {
    case getAllNotes
    case none

    var httpMethod: Alamofire.HTTPMethod {
        switch self {
        case .getAllNotes:
            return .get
        default:
            return .get
        }
    }

    var baseURLString: String {
        switch self {
        default:
            return "https://gorest.co.in/public/v2"
        }
    }

    var path: String {
        switch self {
        case .getAllNotes:
            return "/users/41/todos"

        default:
            return ""
        }
    }

    var headers: [String: Any]? {
        switch self {
        case .getAllNotes:
            return [
                "Authorization": "Bearer 5b12feb3ddfac89a73dfe2e34b948bfdc7c5872c06079e95dbf877032a1321bc"
            ]

        default:
            return nil
        }
    }

    var body: [String: Any]? {
        return nil
    }
}

enum Response<T: Codable> {
    case error(details: AFError)
    case success(data: T)
}
