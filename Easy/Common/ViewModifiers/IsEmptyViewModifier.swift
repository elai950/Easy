//
//  IsEmptyViewModifier.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation
import SwiftUICore

struct IsEmptyViewModifier: ViewModifier{
    
    var isEmpty: Bool
    
    func body(content: Content) -> some View {
        if isEmpty{
            EmptyView()
        }else{
            content
        }
    }
}

extension View{
    
    func isEmpty(_ value: Bool) -> some View{
        self.modifier(IsEmptyViewModifier(isEmpty: value))
    }
}
