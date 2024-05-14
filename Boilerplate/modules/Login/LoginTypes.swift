//
//  LoginTypes.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 12/5/2024.
//

import Foundation

struct LoginRequest: Codable {
    var login: String
    var password: String
}

struct LoginResponse: Codable {
    var message: String
    var status: String
}
