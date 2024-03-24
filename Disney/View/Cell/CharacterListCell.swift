//
//  CharacterListCell.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI

struct CharacterListCell: View {
    var character: DisneyCharacter
    
    var body: some View {
        HStack (spacing: 6){
            
            DisneyCharacterRemoteImage(urlString: character.imageURL ?? "")
                    .frame(width: 100, height: 90)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                
    
            VStack(alignment: .leading, spacing: 5){
                Text(character.name)
                    .font(.title3)
                Text(character.films.joined(separator: ", "))
                    .font(.body)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
                
    }
        
}

#Preview {
    CharacterListCell(character: MockData.sampleCharacter)
}
