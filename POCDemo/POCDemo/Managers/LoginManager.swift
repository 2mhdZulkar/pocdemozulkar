//
//  LoginManager.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

struct LoginManager
{
    func authenticateUser(request: LoginRequest,
                          completionHandler:@escaping (_ result: LoginResponse?)->(),
                          failure failureBlock:@escaping ((Error) -> Void)) {
        
        var urlRequest = URLRequest(url: URL(string: Endpoint.login)!)
        urlRequest.httpMethod = "post"
        urlRequest.addValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.httpBody = try! JSONEncoder().encode(request)

        /// to call Mock API 
        if Environment.DevelopmentEnvironment {
            HttpUtility.shared.performMockDataTask(urlRequest: urlRequest, resultType: LoginResponse.self) { (result) in
                _ = completionHandler(result)
            } failure: { (error) in
                failureBlock(error)
            }
        }else {
            HttpUtility.shared.performDataTask(urlRequest: urlRequest, resultType: LoginResponse.self) { (result) in
                _ = completionHandler(result)
            } failure: { (error) in
                failureBlock(error)
            }
        }
        
    }
}
