//
//  DisneyApp.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI
import SwiftData

@main
struct DisneyApp: App {
    
    let container: ModelContainer = {
        let schema = Schema([PersistentCharacter.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            CharacterListView()
        }
        .modelContainer(container)
    }
}
