//
//  AllMovieViewController.swift
//  Movie App
//
//  Created by Abdalah Omar on 5/20/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit

class AllMovieViewController: UIViewController {
    
    @IBOutlet weak var allMovieCollectionView: UICollectionView!
    @IBOutlet weak var addMovieCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     getApiMovieData()
    }
    //MARK: - Dissaper NavigationController
       override func viewWillAppear(_ animated: Bool) {
           navigationController?.isNavigationBarHidden = true
       }
       override func viewWillDisappear(_ animated: Bool) {
                   navigationController?.isNavigationBarHidden = false

       }
    
    func getApiMovieData(){
        
          _ = TMDBClient.getWatchlist(completion: { (movies, error) in
              MovieModel.watchlist = movies
              
              DispatchQueue.main.async {
                  self.allMovieCollectionView.reloadData()
                  self.addMovieCollectionView.reloadData()
              }
          })
          
    }
    
    
}

extension AllMovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

               return CGSize(width: ((collectionView.frame.width / 2) - 40 ), height: (collectionView.frame.width / 3) )

       }

       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
               return UIEdgeInsets(top: 10, left: 25   , bottom: 10, right: 25)
         
       }
    
    
}
 
extension AllMovieViewController :UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //numberOfItemsInSection addMoviecollection
        if collectionView == addMovieCollectionView{
            
            return 1
        }
        // numberOfItemsInSection ALLMoviecolllection
        return MovieModel.watchlist.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // addMoviecollectioncell the user add
        if collectionView == addMovieCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddMovieCell", for: indexPath) as! AddMovieCell
            cell.posterImage.image = UIImage(named: "PosterPlaceholder")
            if let savedMovies = UserDefaults.standard.object(forKey: "SavedDataMovie") as? Data {
                          let decoder = JSONDecoder()
                          if let loadedPerson = try? decoder.decode(AddMovieModel.self, from: savedMovies) {
                            cell.titleLable.text = loadedPerson.title
                            cell.dateLable.text = loadedPerson.date
                            
                          }
                      }
           
            return cell
        }
        // allmove collectioncell by API
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllMovieCell", for: indexPath) as! AllMovieCell
        
        // geting API json Data
        let movie = MovieModel.watchlist[indexPath.row]
        cell.confgCell(movie: movie)
        if let posterPath = movie.posterPath {
            TMDBClient.downloadPosterImage(Path: posterPath) { data, error in
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                cell.posterImage?.image = image
                
                cell.setNeedsLayout()
            }
        }
        return cell
    }
    
    
}
