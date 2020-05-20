//
//  TMDBClient.swift
//  Movie app
//
//  Created by Abdalah Omar on 5/17/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//
import Foundation

class TMDBClient {
    
    static let apiKey = "acea91d2bff1c53e6604e4985b6989e2&p%20age=1"
    enum Endpoints {
        static let base = "http://api.themoviedb.org/3/discover/movie?"
        static let apiKeyParam = "api_key=\(TMDBClient.apiKey)"
        case allMovie
        case posterImageURL(String)
        var stringValue: String {
            switch self {
            case .allMovie:
                return Endpoints.base + Endpoints.apiKeyParam
            case .posterImageURL(let posterPath) :
                return "https://image.tmdb.org/t/p/w500" + posterPath
                
            }
        }
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func getWatchlist(completion: @escaping ([MovieResults], Error?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: Endpoints.allMovie.url) { data, response, error in
            guard let data = data else {
                completion([], error)
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(Movie.self, from: data)
                //print(responseObject)
                completion(responseObject.results, nil)
            } catch {
                completion([], error)
            }
        }
        task.resume()
    }
    
    
    
    class func downloadPosterImage(Path :String,completion: @escaping (Data?, Error?) -> Void){
        let request = URLRequest(url:Endpoints.posterImageURL(Path).url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
                
            }
        }
        task.resume()
    }
    
}
