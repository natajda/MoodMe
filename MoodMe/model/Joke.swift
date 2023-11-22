//
//  Joke.swift
//  MoodMe
//
//  Created by Natália Pohanková on 04/02/2023.
//

//{
//    "error": false,
//    "category": "Programming",
//    "type": "single",
//    "joke": "Your mama's so FAT she can't save files bigger than 4GB.",
//    "flags": {
//        "nsfw": false,
//        "religious": false,
//        "political": false,
//        "racist": false,
//        "sexist": false,
//        "explicit": true
//    },
//    "id": 9,
//    "safe": false,
//    "lang": "en"
//}

import Foundation

struct Joke : Hashable, Decodable {
    let id: Int
    let error: Bool
    let type: String
    let category: String
    let joke: String
    let flags: [String: Bool]
    let safe: Bool
    let lang: String
    
    
    static let initJoke = Joke (id: 1,
                                error: false,
                                type: "single",
                                category: "Programming",
                                joke: "Your mama's so FAT she can't save files bigger than 4GB.",
                                flags: ["nsfw": false],
                                safe: true,
                                lang: "en")
}



