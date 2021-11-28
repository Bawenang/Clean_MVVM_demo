//
//  UserCellBackgroundMapper.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import UIKit
import Foundation

struct UserCellBackgroundMapper {
    private static let userCellBackground = [
        User.Status.active: UIColor(named: "userActiveBG"),
        User.Status.inactive: UIColor(named: "userInactiveBG")
    ]
    
    static func map(from status: User.Status) -> UIColor {
        guard let foundColor = userCellBackground[status],
              let bgColor = foundColor else {
            return .white
        }
        
        return bgColor
    }
}
