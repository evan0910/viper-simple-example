//
//  MovieDetailInterector.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieDetailInterector: DetailPresentorToInterectorProtocol{
    
    var presenter: DetailInterectorToPresenterProtocol?
    
    func getDetailMovie(id: String) {
        let urlRequest = Constants.URL + Constants.ID_FILTER + id
        Alamofire.request(urlRequest).responseJSON { response in
            if response.result.isSuccess{
                let resJson = JSON(response.result.value!)
                let model   = MovieDetailModel(JsonDashBoard: resJson)
                self.presenter?.successGetMovieDetail(movieListModel: model)
            }else{
                self.presenter?.failedGetMovieList()
            }
        }
    }
}
