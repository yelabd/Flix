//
//  NowPlayingViewController.swift
//  Flix
//
//  Created by Youssef Elabd on 11/10/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import MBProgressHUD

import SwiftyJSON

class NowPlayingViewController: UIViewController {
    
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "d47f9b3e5df8cfa4bf8683444da0c6d9"
    var movies: [Movie] = []
    var isFirst = true

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        
        
        getMovies()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMovies(){
        let url = baseURL + "now_playing?api_key="+apiKey
        
        if isFirst {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.error{
                print(error.localizedDescription)
            }
            
            guard let value = response.result.value else {
                return
            }
            
            let json = JSON(value)
            
            let movies = json["results"].arrayValue
            
            for movie in movies {
                self.movies.append(Movie(json: movie))
            }
            
            if self.isFirst {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.isFirst = false
            }
            
            self.tableView.reloadData()
            
            
        }
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        getMovies()
        refreshControl.endRefreshing()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MovieCell
        
        let destionation = segue.destination as! SingleMovieViewController
        
        let row = tableView.indexPath(for: cell)?.row
        
        let selectedMovie = movies[row!]
        
        destionation.movie = selectedMovie

        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

extension NowPlayingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.decscriptionLabel.text = movie.description
        cell.posterView.af_setImage(withURL: movie.posterPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

