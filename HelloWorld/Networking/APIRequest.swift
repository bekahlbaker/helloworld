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
 Make request to specified endpoint and returns data to be decoded by that model
 */

class APIRequest {
    
    // Request Collection, Request Object, Post, Delete, etc?
    
    static func makeRequestTo(endpoint: APIEndpoint, withCompletion completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: endpoint.fullURL) else { return }
        let configuration = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            guard let dataResponse = data else {
                completion(nil, error)
                return
            }

            completion(dataResponse, nil)

        })
        task.resume()
    }
}
