//
//  UserCellViewParam+Util.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import Foundation

extension UserCellViewParam: Equatable {
    public static func == (lhs: UserCellViewParam, rhs: UserCellViewParam) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email &&
            lhs.avatar == rhs.avatar &&
            lhs.statusColor === rhs.statusColor
    }
}
