//
//  CharacterDetailCardView.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI
import SwiftData

struct CharacterDetailCardView: View {
    @Environment(\.modelContext) var context
    @Binding var isShowingDetail:Bool
    @Query() var favourites: [PersistentCharacter] = []
    var isFavourite:Bool
    
    let character: DisneyCharacter
    var body: some View {
        VStack {
            DisneyCharacterRemoteImage(urlString: character.imageURL ?? "")
                .aspectRatio(contentMode: .fill)
                .frame(width: 320, height:320)
                .padding(.bottom, 10)

            
            Text(character.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(character.films.joined(separator: ", "))
                .multilineTextAlignment(.center)
                .font(.body)
                .lineLimit(2)
                .padding()
            
            Button {
                let persistentCharacter = character.toPersistentCharacter()
                if !isFavourite {
                    context.insert(persistentCharacter)
                }else {
                    for fav in favourites {
                        if fav.id == character.id {
                            context.delete(fav)
                        }
                    }
                }
                try! context.save()
                isShowingDetail = false
            } label: {
                if !isFavourite {
                    Text("⭐️ Add to favourites")
                        .font(.title3)
                        .foregroundStyle(Color(.white))
                        .frame(width: 260, height:40)
                }else {
                    Text("🗑️ Remove from favourites")
                        .font(.title3)
                        .foregroundStyle(Color(.white))
                        .frame(width: 260, height:40)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(!isFavourite ? Color.brandPrimary : Color.red)
            .padding(.bottom, 10)
            
        }
        .frame(width: 320, height:525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button{
            isShowingDetail = false
        } label: {
            CloseButtonView()
        }, alignment: .topTrailing)
    }
}

#Preview {
    CharacterDetailCardView(isShowingDetail: .constant(true), isFavourite: false, character: MockData.sampleCharacter)
}

struct CloseButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}
