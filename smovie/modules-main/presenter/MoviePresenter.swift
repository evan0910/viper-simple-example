//
//  MoviePresenter.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import UIKit

class MoviePresenter: ViewToPresenterProtocol{
    
    
    var view: PresenterToViewController?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView(keyword: String? ,page: Int) {
        interector?.getDataMovie(keyword: keyword ,page: page)
    }    
    
    func showMovieDetail(id: String,vc: UINavigationController) {
        router?.goToDetail(id: id, vc: vc)
    }
    
}

extension MoviePresenter: InterectorToPresenterProtocol{
    func successGetMovieList(movieListModel: NSMutableArray,type: Int) {
        view?.setupData(data: movieListModel,type: type)
    }
    
    func failedGetMovieList() {
        view?.showErrorMessage()
    }
}
