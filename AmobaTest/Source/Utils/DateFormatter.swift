//
//  DateFormatter.swift
//  AmobaTest
//
//  Created by Pedro Valderrama on 02/03/2022.
//

import Foundation

extension Date {
    var toString: String {
        return Helper.dateFormatter.string(from: self)
    }
    
    var toAge: String {
        guard let myAge = Calendar.current.dateComponents([.month], from: self, to: Date()).month
        else {
            return toString
        }
        
        let years = myAge / 12
        let months = myAge % 12
        return """
            \(years) años
            \(months) meses
            """
    }
    
    static func fromString(_ dateString: String) -> Date {
        return Helper.dateFormatter.date(from: dateString) ?? Date()
    }
}

struct Helper {
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
 }
