
//  NetworkCall.swift
//  HttpMethodAndApiEndpoint
//
//  Created by Yousuf on 11/28/23.
//

import Alamofire
import Foundation

class Server {
    func request<T: Codable>(
        endPoint: EndpointCases,
        model: T.Type,
        paremeters: [String: Any]? = nil,
        completion: @escaping (Response<T>) -> ()
    ) {
        let url = endPoint.url
        let header = endPoint.headers
        let body = endPoint.body
        let method = endPoint.httpMethod

        AF.request(
            url,
            method: method,
            parameters: paremeters,
            headers: nil
        )
        .validate(statusCode: 200 ..< 500)
        .responseDecodable(of: model) { response in
            switch response.result {
            case .success(let data):
                print("Success")
                completion(.success(data: data))
            case .failure(let error):
                print("Fail")
                completion(.error(details: error))
            }
        }
    }
}
