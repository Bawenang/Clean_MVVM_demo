//
//  String+Util.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation

extension String {
    static func random(length: Int, withDigits: Bool = true) -> String {
        var letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        if withDigits { letters.append("0123456789") }
        return String((0..<length).map { _ in letters.randomElement()! })
    }
    
    static func randomURL(length: Int) -> String {
        return "https://www.\(String.random(length: length)).com/\(String.random(length: length))?value=\(String.random(length: length))"
    }
    
    static func randomEmailAddress(length: Int) -> String {
        return "\(String.random(length: length))@\(String.random(length: length)).com"
    }
}
