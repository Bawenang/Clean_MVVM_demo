//
//  AvatarMapper.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import UIKit

let avatarImages = [
    "male": UIImage.init(named: "maleAvatar"),
    "female": UIImage.init(named: "femaleAvatar")
]

struct AvatarMapper {
    static func map(from gender: User.Gender?) -> UIImage? {
        guard let gender = gender else { return nil }
        switch gender {
        case .male: return avatarImages["male"]!
        case .female: return avatarImages["female"]!
        }
    }
}
