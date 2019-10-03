//
//  Constants.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation

enum APIPath {
    static let baseUrl = "https://api.themoviedb.org/3"
    static let baseUrlImage = "https://image.tmdb.org/t/p/w500"
    static let discover = APIPath.baseUrl + "/discover"
    static let discoverMovie = APIPath.discover + "/movie" + "?api_key=" + Keys.apiKey + APIParams.sortByPopularity + APIParams.page
}

enum APIParams {
    static let sortByPopularity = "&sort_by=popularity.desc"
    static let page = "&page=1"
}

enum Keys {
    static let apiKey = "72e58ed9123ba68d1f814768448360c0"
}
