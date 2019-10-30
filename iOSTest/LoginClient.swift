//
//  LoginClient.swift
//  iOSTest
//
//  Created by C4Q on 10/29/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

protocol LoginClientRetrievable {
    func login(with email: String, password: String, completion: @escaping (Result<[String], NetworkError>) -> Void)
}
class LoginClient: LoginClientRetrievable {
    
    func login(with email: String, password: String, completion: @escaping (Result<[String], NetworkError>) -> Void) {
        var request = URLRequest(url: EndpointBuilder.buildLoginEndpoint(with: email, password: password))
        request.encodeParameters(parameters: ["email": email, "password": password])
        
        get(request: request) { (result) in
            switch result {
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:String],
                        let code = json["code"],
                        let message = json["message"]
                    {
                        print(code)
                        print(message)
                        completion(.success([code, message]))
                    }
                } catch {
                    completion(.failure(NetworkError.decodingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func get(request: URLRequest, completion: @escaping (Result<(Data), NetworkError>) -> Void) {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Accept" : "application/json",
            "Content-Type" : "application/x-www-form-urlencoded"
        ]
        
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, _) in
            
            guard let data = data else {
                let error = (response as? HTTPURLResponse)?.apiError ?? .unknownError
                completion(.failure(error))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
