//
//  SingleMovieViewController.swift
//  Flix
//
//  Created by Youssef Elabd on 11/18/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import AlamofireImage

class SingleMovieViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populate()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populate(){
       
        if let posterPath = self.movie?.posterPath,let backdropPath = self.movie?.backDropPath {
            self.posterView.af_setImage(withURL: posterPath)
            self.backdropView.af_setImage(withURL: backdropPath)
            
        }
        
        titleLabel.text = self.movie?.title
        releaseDateLabel.text = self.movie?.releaseDate
        overviewLabel.text = self.movie?.description
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
