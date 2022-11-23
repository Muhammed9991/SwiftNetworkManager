//  LoginApi.swift
//  Created by Muhammed Mahmood on 05/11/2022.

import Foundation

public enum LoginApi {
    case logIn
    
    public var path: String {
        switch self {
        case .logIn:
            return "/login"
        }
    }
}
