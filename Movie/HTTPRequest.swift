//
//  HTTPRequest.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import Foundation
import Alamofire

class HTTPRequest {
    
    static let shared = HTTPRequest()
    
    func getImage(from url: String, _ completion: @escaping((Data) -> Void), _ error: @escaping((String) -> Void)) {
        if let url = URL(string: APIPath.baseUrlImage + url) {
            Alamofire.request(url, method: .get).responseData { response in
                if response.result.isSuccess, let data = response.data {
                    completion(data)
                } else {
                    error(response.error.debugDescription)
                }
            }
        }
    }
    
    func getListOfMovies(_ completion: @escaping((MoviesResponse) -> Void), _ error: @escaping((String) -> Void)) {
        if let url = URL(string: APIPath.discoverMovie) {
            Alamofire.request(url).responseData { response in
                if response.result.isSuccess, let data = response.data {
                    if let response = try? JSONDecoder().decode(MoviesResponse.self, from: data) {
                        completion(response)
                    } else {
                        error(response.error.debugDescription + ", enable to decode JSON to MoviesResponse")
                    }
                } else {
                    error(response.error.debugDescription)
                }
            }
        }
    }
}
