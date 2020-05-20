//
//  Movie.swift
//  Movie app
//
//  Created by Abdalah Omar on 5/18/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import Foundation
struct Movie : Codable {
    
    let page : Int?
    let results : [MovieResults]
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
