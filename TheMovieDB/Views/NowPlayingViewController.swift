//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Jonnadula Pavan Kalyan  on 25/10/23.
//

import UIKit

class NowPlayingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let moviesViewModel : MoviesViewModel = MoviesViewModel()
    var listOfMovies = [Results]()
    private var dataSource : MoviesTableViewDatasource!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MoviesTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")

        gellAllMovies()
    }
    
    fileprivate func gellAllMovies() {
        SKProgressView.shared.showProgressView(self.view)
        moviesViewModel.getAllMovies(apiUrl: ApiUrls.nowPlayingMovies) { [weak self] nowplayingMovies in
            self?.listOfMovies = nowplayingMovies
            self?.updateTableDataSource()
        }
    }
    
    func updateTableDataSource(){
        self.dataSource = MoviesTableViewDatasource(data: self.listOfMovies)
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
            SKProgressView.shared.hideProgressView()
        }
    }
    
}



