//
//  APIViewModel.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import Moya

// Esta clase se utiliza para realizar los request involucrados al User logeado
class APIViewModel: APIRequestable {
        
    let authPlugin = AccessTokenPlugin(tokenClosure: { _ in
        let keychainHelper = KeychainHelper()
        return keychainHelper.get(.token) ?? ""
    })
    
    typealias Service = APIService
    lazy var provider: MoyaProvider<Service> = MoyaProvider<Service>(plugins: [authPlugin])
    
    func requestWithNoData(_ service: Service, _ callback: @escaping (Error?) -> Void) {
        request(target: service, callback: callback)
    }
    
    func auth(_ service: Service, _ callback: @escaping (Result<AuthResponse, Error>) -> Void) {
        request(target: service, model: AuthResponse.self,  callback: callback)
    }
    
    func getAllPatients(_ service: Service, _ callback: @escaping (Result<[PatientResponse], Error>) -> Void) {
        request(target: service, model: [PatientResponse].self,  callback: callback)
    }
}


