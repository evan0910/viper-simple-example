//
//  MovieDetailPresenter.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation

class MovieDetailPresenter: DetailViewToPresenterProtocol{
    var view: DetailPresenterToViewController?
    var interector: DetailPresentorToInterectorProtocol?
    var router: DetailPresenterToRouterProtocol?
    
    func updateView(id: String) {
        interector?.getDetailMovie(id: id)
    }
    
}

extension MovieDetailPresenter: DetailInterectorToPresenterProtocol{
    func successGetMovieDetail(movieListModel: MovieDetailModel) {
        view?.setupData(data: movieListModel)
    }
    
    func failedGetMovieList() {
        view?.showErrorMessage()
    }
}
