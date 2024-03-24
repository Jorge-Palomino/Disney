//
//  CharacterHorizontalListCell.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI

struct CharacterHorizontalListCell: View {
    var character: DisneyCharacter
    var body: some View {
        VStack {
            DisneyCharacterRemoteImage(urlString:  character.imageURL ?? "")
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
            VStack(alignment: .center, spacing: 0){
                Text(character.name)
                    .font(.subheadline)
                    .lineLimit(1)
                    .fontWeight(.light)
            }
            .padding(.horizontal)
        }
        .frame(width: 100, height: 100)
                
    }
}

#Preview {
    CharacterHorizontalListCell(character: MockData.sampleCharacter)
}
