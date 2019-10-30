//
//  ChatClient.swift
//  iOSTest
//
//  Created by C4Q on 10/28/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation

protocol ChatClientRetrievable {
    func getChat(completion: @escaping (Result<[MessageModel], NetworkError>) -> Void)
}

class ChatClient: ChatClientRetrievable {
    
    func getChat(completion: @escaping (Result<[MessageModel], NetworkError>) -> Void) {
        let request = URLRequest(url: EndpointBuilder.buildChatEndpoint())
        getChatData(request: request, completion: completion)
    }
    
    private func getChatData(request: URLRequest,
                             completion: @escaping (Result<[MessageModel], NetworkError>) -> Void) {
        get(request: request) { (result) in
            switch result {
            case .success(let data):
                do {                
                    let messagesModel = try JSONDecoder().decode(MessagesModel.self, from: data)
                    completion(.success(messagesModel.data))
                } catch {
                    completion(.failure(NetworkError.decodingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func get(request: URLRequest, completion: @escaping (Result<(Data), NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, _) in
            
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
