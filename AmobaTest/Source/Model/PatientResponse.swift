//
//  PatientsResponse.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 01/03/2022.
//  Copyright © 2022 Jorge Vásquez. All rights reserved.
//

import Foundation

struct PatientResponse: Decodable {
    let doctorId: Int
    let companyId: Int
    let person: Patient
    
    enum CodingKeys: String, CodingKey {
        case doctorId = "doctor_id"
        case companyId = "company_id"
        case person
    }
}
