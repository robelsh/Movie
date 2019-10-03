//
//  MainViewController.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var movies: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension MainViewController {
    
    fileprivate func setup() {
        let itemSize = UIScreen.main.bounds.width
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemSize, height: 200)
        layout.minimumInteritemSpacing = 3
        layout.minimumLineSpacing = 3
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        
        HTTPRequest.shared.getListOfMovies({ response in
            if let movies = response.results {
                self.movies = movies
                self.collectionView.reloadData()
            }
        }, { error in
            print(error)
        })
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath)
        
        if let cell = cell as? MovieCollectionViewCell {
            cell.setup(title: movies[indexPath.row].title ?? "", year: movies[indexPath.row].releaseDate ?? "")
            if let urlString = movies[indexPath.row].posterPath {
                HTTPRequest.shared.getImage(from: urlString, { (data) in
                    cell.setupImage(image: UIImage(data: data))
                }, { (error) in
                    print(error)
                })
            }
        }
        
        return cell
    }
}
