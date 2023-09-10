//
//  VideoImages.swift
//  Task of Image Api 1
//
//  Created by Naved Khan on 12/05/23.
//

import Foundation
struct  Video : Decodable {
    let videos : [Photos]
}
struct Photos: Decodable {
    let videoPictures : [Pictures]
    enum CodingKeys : String ,CodingKey {
        case videoPictures = "video_pictures"
    }
}
struct Pictures : Decodable {
    let picture : String
}
