//
//  Result.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation

// MARK: - Result
class Result: Codable {
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let posterPath: String?
    let id: Int?
    let adult: Bool?
    let backdropPath: String?
    let originalLanguage: OriginalLanguage?
    let originalTitle: String?
    let genreids: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id
        case adult
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreids = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }

    init(popularity: Double?, voteCount: Int?, video: Bool?, posterPath: String?, id: Int?, adult: Bool?, backdropPath: String?, originalLanguage: OriginalLanguage?, originalTitle: String?, genreids: [Int]?, title: String?, voteAverage: Double?, overview: String?, releaseDate: String?) {
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.posterPath = posterPath
        self.id = id
        self.adult = adult
        self.backdropPath = backdropPath
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.genreids = genreids
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.releaseDate = releaseDate
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ru = "ru"
    case fr = "fr"
    case it = "it"
}
