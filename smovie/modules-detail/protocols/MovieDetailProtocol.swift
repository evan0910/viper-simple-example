//
//  MovieProtocols.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import UIKit

protocol DetailPresenterToViewController: class {
    func setupData(data: MovieDetailModel)
    func showErrorMessage()
}

protocol DetailInterectorToPresenterProtocol: class {
    func successGetMovieDetail(movieListModel: MovieDetailModel)
    func failedGetMovieList()
}

protocol DetailPresentorToInterectorProtocol: class {
    var presenter: DetailInterectorToPresenterProtocol? {get set} ;
    func getDetailMovie(id: String)
}

protocol DetailViewToPresenterProtocol: class{
    var view: DetailPresenterToViewController? {get set};
    var interector: DetailPresentorToInterectorProtocol? {get set};
    var router: DetailPresenterToRouterProtocol? {get set}
    func updateView(id: String)
}

protocol DetailPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
