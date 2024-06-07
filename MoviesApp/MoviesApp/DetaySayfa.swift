//
//  DetaySayfa.swift
//  MoviesApp
//
//  Created by Emre Ertuğ on 12.05.2024.
//

import UIKit

class DetaySayfa: UIViewController {
    @IBOutlet weak var labelFilmAd: UILabel!
    
    @IBOutlet weak var imageFilm: UIImageView!
    
    @IBOutlet weak var labelFiyat: UILabel!
    
    var film:Filmler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            
            labelFilmAd.text = f.ad
            imageFilm.image = UIImage(named: f.resim!)
            labelFiyat.text = "\(f.fiyat!) ₺"
            
        }
        

    }
    
    
    

}
