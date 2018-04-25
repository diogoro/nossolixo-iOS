//
//  Place.swift
//  NossoLixo
//
//  Created by Diogo Ribeiro de Oliveira on 24/04/18.
//  Copyright © 2018 Diogo Ribeiro de Oliveira. All rights reserved.
//

import Foundation

class Place: Codable {
    var id: String = ""
    var name: String = ""
    var description: String = ""
    var street: String = ""
    var number: String = ""
    var district: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var site: String?
    var city: String = ""
    var state: String = ""
    var caregories: [Category] = []
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
        case phoneNumber = "phone_number"
        case id
        case name
        case description
        case street
        case number
        case district
        case email
        case site
        case city
        case state
        case caregories
    }
}
