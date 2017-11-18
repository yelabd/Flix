//
//  Movie.swift
//  Flix
//
//  Created by Youssef Elabd on 11/15/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie {
    let title: String
    let releaseDate: String
    let description: String
    let posterPath: URL
    
    
    init(json : JSON){
        self.title = json["title"].stringValue
        self.description = json["overview"].stringValue
        self.releaseDate = json["releaseData"].stringValue
        self.posterPath = URL(string: "https://image.tmdb.org/t/p/w500" + json["poster_path"].stringValue)!
        
    }
    
}