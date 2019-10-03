//
//  MoviesResponse.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation

// MARK: - MoviesResponse
class MoviesResponse: Codable {
    let page: Int?
    let totalResults: Int?
    let totalPages: Int?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }

    init(page: Int?, totalResults: Int?, totalPages: Int?, results: [Result]?) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
}
