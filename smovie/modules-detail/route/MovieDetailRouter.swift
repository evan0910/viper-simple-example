//
//  MovieDetailRouter.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailRouter: DetailPresenterToRouterProtocol{
    class func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController
        let presenter: DetailViewToPresenterProtocol & DetailInterectorToPresenterProtocol = MovieDetailPresenter()
        let interactor: DetailPresentorToInterectorProtocol = MovieDetailInterector()
        let router: DetailPresenterToRouterProtocol = MovieDetailRouter()
        
        view?.presenter = presenter
        presenter.view  = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
