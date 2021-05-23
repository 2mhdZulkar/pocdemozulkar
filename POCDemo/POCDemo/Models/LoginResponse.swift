//
//  LoginResponse.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

struct LoginResponse : Decodable {
    let errorMessage: String?
    let user: User?
}
