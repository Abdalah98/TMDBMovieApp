//
//  MovieDetailViewController.swift
//  Movie app
//
//  Created by Abdalah Omar on 5/17/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titelLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var overViewTextView: UITextView!
    
    
    var titles: String?
    var overView:String?
    var date:String?
    var poster:UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()

        titelLable.text = titles
        overViewTextView.text = overView
        dateLable.text = date
        posterImage.image = poster

    }
    
 
}


