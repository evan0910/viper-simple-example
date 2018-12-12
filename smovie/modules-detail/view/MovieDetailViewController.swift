//
//  MovieDetailViewController.swift
//  smovie
//
//  Created by Evan on 29/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    var presenter: DetailViewToPresenterProtocol?
    var id: String?
    
    @IBOutlet weak var img_poster: UIImageView!
    @IBOutlet weak var lb_1: UILabel!
    @IBOutlet weak var lb_2: UILabel!
    @IBOutlet weak var lb_3: UILabel!
    @IBOutlet weak var lb_4: UILabel!
    @IBOutlet weak var lb_5: UILabel!
    @IBOutlet weak var lb_6: UITextField!
    @IBOutlet weak var lb_7: UILabel!
    @IBOutlet weak var lb_8: UILabel!
    @IBOutlet weak var lb_9: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id = UserDefaults.standard.string(forKey: "id_movie")
        presenter?.updateView(id: id!)
    }
//    @IBAction func doBack(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
}

extension MovieDetailViewController: DetailPresenterToViewController{
    func setupData(data: MovieDetailModel) {
        img_poster.kf.setImage(with: URL(string: data.poster!))
        lb_1.text = data.title!
        lb_2.text = data.genre!
        lb_3.text = data.plot!
        lb_4.text = data.writer!
        lb_5.text = data.director!
        lb_6.text = data.rated!
        lb_7.text = data.language!
        lb_8.text = data.country!
        lb_9.text = data.awards!

    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Error when downloading data !", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
