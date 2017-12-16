//
//  Movie.swift
//  Flix
//
//  Created by Youssef Elabd on 11/15/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie {
    let title: String
    let releaseDate: String
    let description: String
    let posterPath: URL
    let backDropPath: URL
    let posterPathString: String
    
    
    init(json : JSON){
        self.title = json["title"].stringValue
        self.description = json["overview"].stringValue
        self.releaseDate = json["release_date"].stringValue
        self.posterPath = URL(string: "https://image.tmdb.org/t/p/w500" + json["poster_path"].stringValue)!
        self.backDropPath = URL(string: "https://image.tmdb.org/t/p/w500" + json["backdrop_path"].stringValue)!
        self.posterPathString = "https://image.tmdb.org/t/p/w500" + json["poster_path"].stringValue
        
        
        
    }
    
    init(dictionary: [String: Any]) {
        self.title = dictionary["title"] as? String ?? "No title"
        self.description = dictionary["overview"] as! String
        self.releaseDate = dictionary["release_date"] as! String
        self.posterPath = URL(string: "https://image.tmdb.org/t/p/w500" + (dictionary["poster_path"] as! String))!
        self.backDropPath = URL(string: "https://image.tmdb.org/t/p/w500" + (dictionary["backdrop_path"] as! String))!
        self.posterPathString = "https://image.tmdb.org/t/p/w500" + (dictionary["poster_path"] as! String)
        
        // Set the rest of the properties
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
