//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverView: UITextView!
    @IBOutlet weak var movieImage: UIImageView!
    
    var movieDetails : Results?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTheData()
    }
    
    func initializeTheData(){
        movieTitle.text = movieDetails?.title
        movieImage.downloadImage(from: URL(string: movieDetails?.backdropPath ?? "")!)
        let overviewText = movieDetails?.overview ?? "N/A"
        let languageText = movieDetails?.originalLanguage ?? "N/A"
        let releaseDateText = movieDetails?.releaseDate ?? "N/A"

        movieOverView.text = overviewText + "\n\nLanguage: " + languageText + "\n\nRelease Date: " + releaseDateText

    }


}
