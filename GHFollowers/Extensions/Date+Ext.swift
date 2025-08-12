//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Daniel Ruiz on 8/11/25.
//

import Foundation


extension Date {
    
    func convertToMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
