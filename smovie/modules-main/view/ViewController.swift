//
//  ViewController.swift
//  smovie
//
//  Created by Evan on 28/11/18.
//  Copyright © 2018 Evan. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    var presenter: ViewToPresenterProtocol?
    @IBOutlet weak var textfield_search: UITextField!
    @IBOutlet weak var collection_movie: UICollectionView!
    var array_data          = NSMutableArray()
    var modelList: MovieListModel?
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView(keyword: nil,page: page)
        collection_movie.delegate   = self
        collection_movie.dataSource = self
        collection_movie.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        layoutCells()
        textfield_search.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField.text!.count > 5{
            presenter?.updateView(keyword: String(textField.text!),page: page)
        }
    }
    
    func layoutCells() {
        if let layout = collection_movie?.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 8
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            let size = CGSize(width:(collection_movie!.bounds.width)/2, height: 300)
            layout.itemSize = size
        }
    }
}

extension ViewController: PresenterToViewController{
    func setupData(data: NSMutableArray,type: Int) {
        if type == 0{
            let totalItem = data.count-1
            for i in 0...totalItem {
                array_data.add(data[i])
            }
            modelList = MovieListModel(_items: array_data)
            collection_movie.reloadData()
            page+=1
        }else{
            if data.count > 0{
                let totalItem = data.count-1
                array_data = NSMutableArray()
                page = 1
                for i in 0...totalItem {
                    array_data.add(data[i])
                }
                modelList = MovieListModel(_items: array_data)
                collection_movie.reloadData()
                page+=1
            }
        }
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: "Alert", message: "Error when downloading data !", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return  array_data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        let item = array_data[indexPath.row] as! MovieModel
        cell.iv_poster.kf.setImage(with: URL(string: item.poster!))
        cell.lb_poster.text = item.title
        cell.lb_year.text   = item.year
        cell.lb_type.text   = item.type?.capitalized
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = array_data[indexPath.row] as! MovieModel
        presenter?.showMovieDetail(id: item.imdbID ?? "", vc: navigationController!)
    }
}

extension ViewController: UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        presenter?.updateView(keyword: nil,page: page)
    }
}

