//
//  LoginValidation.swift
//  POCDemo
//
//  Created by iOS on 23/05/21.
//

import Foundation

struct LoginValidation  {
    
    func validate(loginRequest: LoginRequest?) -> ValidationResult {
        
        
        if let userid = loginRequest?.userid, let password = loginRequest?.password {
            
            if (userid.trimmed().count > 0 && password.trimmed().count > 0) {
                return ValidationResult(success: true, errorMessage: nil)
            }
            else if (userid.trimmed().count == 0) {
                return ValidationResult(success: false, errorMessage: "Please enter userid")
            }
            else if (password.trimmed().count == 0) {
                return ValidationResult(success: false, errorMessage: "Please enter password")
            }
            else {
                return ValidationResult(success: false, errorMessage: "Please enter credential")
            }
        }
        else {
            return ValidationResult(success: false, errorMessage: "Please enter credential")
        }
    }
    
}
