//
//  APIRequest.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

/*
 Make request to specified endpoint and returns model specified by that endpoint
 */

class APIRequest {
    
    static func makeRequestTo(endpoint: APIEndpoint, withCompletion completion: @escaping (AnyObject?) -> Void) {
        guard let url = URL(string: endpoint.fullURL) else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            print("DATA ", data, "RESPONSE", response, "ERROR ", error)
            guard let data = data else {
                completion(nil)
                return
            }

            let result = endpoint.makeModel(data: data)
            completion(result)
        })
        task.resume()
    }
}
