//
//  LoginViewModel.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

/// Protocol
protocol LoginFunctionProtocol {
    
    func login(userid: String?, password: String?)
}

protocol LoginResultProtocol {
    func success(user: User)
    func error(error: String)
}

class LoginViewModel: LoginFunctionProtocol {
    
    var user: User?
    var delegate: LoginResultProtocol?
    
    private let manager: LoginManager = LoginManager()
    
    func login(userid: String?, password: String?) {
        
        if let userid = userid, let password = password {
            let loginRequest = LoginRequest(userid: userid, password: password)
            
            let validationResult = LoginValidation().validate(loginRequest: loginRequest)
            if validationResult.success {
                
                /// login API call for user authentication
                manager.authenticateUser(request: loginRequest) { loginResponse in
                    if let user = loginResponse?.user {
                        self.user = user
                        self.delegate?.success(user: user)
                    }else {
                        self.delegate?.error(error: loginResponse?.errorMessage ?? "Failed to Login")
                    }
                } failure: { (error) in
                    self.delegate?.error(error: error.localizedDescription)
                }
            }else{
                delegate?.error(error: validationResult.errorMessage ?? "User validation failed" )
            }
        } else {
            delegate?.error(error: "Value is nil")
        }
    }
}
