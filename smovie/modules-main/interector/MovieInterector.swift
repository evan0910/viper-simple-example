//
//  MovieInterector.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieInterector: PresentorToInterectorProtocol{
    var presenter: InterectorToPresenterProtocol?
    
    func getDataMovie(keyword: String? ,page: Int) {
        var key = "batman"
        if keyword != nil{ key = keyword! }
        let urlRequest = Constants.URL + Constants.SEARCH_FILTER + key +  Constants.PAGE_FILTER + String(page)
        Alamofire.request(urlRequest).responseJSON { response in
            if response.result.isSuccess{
                let resJson = JSON(response.result.value!)
                let searchResult = resJson["Search"]
                let movieList = NSMutableArray()
                for (_,subJson):(String, JSON) in searchResult {
                    let model = MovieModel(JsonDashBoard: subJson)
                    movieList.add(model)
                }
                //let movieListModel = MovieListModel(_items: movieList)
                let type = keyword != nil ? 1 : 0
                self.presenter?.successGetMovieList(movieListModel: movieList,type: type)
            }else{
                self.presenter?.failedGetMovieList()
            }
        }
    }
}
