//
//  BaseMoviesViewController.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import UIKit

class BaseMoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let moviesViewModel: MoviesViewModel = MoviesViewModel()
    var listOfMovies = [Results]()
    private var dataSource: MoviesTableViewDatasource!
    
    var apiUrl: String {
        return ApiUrls.nowPlayingMovies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        tableView.delegate = self
        getAllMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false

    }
    func getAllMovies() {
        SKProgressView.shared.showProgressView(self.view)
        moviesViewModel.getAllMovies(apiUrl: apiUrl) { [weak self] nowplayingMovies in
            self?.listOfMovies = nowplayingMovies
            self?.updateTableDataSource()
        }
    }
    
    func updateTableDataSource() {
        self.dataSource = MoviesTableViewDatasource(data: self.listOfMovies)
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            SKProgressView.shared.hideProgressView()
        }
    }
}

extension BaseMoviesViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let movieDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        movieDetailsViewController.movieDetails = self.listOfMovies[indexPath.row]
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
    }
}
