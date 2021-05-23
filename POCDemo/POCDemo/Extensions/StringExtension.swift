//
//  StringExtension.swift
//  POCDemo
//
//  Created by iOS on 24/05/21.
//

import Foundation

extension String {
    
    /// EZSE: Trims white space and new line characters, returns a new string
    public func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
