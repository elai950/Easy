//
//  FavoriteList.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI
import CoreData
import SDWebImageSwiftUI

struct FavoriteList: View {
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(sortDescriptors: []) var favoriteMovies: FetchedResults<FavoriteMovie>
    
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            List{
                if favoriteMovies.isEmpty{
                    Text("No Favorite Movies Yet 🧐")
                }else{
                    ForEach(favoriteMovies, id: \.id) { movie in
                        MovieCellView(movie: dataController.convertToModel(movie))
                            .listRowSeparator(.hidden)
                            .swipeActions(edge: .leading) {
                                Button(action: {
                                    dataController.unFavoriteMovie(movie)
                                }, label: {
                                    Image(systemName: "trash")
                                })
                                .tint(.red)
                            }.onTapGesture {
                                guard let trailer = movie.trailerUrlPath else {return}
                                Utils.openYoutube(trailer)
                            }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favorites List")
            .toolbar {
                Button(action: {
                    show = false
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        }
    }
}
