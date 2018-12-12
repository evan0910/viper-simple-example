//
//  MovieProtocols.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToViewController: class {
    func setupData(data: NSMutableArray,type: Int)
    func showErrorMessage()
}

protocol InterectorToPresenterProtocol: class {
    func successGetMovieList(movieListModel: NSMutableArray,type: Int)
    func failedGetMovieList()
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set} ;
    func getDataMovie(keyword: String? ,page: Int)
}

protocol ViewToPresenterProtocol: class{
    var view: PresenterToViewController? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var router: PresenterToRouterProtocol? {get set}
    func updateView(keyword: String? ,page: Int)
    func showMovieDetail(id: String,vc: UINavigationController)
}

protocol PresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func goToDetail(id: String,vc: UINavigationController)
}
