//
//  MovieCellView.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCellView: View {
    
    let movie: MovieModel
    
    var body: some View {
            HStack(alignment: .top, spacing: 16) {
                WebImage(url: URL(string: EndpointRoutes.getImage(path: movie.posterPath).endpointAddress))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 150)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .isEmpty(movie.posterPath.isEmpty)

                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    
                    Text(movie.overview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(3)

                    HStack {
                        Text("⭐️ \(movie.voteAverage, specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(.yellow)
                        
                        Spacer()
                        
                        Text(movie.releaseDate.formatToDate(), style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 3)
        }
}
