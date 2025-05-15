//
//  ExtString.swift
//  Easy
//
//  Created by Elai Zuberman on 15/05/2025.
//

import Foundation

extension String{
    
    func formatToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Adjust the format as needed
        dateFormatter.timeZone = TimeZone.current
        
        return dateFormatter.date(from: self) ?? Date() // Return current date if conversion fails
    }
}
