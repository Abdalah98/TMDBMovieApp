//
//  AddMovieModel.swift
//  Movie app
//
//  Created by Abdalah Omar on 5/19/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//
import UIKit
import Foundation

struct AddMovieModel:Codable{
    var title: String
    var overView: String
   var date: String
    init(title: String, overView: String,date:String) {
        self.title = title
        self.overView = overView
        self.date = date
    }
}
