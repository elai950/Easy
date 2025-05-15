//
//  FilterButton.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import SwiftUI

struct FilterButton: View {
    
    let text: String
    var isSelected: Bool
    
    var onTap: () -> Void
    
    var body: some View {
        Button(text) {
            withAnimation(.easeInOut(duration: 0.3)) {
                onTap()
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 6)
        .padding(.vertical, 8)
        .background(isSelected ? Color.blue : Color.gray)
        .clipShape(Capsule())
    }
}
