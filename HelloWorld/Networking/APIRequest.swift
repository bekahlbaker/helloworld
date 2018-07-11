//
//  APIRequest.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/10/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation
import UIKit

/*
 Make request to specified endpoint and returns model specified by that endpoint
 */

class APIRequest {
    
    // Request Collection, Request Object, Post, Delete, etc?
    
    static func makeRequestTo(endpoint: APIEndpoint, withCompletion completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: endpoint.fullURL) else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard let _ = data else {
                completion(nil, error)
                return
            }
            
            let json = """
        {
            "id": 1,
            "name": "Sam McCrackin",
            "imageUrl": "https://cdn.gratisography.com/photos/447H.jpg"
        }
        """.data(using: .utf8)!

            completion(json, nil)

        })
        task.resume()
    }
}
