//
//  MovieDetailsView.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI
import SDWebImageSwiftUI
import AlertToast

struct MovieDetailsView: View {
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(sortDescriptors: []) var favoriteMovies: FetchedResults<FavoriteMovie>
    
    @State private var showAlert = false
    
    var movie: MovieModel
    
    init(movie: MovieModel) {
        self.movie = movie
    }
    
    var isFavorite: Bool {
        favoriteMovies.contains(where: {$0.id == movie.id.description})
    }
    
    var postUrlPath: String{
        EndpointRoutes.getImage(path: movie.backdropPath).endpointAddress
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            header

            mainContent

            Spacer()
        }
        .toast(isPresenting: $showAlert, alert: {
            AlertToast(displayMode: .alert, type: .complete(.green), title: "\(movie.title) Favorited!")
        })
        .edgesIgnoringSafeArea(.top)
    }
    
    var header: some View{
        ZStack(alignment: .bottom) {
            WebImage(url: URL(string: postUrlPath))
                .resizable()
                .frame(height: 250)
                .overlay(
                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.7), .clear]),
                                   startPoint: .bottom, endPoint: .center)
                )

            HStack {
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text(movie.releaseDate.formatToDate(), style: .date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button(action: {
                    saveFavorite()
                }) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .foregroundColor(isFavorite ? .yellow : .white)
                        .font(.title)
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 32)
        }
    }
    
    @ViewBuilder
    var mainContent: some View {
        HStack {
            Text("⭐️ \(movie.voteAverage, specifier: "%.1f")")
                .font(.headline)
                .foregroundColor(.yellow)
            
            Text("\(movie.voteCount) votes")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.horizontal)
        
        Button(action: {
            Utils.openYoutube(movie.trailerKey)
        }) {
            HStack {
                Image(systemName: "play.circle.fill")
                    .font(.title)
                    .foregroundColor(.red)
                Text("Watch Trailer")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
        }
        .isEmpty(movie.trailerKey.isEmpty)

        Text(movie.overview)
            .font(.body)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
    }
    
    func saveFavorite(){
        showAlert = dataController.favoriteMovie(movie, posterUrlPath: postUrlPath)
    }
}
