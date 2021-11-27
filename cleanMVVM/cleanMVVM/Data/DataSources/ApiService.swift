//
//  ApiService.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

class ApiService {
    func getAllUsers() -> Single<AllUsersResponseModel> {
        let headers = HTTPHeaders(
            [
                .init(name: "Accept", value: "application/json"),
                .init(name: "Content-Type", value: "application/json")
            ]
        )
        return RxAlamofire
            .data(
                .get,
                "https://gorest.co.in/public/v1/users",
                headers: headers
            )
            .map(decode(from:))
            .asSingle()
    }
    
}

private func decode(from data: Data) throws -> AllUsersResponseModel {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(AllUsersResponseModel.self, from: data)
}
