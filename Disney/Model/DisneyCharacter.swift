//
//  DisneyCharacter.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import Foundation

struct CharacterResponse: Decodable {
    let info: Info
    let data: [DisneyCharacter]
}
struct DisneyCharacter: Decodable, Identifiable {
    let id: Int
    let films: [String]
    let shortFilms: [String]
    let tvShows, videoGames, parkAttractions: [String]
    let allies, enemies: [String]
    let sourceURL: String
    let name: String
    let imageURL: String?
    let createdAt, updatedAt: String
    let url: String
    let v: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case films, shortFilms, tvShows, videoGames, parkAttractions, allies, enemies
        case sourceURL = "sourceUrl"
        case name
        case imageURL = "imageUrl"
        case createdAt, updatedAt, url
        case v = "__v"
    }
    
    func toPersistentCharacter() -> PersistentCharacter {
        return PersistentCharacter(id: id, name: name, films: films, imageURL: imageURL, url: url)
    }
}
struct Info: Codable {
    let count, totalPages: Int
    let previousPage: String?
    let nextPage: String
}
struct MockData {
    static let sampleCharacter = DisneyCharacter(id: 1, films: ["Hercules (film)"], shortFilms: [], tvShows: ["Hercules (TV series)"], videoGames: ["Kingdom Hearts III"], parkAttractions: [], allies: [], enemies: [], sourceURL: "https://disney.fandom.com/wiki/Achilles_(Hercules)", name: "Achilles", imageURL: "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png", createdAt: "2021-04-12T01:31:30.547Z", updatedAt: "2021-12-20T20:39:18.033Z", url: "https://api.disneyapi.dev/characters/112", v: 0)
}
