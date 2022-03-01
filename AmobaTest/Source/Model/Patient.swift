//
//  Person.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 01/03/2022.
//

import Foundation

struct Patient: Decodable {
    let id: Int
    let fullname: String
    let phone: String
    let mobile: String
    let email: String
    let birthday: String
    let sex: String
    let image: URL
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullname = "people_first_name"
        case phone = "people_phone"
        case mobile = "people_mobile"
        case email = "email"
        case birthday = "people_birthday"
        case sex = "people_sex"
        case image = "ima_profile_person"
        case address = "people_address"
    }
}
