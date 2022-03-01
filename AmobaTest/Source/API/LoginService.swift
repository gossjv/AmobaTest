//
//  LoginService.swift
//  AmobaTest
//
//  Created by Pedro Valderrama on 28/02/2022.
//
import Moya

struct AuthResponse: Decodable {
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
}

enum Language: String {
    case es, en
}

enum APIService {
    case auth(userName: String, password: String)
}

extension APIService: TargetType, AccessTokenAuthorizable {
//    {{apiUrl}}{{v1}}/patient/all
    
    var baseURL: URL {
        
        
        return URL(string: "http://test.amobamed.com/")
        
    }
    
    
    var path: String {
        switch self {
        case .auth: return "oauth/token"
        case
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .auth: return .post
        }
    }
    
    var sampleData: Data { return Data() }
    
    var task: Moya.Task {
        switch self {
        case let .auth(userName, password):
            let params: [String : Any] = [
                "grant_type": "password",
                "client_id": "2",
                "client_secret": "rDnLA1OfY8nHovztVBU8rcvOP9K5iH7LngUZNIzB",
                "username" : userName,
                "password" : password
            ]
            
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let json = "application/json"
        return ["Accept": json,
                "Content-Type" : json,
                "Accept-Language" : "en"]
    }
    
    var validationType: ValidationType { return
        .successAndRedirectCodes
    }
    
    var authorizationType: AuthorizationType? {
        switch self {
        default: return nil
        }
    }
}

