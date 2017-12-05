//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Youssef Elabd on 11/23/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SuperheroViewController: UIViewController {
    
    var movies: [Movie] = []
    let superheroId = "284053"
    let baseURL = "https://api.themoviedb.org/3/movie/"
    let apiKey = "d47f9b3e5df8cfa4bf8683444da0c6d9"

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        getMovies()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getMovies(){
        let url = baseURL + superheroId + "/similar?api_key=" + apiKey
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.error{
                print(error.localizedDescription)
            }
            
            guard let value = response.result.value else {
                return
            }
            
            let json = JSON(value)
            
            print(json)
            
            let movies = json["results"].arrayValue
            
            for movie in movies {
                self.movies.append(Movie(json: movie))
            }
        
            
            self.collectionView.reloadData()
            
            
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! MovieCollectionCell
        
        let destionation = segue.destination as! SingleMovieViewController
        
        let item = collectionView.indexPath(for: cell)?.item
        
        let selectedMovie = movies[item!]
        
        destionation.movie = selectedMovie
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}

extension SuperheroViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as! MovieCollectionCell
        
        let movie = movies[indexPath.item]
        
        cell.posterView.af_setImage(withURL: movie.posterPath)
        cell.posterView.layer.cornerRadius = 25.0
        cell.posterView.clipsToBounds = true
        
        
        return cell
    }
}
