//
//  MovieRouter.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import Foundation
import UIKit

class MovieRouter: PresenterToRouterProtocol{
    class func createModule() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = MoviePresenter()
        let interactor: PresentorToInterectorProtocol = MovieInterector();
        let router: PresenterToRouterProtocol = MovieRouter();
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view!
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func goToDetail(id: String,vc: UINavigationController){
        let movieDetail = MovieDetailRouter.createModule()
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        UserDefaults.standard.set(id, forKey: "id_movie")
        vc.pushViewController(movieDetail,animated: true)

        //vc.present(movieDetail, animated: true, completion: nil)
    }
}
