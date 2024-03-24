//
//  CharacterViewModel.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import Foundation

@MainActor class CharacterViewModel: ObservableObject {
    
    enum State: Comparable {
        case good
        case isLoading
        case loadedAll
        case error(String)
    }
    
    @Published var characters: [DisneyCharacter] = []
    @Published var isShowingDetail = false
    @Published var selectedCharacter: DisneyCharacter = MockData.sampleCharacter
    @Published var state: State = .good {
        didSet {
            print("state changed to: \(state)")
        }
    }
    var currentPage: Int = 1
    var totalPages: Int = 100
    
    init() {
        self.state = .good
        self.characters = []
    }
    
    func loadMore() async {
        await getCharacters()
    }
    
    func getCharacters() async {
        guard state == State.good else {
            return
        }
        
        state = .isLoading
        
        do {
            let charactersResponse = try await NetworkManager.shared.getCharacters(page: currentPage)
            // Sorted new data by number of films
            let sortedCharacters = charactersResponse.data.sorted(by: { $0.films.count > $1.films.count })
            characters.append(contentsOf:  sortedCharacters)
            self.totalPages = charactersResponse.info.totalPages
            self.currentPage += 1
            self.state = (self.currentPage < self.totalPages) ? .good : .loadedAll
            self.state = .good
        }catch {
            self.state = .error("Could not load: \(error.localizedDescription)")
        }
    }
}
