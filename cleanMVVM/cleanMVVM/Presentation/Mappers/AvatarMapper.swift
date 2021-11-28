//
//  AvatarMapper.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import UIKit

struct AvatarMapper {
    private static let avatarImages = [
        User.Gender.male: UIImage.init(named: "maleAvatar"),
        User.Gender.female: UIImage.init(named: "femaleAvatar")
    ]
    
    static func map(from gender: User.Gender?) -> UIImage? {
        guard let gender = gender,
              let image = avatarImages[gender] else { return nil }
        return image
    }
}
