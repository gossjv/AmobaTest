//
//  APIRequestable.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import Moya
import Alamofire
import UIKit

protocol APIRequestable: AnyObject {
    associatedtype Service: TargetType
    var provider: MoyaProvider<Service> { get }
}

extension APIRequestable {
    // verifique network colection
    var isReachable: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func request<T : Decodable>(target: Service,
                                model: T.Type,
                                progress: ProgressBlock? = .none,
                                callback: @escaping (Swift.Result<T, Error>) -> Void)  {
        
        guard isReachable else {
            // remover gif/ si es que vas a tener
            callback(.failure(AMError.noConnection))
            return
        }
        
        self.provider.request(target, progress: progress) { (result) in
            switch result {
            case let .success(response):
                do {
                    // remover gif/algo de cargando mientras haces request cuando da exitoso

                    let decoder = JSONDecoder()
                    let decodedModel = try decoder.decode(model.self, from: response.data)
                    callback(.success(decodedModel))
                } catch {
                    print(error)
                    callback(.failure(error))
                }
            case let .failure(error):
                // remover gif/algo de cargando mientras haces request cuando da error
                callback(.failure(error))
            }
        }
    }
}
