//
//  APIRequestable.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import Foundation
import Moya
import Alamofire
import UIKit

protocol APIRequestable: AnyObject {
    associatedtype Service: TargetType
    var provider: MoyaProvider<Service> { get }
}

extension APIRequestable {
    
    var isReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    /// Endpoints without data on success
    func request(target: Service,
                 progress: ProgressBlock? = .none,
                 callback: @escaping (Error?) -> Void)  {
        
        guard isReachable else {
            // remover gif/ si es que vas a tener /// ES CUANDO NO TIENES INTERNET SABE
            callback(AMError.noConnection)
            return
        }
        
        self.provider.request(target, progress: progress) { [weak self] (result) in
            switch result {
            case let .success(response):
                // remover gif/algo de cargando mientras haces request cuando da exitoso
                response.printPlainRequest()
                response.printPlainResponse()
                callback(nil)
            case let .failure(error):
                // remover gif/algo de cargando mientras haces request cuando da error
                error.response?.printPlainRequest()
                error.response?.printPlainResponse()
                let error = error.extractErrorIfNeeded
                callback(error)
            }
        }
    }
    /// Endpoints with data on success
    func request<T : Decodable>(target: Service,
                                model: T.Type,
                                progress: ProgressBlock? = .none,
                                callback: @escaping (Swift.Result<T, Error>) -> Void)  {
        
        guard isReachable else {
            // remover gif/ si es que vas a tener /// ES CUANDO NO TIENES INTERNET SAB
            callback(.failure(AMError.noConnection))
            return
        }
        
        self.provider.request(target, progress: progress) { (result) in
            switch result {
            case let .success(response):
                do {
                    // remover gif/algo de cargando mientras haces request cuando da exitoso
                    response.printPlainRequest()
                    response.printPlainResponse()
                    
                    let decoder = JSONDecoder()
                    let decodedModel = try decoder.decode(model.self, from: response.data)
                    callback(.success(decodedModel))
                } catch {
                    print(error)
                    // TODO: debe removerse el error de decoding y usar 'BError.custom(nil)'
                    callback(.failure(error))
                }
            case let .failure(error):
                // remover gif/algo de cargando mientras haces request cuando da error
                error.response?.printPlainRequest()
                error.response?.printPlainResponse()
                let extractError = error.extractErrorIfNeeded
                callback(.failure(extractError))
            }
        }
    }
    
}

extension MoyaError {

    var extractErrorIfNeeded: Error {
        return response?.innerError ?? self
    }

}

typealias JSONString = [String:String]

extension Response {

    // TODO: implement this is theres an standard error
    var innerError: Error? {
        let errorResponse: ErrorResponse?
        let decoder = JSONDecoder()
        do {
            errorResponse = try decoder.decode(ErrorResponse.self, from: data)
        } catch {
            print(error)
            return AMError.custom(nil)
        }
        
//        guard let errorResponse = try? decoder.decode(ErrorResponse.self, from: data)
//        else { return PError.custom() }

        return errorResponse
    }

    func printPlainResponse() {
        guard let plainResponse = String(data: data, encoding: .utf8) else { return }
        print("⬅ \(plainResponse) \n")
    }
    
    func printPlainRequest() {
//        print("➡ \(request?.url?.absoluteString ?? "")")
        
        guard let requestData = request?.httpBody,
              let requestString = String(data: requestData, encoding: .utf8)
        else { return }
        
        print("➡ \(requestString)")
    }

}
