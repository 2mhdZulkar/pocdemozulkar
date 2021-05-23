//
//  Constants.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

struct SegueIdentifier {
    static let navigateToUserDashboard = "navigateToUserDashboard"
}

struct Environment  {
    static let DevelopmentEnvironment = true
}
struct Endpoint
{
    static let BaseUrl = "https://poc.net/api/User/"
    static let login = "\(BaseUrl)login"
}
