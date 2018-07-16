//
//  FakeData.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 5/16/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import Foundation

class FakeData {
    
    static let userJSON = """
    {
          "name": {
            "first": "Bob",
            "last": "Vance"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/155x238.png/dddddd/000000",
            "medium": "http://dummyimage.com/488x476.png/cc0000/ffffff",
            "large": "http://dummyimage.com/862x842.png/5fa2dd/ffffff"
          },
          "id": "c075dc22-20c1-4843-a7af-0076594036a",
            "hasConversationsWith": [
                "c075dc22-20c1-4843-a7af-002c8cc2d26a",
                "a297a69d-05b8-4bde-9aff-5d5e83a3ef14",
                "8ea59073-7620-4bbd-b24b-d840c3e1d339"
            ]
        }
    """.data(using: .utf8)!

    static let conversationsJSON = """
    {
      "conversations": [
        {
          "id": "1adc7b8d-fbb8-41b1-9921-7cb8b6da716e",
          "users": [
            {
              "name": {
                "first": "Gill",
                "last": "Ault"
              },
              "picture": {
                "thumbnail": "http://dummyimage.com/155x238.png/dddddd/000000",
                "medium": "http://dummyimage.com/488x476.png/cc0000/ffffff",
                "large": "http://dummyimage.com/862x842.png/5fa2dd/ffffff"
              },
              "id": "c075dc22-20c1-4843-a7af-002c8cc2d26a",
                "hasConversationsWith": []
            },
            {
              "name": {
                "first": "Farand",
                "last": "Cullagh"
              },
              "picture": {
                "thumbnail": "http://dummyimage.com/237x153.png/cc0000/ffffff",
                "medium": "http://dummyimage.com/496x498.png/cc0000/ffffff",
                "large": "http://dummyimage.com/878x872.png/cc0000/ffffff"
              },
              "id": "53668580-f3e6-4e4f-89fa-88a19905b69a",
                "hasConversationsWith": []
            },
          ],
          "messages": [
            {
              "content": "Nullam",
              "id": "c075dc22-20c1-4843-a7af-0076594036a"
            },
            {
              "content": "Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.",
              "id": "4dea5c94-8ab5-449a-989d-06c8749e753c"
            },
            {
              "content": "Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.",
              "id": "494a4f00-4a49-4235-83c8-622b0a68490d"
            },
            {
              "content": "Morbi a ipsum. Integer a nibh.",
              "id": "c075dc22-20c1-4843-a7af-0076594036a"
            },
            {
              "content": "Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.",
              "id": "c075dc22-20c1-4843-a7af-0076594036a"
            },
            {
              "content": "Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.",
              "id": "494a4f00-4a49-4235-83c8-622b0a68490d"
            },
            {
              "content": "Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.",
              "id": "4dea5c94-8ab5-449a-989d-06c8749e753c"
            },
            {
              "content": "Nulla mollis molestie lorem. Quisque ut erat.",
              "id": "c075dc22-20c1-4843-a7af-0076594036a"
            },
            {
              "content": "Morbi sem mauris",
              "id": "494a4f00-4a49-4235-83c8-622b0a68490d"
            },
            {
              "content": "Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.",
              "id": "4dea5c94-8ab5-449a-989d-06c8749e753c"
            },
            {
              "content": "Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.",
              "id": "c075dc22-20c1-4843-a7af-0076594036a"
            },
            {
              "content": "Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.",
              "id": "494a4f00-4a49-4235-83c8-622b0a68490d"
            }
          ]
        }
      ]
    }
    """.data(using: .utf8)!
    
    static let usersListJSON = """
    {
      "users": [
        {
          "name": {
            "first": "Gill",
            "last": "Ault"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/155x238.png/dddddd/000000",
            "medium": "http://dummyimage.com/488x476.png/cc0000/ffffff",
            "large": "http://dummyimage.com/862x842.png/5fa2dd/ffffff"
          },
          "id": "c075dc22-20c1-4843-a7af-002c8cc2d26a",
            "hasConversationsWith": []
        },
        {
          "name": {
            "first": "Farand",
            "last": "Cullagh"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/237x153.png/cc0000/ffffff",
            "medium": "http://dummyimage.com/496x498.png/cc0000/ffffff",
            "large": "http://dummyimage.com/878x872.png/cc0000/ffffff"
          },
          "id": "53668580-f3e6-4e4f-89fa-88a19905b69a",
            "hasConversationsWith": []
        },
        {
          "name": {
            "first": "Hercules",
            "last": "Maes"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/128x185.png/5fa2dd/ffffff",
            "medium": "http://dummyimage.com/398x362.png/ff4444/ffffff",
            "large": "http://dummyimage.com/803x825.png/ff4444/ffffff"
          },
          "id": "ba0101bf-72fe-46d5-9420-70d626ef5584",
            "hasConversationsWith": []
        },
        {
          "name": {
            "first": "Chelsy",
            "last": "Brezlaw"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/157x155.png/5fa2dd/ffffff",
            "medium": "http://dummyimage.com/393x431.png/5fa2dd/ffffff",
            "large": "http://dummyimage.com/904x1000.png/ff4444/ffffff"
          },
          "id": "a297a69d-05b8-4bde-9aff-5d5e83a3ef14",
            "hasConversationsWith": []
        },
        {
          "name": {
            "first": "Cher",
            "last": "Ackenhead"
          },
          "picture": {
            "thumbnail": "http://dummyimage.com/114x211.png/dddddd/000000",
            "medium": "http://dummyimage.com/400x311.png/cc0000/ffffff",
            "large": "http://dummyimage.com/803x944.png/5fa2dd/ffffff"
          },
          "id": "8ea59073-7620-4bbd-b24b-d840c3e1d339",
            "hasConversationsWith": []
        }
      ]
    }
    """.data(using: .utf8)!
}
