//
//  TopRatedMoviesViewController.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import UIKit

class TopRatedMoviesViewController: BaseMoviesViewController {
    
    override var apiUrl: String {
            return ApiUrls.topRatedMovies
        }

}


