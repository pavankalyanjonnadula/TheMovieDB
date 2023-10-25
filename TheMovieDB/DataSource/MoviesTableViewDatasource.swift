//
//  MoviesTableViewDatasource.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import Foundation
import UIKit

class MoviesTableViewDatasource : NSObject, UITableViewDataSource {
    
    
    var movieData: [Results] = []
    
    init(data: [Results]) {
        self.movieData = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = Bundle.main.loadNibNamed("MoviesTableViewCell", owner: self)?.first as! MoviesTableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier: "movieCell",for: indexPath) as! MoviesTableViewCell
        cell.movieImage.downloadImage(from: URL(string: movieData[indexPath.item].posterPath ?? "")!)
        cell.movieTitle.text = movieData[indexPath.row].title
        cell.movieDescription.text = movieData[indexPath.row].overview
        return cell
    }

}
