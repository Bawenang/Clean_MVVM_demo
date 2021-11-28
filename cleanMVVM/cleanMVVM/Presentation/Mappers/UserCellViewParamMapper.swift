//
//  UserCellViewParamMapper.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import Foundation

struct UserCellViewParamMapper {
    static func map(from user: User) -> UserCellViewParam {
        return UserCellViewParam(id: user.id,
                                 name: user.name,
                                 email: user.email,
                                 avatar: AvatarMapper.map(from: user.gender),
                                 statusColor: UserCellBackgroundMapper.map(from: user.status))
    }
}
