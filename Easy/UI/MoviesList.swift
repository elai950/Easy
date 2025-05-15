//
//  MoviesList.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI

struct MoviesList: View {
        
    let movies: [MovieModel]
    
    @State private var isFinished = false
    
    var onSelectMovieTapped: (MovieModel) -> Void
    var onLoadNextPage: () -> Void
    
    var body: some View {
        List{
            
            ForEach(movies, id:\.self) { movie in
                Button(action: {
                    onSelectMovieTapped(movie)
                }, label: {
                    MovieCellView(movie: movie)
                })
                .listRowSeparator(.hidden)
            }
            
            if !isFinished {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.black)
                    .foregroundColor(.red)
                    .onAppear {
                        onLoadNextPage()
                    }
                    .isEmpty(movies.isEmpty)
            }
        }
        .listStyle(.plain)
        .animation(.spring(response: 0.5, dampingFraction: 0.7))
    }
}
