//  JwtTokenDTO.swift
//  Created by Muhammed Mahmood on 20/11/2022.

import Foundation

struct JwtTokenDTO: Codable {
    let accessToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
