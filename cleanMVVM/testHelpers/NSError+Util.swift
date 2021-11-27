//
//  NSError+Util.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Foundation

extension NSError {
    static func random() -> NSError {
        return NSError(domain: .random(length: 20), code: .random(in: 1...100), userInfo: nil)
    }
}
