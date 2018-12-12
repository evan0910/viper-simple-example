//
//  MovieModel.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieModel: NSObject{
    var title : String!
    var year : String?
    var imdbID : String?
    var type : String?
    var poster : String?
    
    required init(JsonDashBoard: JSON) {
        title = JsonDashBoard["Title"].stringValue
        year = JsonDashBoard["Year"].stringValue
        imdbID = JsonDashBoard["imdbID"].stringValue
        type = JsonDashBoard["Type"].stringValue
        poster = JsonDashBoard["Poster"].stringValue
    }
}
