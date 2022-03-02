//
//  Person.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 01/03/2022.
//

import Foundation

struct Patient: Decodable {
    let id: Int
    let peopleDocument: String
    let fullname: String
    let phone: String
    let mobile: String
    let email: String
    let birthday: Date
    let sex: String
    let image: URL
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case peopleDocument = "people_document"
        case fullname = "people_first_name"
        case phone = "people_phone"
        case mobile = "people_mobile"
        case email = "email"
        case birthday = "people_birthday"
        case sex = "people_sex"
        case image = "ima_profile_person"
        case address = "people_address"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        peopleDocument = try container.decode(String.self, forKey: .peopleDocument)
        fullname = try container.decode(String.self, forKey: .fullname)
        phone = try container.decode(String.self, forKey: .phone)
        mobile = try container.decode(String.self, forKey: .mobile)
        email = try container.decode(String.self, forKey: .email)
        let birthdayString = try container.decode(String.self, forKey: .birthday)
        birthday = Date.fromString(birthdayString)
        sex = try container.decode(String.self, forKey: .sex)
        image = try container.decode(URL.self, forKey: .image)
        address = try container.decode(String.self, forKey: .address)
    }
    
}
