//
//  CharacterListView.swift
//  Disney
//
//  Created by Jorge Palomino on 23/03/2024.
//

import SwiftUI
import SwiftData

struct CharacterListView: View {
    
    @Environment(\.modelContext) var context
    @StateObject private var viewModel = CharacterViewModel()
    @Query() var favourites: [PersistentCharacter] = []
    @State private var scrollId: Int?
    
    var body: some View {
        
        NavigationView {
            GeometryReader { g in
                VStack(alignment: .leading){
                        if !favourites.isEmpty {
                            Text("⭐️ Favourites")
                                .font(.headline)
                                .padding(.leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(favourites) { character in
                                        CharacterHorizontalListCell(character: character.toDisneyCharacter()).listRowSeparator(.hidden)
                                            .onTapGesture {
                                                viewModel.selectedCharacter = character.toDisneyCharacter()
                                                viewModel.isShowingDetail = true
                                            }
                                    }
                                }
                                .padding()
                            }
                            .frame(height: 130)
                        }
                        if !favourites.isEmpty {
                            Text("All characters")
                                .font(.headline)
                                .padding(.leading)
                                .padding(.top, 16)
                        }
                    ScrollView {
                        
                        LazyVStack(alignment: .leading) {
                            ForEach(viewModel.characters) { character in
                                CharacterListCell(character: character).listRowSeparator(.hidden)
                                    .onTapGesture {
                                        viewModel.selectedCharacter = character
                                        viewModel.isShowingDetail = true
                                    }
                            }
                            
                            switch viewModel.state {
                                case .good:
                                    Color.clear
                                        .onAppear {
                                            Task {
                                                await viewModel.loadMore()
                                            }
                                        }
                                case .isLoading:
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                        .frame(maxWidth: .infinity)
                                case .loadedAll:
                                    EmptyView()
                                case .error(let message):
                                    Text(message)
                                        .foregroundColor(.pink)
                            }
//                            if !viewModel.isLoading && viewModel.currentPage < viewModel.totalPages {
//                                LoadingView()
//                                    .task {
//                                        await viewModel.getCharacters()
//                                    }
//                            }
                            
                        }
                        .padding()
                    }
                    
                }
            }
            .navigationTitle("👑 Disney characters")
            .disabled(viewModel.isShowingDetail)
            
            
            .listStyle(.plain)
        }
        .task {
            await viewModel.getCharacters()
        }
        .blur(radius: viewModel.isShowingDetail ? 20 : 0)
        
        if viewModel.isShowingDetail {
            CharacterDetailCardView(isShowingDetail: $viewModel.isShowingDetail, isFavourite: favourites.filter({$0.id == viewModel.selectedCharacter.id }).first != nil, character: viewModel.selectedCharacter)
                .offset(x:0, y:-150)
        }
        
        
//        if viewModel.isLoading {
//            LoadingView()
//        }
        
    }
}

#Preview {
    CharacterListView()
}
