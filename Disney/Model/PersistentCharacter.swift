//
//  PersistentCharacter.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import Foundation
import SwiftData

@Model
class PersistentCharacter {
    var id: Int
    var name: String
    var films: [String]
    let imageURL: String?
    var url: String
    
    init(id: Int, name: String, films: [String], imageURL: String?, url: String) {
        self.name = name
        self.id = id
        self.films = films
        self.imageURL = imageURL
        self.url = url
    }
    
    func toDisneyCharacter() -> DisneyCharacter {
        return DisneyCharacter(id: id, films: films, shortFilms: [], tvShows: [], videoGames: [], parkAttractions: [], allies: [], enemies: [], sourceURL: "", name: name, imageURL: imageURL, createdAt: "", updatedAt: "", url: url, v: 0)
    }
}
