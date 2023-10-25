//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import UIKit

class MoviesViewModel: NSObject {
    
    func getAllMovies(apiUrl : String,nowPlayingMovies : @escaping ([Results]) -> ()){
        WebService.shared.getRequest(urlString: apiUrl) { (nowPlayingMoviesModel : MoviesModel?,error) in
            if error == nil{
                nowPlayingMovies(nowPlayingMoviesModel?.results ?? [])
            }
        }
    }

}
