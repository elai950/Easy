//
//  ContentView.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI
import AlertToast

struct ContentView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel: MoviesViewModel = MoviesViewModel()
    
    @State private var showFavorites = false
    
    var body: some View {
        NavigationStack {
            
            filters
            
            MoviesList(movies: viewModel.movies, onSelectMovieTapped: { selectedMovie in
                viewModel.selectMovie(selectedMovie)
            }, onLoadNextPage: {
                viewModel.loadNextPage()
            })
                .animation(.spring, value: viewModel.currentCategory)
                .navigationTitle("Easy Movies")
                .edgesIgnoringSafeArea(.bottom)
                .toolbar {
                    favoriteButtonView
                }
                .navigationDestination(item: $viewModel.selectedMovie) { movie in
                    MovieDetailsView(movie: movie)
                }
                .sheet(isPresented: $showFavorites) {
                    FavoriteList(show: $showFavorites)
                        .environmentObject(dataController)
                }
        }
        .toast(isPresenting: $viewModel.isLoading) {
            AlertToast(displayMode: .alert, type: .loading)
        }
    }
    
    var favoriteButtonView: some View{
        Button {
            showFavorites.toggle()
        } label: {
            Image(systemName: "star.circle")
        }
    }
    
    var filters: some View{
        HStack {
            ForEach(MoviesCategory.allCases, id: \.self) { category in
                FilterButton(text: category.rawValue, isSelected: viewModel.currentCategory == category) {
                    viewModel.currentCategory = category
                }
            }
        }
        .padding(.top)
    }
}

