//
//  pexel.swift
//  Task of Image Api 1
//
//  Created by Naved Khan on 12/05/23.
//

import Foundation
struct ApiData : Decodable {
    let page : Int
    let perPage : Int
    let photos : [Photo]
    enum CodingKeys : String , CodingKey
    {
        case page
        case photos
        case perPage = "per_page"
        
    }
}

struct Photo : Decodable {
    let src : innerSrc
}

struct innerSrc : Decodable {
    let large : String
    let original : String
    let large2x : String
}
