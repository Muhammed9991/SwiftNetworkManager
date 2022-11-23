//  ServerError.swift
//  Created by Muhammed Mahmood on 20/11/2022.


import Foundation

public enum ServerError: Error {
    case notFound
    case generic
    case invalidAuthToken
    case missingToken
}
