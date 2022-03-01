//
//  ErrorResponse.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import Foundation

struct ErrorResponse: Decodable, LocalizedError {
    
    let message: String
    let errors: [String: [String]]
    
    var errorDescription: String? {
        return errors.values.first?.first ?? message
    }
        
}

enum AMError: LocalizedError {
    
    case custom(String?)
    case noConnection
    
    var errorDescription: String? {
        switch self {
        case let .custom(message): return message ?? AMError.kGlobalError
        case .noConnection: return AMError.kNoConnection
        }
    }
    
}

extension AMError {
    static let kNoConnection = "Must be connected to the internet."
    static let kGlobalError = "An error has ocurred"
}
