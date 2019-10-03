//
//  MovieCollectionViewCell.swift
//  Movie
//
//  Created by Etienne JEZEQUEL on 02/10/2019.
//  Copyright © 2019 Etienne JEZEQUEL. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var movieImageView: UIImageView!
    @IBOutlet fileprivate weak var movieTitleLabel: UILabel!
    @IBOutlet fileprivate weak var movieYearLabel: UILabel!
    
    static let identifier = "MovieCollectionViewCellIdentifier"
    
    func setup(title: String, year: String) {
        movieTitleLabel.text = title
        movieYearLabel.text = year
    }
    
    func setupImage(image: UIImage?) {
        movieImageView.image = image
    }
}
