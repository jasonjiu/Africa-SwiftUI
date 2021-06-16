//
//  VideoModel.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 09/06/21.
//

import Foundation
struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //computed property
    var thumbnail: String{
        "video-\(id)"
    }
}
