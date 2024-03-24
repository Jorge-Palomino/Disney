//
//  DisneyTests.swift
//  DisneyTests
//
//  Created by Jorge Palomino on 23/03/2024.
//

import XCTest
@testable import Disney
import SwiftData

@MainActor
final class DisneyTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testAppStartsEmpty() throws {
        let sut = CharacterListView()

        XCTAssertEqual(sut.favourites.count, 0, "There should be 0 favourites when the app is first launched.")
    }
    
    func testToPersistentCharacter() {
        let disneyCharacter = MockData.sampleCharacter
        let persistentCharacter = disneyCharacter.toPersistentCharacter()
        
        XCTAssertEqual(persistentCharacter.id, disneyCharacter.id, "ID should match")
        XCTAssertEqual(persistentCharacter.name, disneyCharacter.name, "Name should match")
        XCTAssertEqual(persistentCharacter.films, disneyCharacter.films, "Films should match")
        XCTAssertEqual(persistentCharacter.imageURL, disneyCharacter.imageURL, "Image URL should match")
        XCTAssertEqual(persistentCharacter.url, disneyCharacter.url, "URL should match")
    }
    
    func testDisneyCharacterDecoding() {
        let json = """
        {
            "_id": 1,
            "films": ["Hercules (film)"],
            "shortFilms": [],
            "tvShows": ["Hercules (TV series)"],
            "videoGames": ["Kingdom Hearts III"],
            "parkAttractions": [],
            "allies": [],
            "enemies": [],
            "sourceUrl": "https://disney.fandom.com/wiki/Achilles_(Hercules)",
            "name": "Achilles",
            "imageUrl": "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png",
            "createdAt": "2021-04-12T01:31:30.547Z",
            "updatedAt": "2021-12-20T20:39:18.033Z",
            "url": "https://api.disneyapi.dev/characters/112",
            "__v": 0
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        do {
            let character = try decoder.decode(DisneyCharacter.self, from: json)
            XCTAssertEqual(character.id, 1)
            XCTAssertEqual(character.sourceURL, "https://disney.fandom.com/wiki/Achilles_(Hercules)")
            XCTAssertEqual(character.name, "Achilles")
            XCTAssertEqual(character.imageURL, "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png")
            // Add more assertions here for other fields
        } catch {
            XCTFail("Decoding failed: \(error)")
        }
    }
    
    func testDisneyCharacterInitialization() {
        let character = MockData.sampleCharacter
        XCTAssertEqual(character.id, 1)
        XCTAssertEqual(character.films, ["Hercules (film)"])
    }
    
}
