//
//  seeAllMovieCell.swift
//  Movie App
//
//  Created by Abdalah Omar on 5/20/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit

class seeAllMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    func confgCell(movie: MovieResults?) {
           self.titleLabel.text = movie?.title ?? ""
           self.overViewLabel.text = movie?.overview ?? ""
           self.dateLabel.text = movie?.releaseDate ?? ""
           self.posterImage?.image = UIImage(named: "PosterPlaceholder")
           
       }
}
