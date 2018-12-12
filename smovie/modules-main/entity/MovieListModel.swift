//
//  MovieListModel.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieListModel: NSObject{
    var items : NSArray? = nil;
    required init(_items: NSMutableArray) {
        self.items = _items
    }
}
