//
//  seeAllMovieCollectionView.swift
//  Movie App
//
//  Created by Abdalah Omar on 5/20/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit


class seeAllMovieCollectionView: UICollectionViewController {
    var selectedImage = [UIImage]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.prefetchDataSource = self
        
        
    }
    func getApiMovieData(){
        _ = TMDBClient.getWatchlist(completion: { (movies, error) in
            MovieModel.watchlist = movies
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieModel.watchlist.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seeAllMovieCell", for: indexPath) as! seeAllMovieCell
        
        let movie = MovieModel.watchlist[indexPath.row]
        cell.confgCell(movie: movie)
        if let posterPath = movie.posterPath {
            TMDBClient.downloadPosterImage(Path: posterPath) { data, error in
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                cell.posterImage?.image = image
                self.selectedImage.append(UIImage(data: data)!)
                
                cell.setNeedsLayout()
            }
        }
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        let movie = MovieModel.watchlist[indexPath.row]
        ViewController.titles = movie.title
        ViewController.overView = movie.overview
        ViewController.date = movie.releaseDate
        ViewController.poster = selectedImage[indexPath.row]
        
        self.navigationController?.present(ViewController, animated: true, completion: nil)
        
        
    }
    
}

extension seeAllMovieCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((collectionView.frame.width / 2) - 40 ), height: (collectionView.frame.width / 2) )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20   , bottom: 10, right: 20)
        
    }
    
}
extension seeAllMovieCollectionView:UICollectionViewDataSourcePrefetching{
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        print(indexPaths)
        for index in indexPaths{
            if index.row >= selectedImage.count - 3 {
                
                
            }
        }
        
    }
    
    
}
