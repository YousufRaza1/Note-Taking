////
////  ApiEndpoint.swift
////  CodeForces
////
////  Created by Yousuf on 9/30/23.
////
//
//import Foundation
//import SwiftUI
//
//import Alamofire
//
//protocol Endpoint {
//    var httpMethod: HTTPMethod { get }
//    var baseURLString: String { get }
//    var path: String { get }
//    var headers: [String: Any]? { get }
//    var body: [String: Any]? { get }
//}
//
//extension Endpoint {
//    // a default extension that creates the full URL
//    var url: String {
//        return baseURLString + path
//    }
//}
//
//enum EndpointCases: Endpoint {
//    case getAllProduct
//    case deleteAnItem(id: Int)
//    case addNewItem
//    case updateItem(id: Int)
//    case none
//
//    var httpMethod: Alamofire.HTTPMethod {
//        switch self {
//        case .getAllProduct:
//            return .get
//        case .deleteAnItem:
//            return .delete
//        case .addNewItem:
//            return .post
//        case .updateItem:
//            return .put
//        default:
//            return .get
//        }
//    }
//
//    var baseURLString: String {
//        switch self {
//        default:
//            return "https://fakestoreapi.com"
//        }
//    }
//
//    var path: String {
//        switch self {
//        case .getAllProduct:
//            return "/products"
//        case let .deleteAnItem(id):
//            return "/products/\(id)"
//        case .addNewItem:
//            return "/products"
//        case let .updateItem(id):
//            return "/products/\(id)"
//        default:
//            return ""
//        }
//    }
//
//    var headers: [String: Any]? {
//        return nil
//    }
//
//    var body: [String: Any]? {
//        return nil
//    }
//}
//
//enum Response<T: Codable> {
//    case error(details: AFError)
//    case success(data: T)
//}
