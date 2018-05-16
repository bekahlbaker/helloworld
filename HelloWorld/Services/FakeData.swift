//
//  FakeData.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/16/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class FakeData {
    static let people = [
        [
            "id": 1,
            "name": "Sam McCrackin",
            "imageUrl": "https://cdn.gratisography.com/photos/447H.jpg"
        ],
        [
            "id": 2,
            "name": "Sara Jones",
            "imageUrl": "https://cdn.gratisography.com/photos/424H.jpg"
        ],
        [
            "id": 3,
            "name": "Benjamin Buttons",
            "imageUrl": "https://cdn.gratisography.com/photos/196H.jpg"
        ],
        [
            "id": 4,
            "name": "An Ostrich",
            "imageUrl": "https://cdn.gratisography.com/photos/16H.jpg"
        ],
        [
            "id": 5,
            "name": "Jack A'Lackin",
            "imageUrl": "https://cdn.gratisography.com/photos/440H.jpg"
        ]
    ]
    
    static let conversation = [
        [
            "conversations": [
                [
                    "id": 1,
                    "users": [
                        [
                            "id": 1,
                            "name": "Sam McCrackin",
                            "imageUrl": "https://cdn.gratisography.com/photos/447H.jpg"
                        ],
                        [
                            "id": 2,
                            "name": "Sara Jones",
                            "imageUrl": "https://cdn.gratisography.com/photos/424H.jpg"
                        ],
                    ],
                    "messages": [
                        [
                            "id": 1,
                            "content": "It's absolutely yanny!",
                            "timestamp": Date() - 3000,
                            "userId": 1,
                            "conversationId": 1
                        ],
                        [
                            "id": 2,
                            "content": "No way! Laurel for sure",
                            "timestamp": Date() - 2000,
                            "userId": 2,
                            "conversationId": 1
                        ],
                        [
                            "id": 3,
                            "content": "You're insane.",
                            "timestamp": Date() - 1000,
                            "userId": 1,
                            "conversationId": 1
                        ],
                    ]
                ],
            ],
        ]
    ]
}
