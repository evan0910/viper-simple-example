//
//  MovieDetailModel.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieDetailModel: NSObject{
    var title : String!
    var year : String?
    var rated : String?
    var released : String?
    var runtime : String?
    var genre : String?
    var director : String?
    var writer : String?
    var actors : String?
    var plot : String?
    var language : String?
    var country : String?
    var awards : String?
    var poster : String?
    var imdbRating : String?
    var imdbVotes : String?
    
    required init(JsonDashBoard: JSON) {
        title       = JsonDashBoard["Title"].stringValue
        year        = JsonDashBoard["Year"].stringValue
        rated       = JsonDashBoard["Rated"].stringValue
        released    = JsonDashBoard["Released"].stringValue
        runtime     = JsonDashBoard["Runtime"].stringValue
        genre       = JsonDashBoard["Genre"].stringValue
        director    = JsonDashBoard["Director"].stringValue
        writer      = JsonDashBoard["Writer"].stringValue
        actors      = JsonDashBoard["Actors"].stringValue
        plot        = JsonDashBoard["Plot"].stringValue
        language    = JsonDashBoard["Language"].stringValue
        country     = JsonDashBoard["Country"].stringValue
        awards      = JsonDashBoard["Awards"].stringValue
        poster      = JsonDashBoard["Poster"].stringValue
        imdbRating  = JsonDashBoard["imdbRating"].stringValue
        imdbVotes   = JsonDashBoard["imdbVotes"].stringValue
    }
}
