//
//  AllMovieCell.swift
//  Movie App
//
//  Created by Abdalah Omar on 5/20/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit

class AllMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    func confgCell(movie: MovieResults?) {
           self.titleLabel.text = movie?.title ?? ""
           self.posterImage?.image = UIImage(named: "PosterPlaceholder")
           
       }
}
