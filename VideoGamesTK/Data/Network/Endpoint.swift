//
//  Endpoint.swift
//  VideoGamesTK
//
//  Created by Jose Miguel Serrato Moreno on 29/01/25.
//
import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum Endpoint {
    case games
    var url: URL {
        let baseURL = "https://www.freetogame.com/api"
        switch self {
        case .games:
            return URL(string: "\(baseURL)/games")!
        }
        
    }
    
    var method: HTTPMethod {
        return .get
    }
}
