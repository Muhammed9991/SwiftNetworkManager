//  PostApi.swift
//  Created by Muhammed Mahmood on 20/11/2022.

import Foundation

public enum PostApi {
    case getSinglePost(userID: Int)
    case createPost
    
    public var path: String {
        switch self {
        case .getSinglePost(userID: let userID):
            return "/posts/\(userID)"
        case .createPost:
            return "/posts"
            
        }
    }
}
