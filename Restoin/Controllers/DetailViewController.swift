//
//  DetailViewController.swift
//  Restoin
//
//  Created by Kozi on 27/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailRestoImage: UIImageView!
    @IBOutlet weak var detailRestoLabel: UILabel!
    @IBOutlet weak var detailRestoDescLabel: UILabel!
    @IBOutlet weak var detailRestoRatingImage: UIImageView!
    @IBOutlet weak var detailRestoRatingLabel: UILabel!
    @IBOutlet weak var detailRestoLocImage: UIImageView!
    @IBOutlet weak var detailRestoLocLabel: UILabel!
    
    var resto: Restaurants? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        	
        if let result = resto {
            
            detailRestoImage.loadFrom(URLAddress: "https://restaurant-api.dicoding.dev/images/small/\(result.pictureId)")
            detailRestoLabel.text = result.name
            detailRestoDescLabel.text = result.description
            detailRestoRatingImage.image = UIImage(named: "Star")
            detailRestoRatingLabel.text = String(result.rating)
            detailRestoLocImage.image = UIImage(named: "Location")
            detailRestoLocLabel.text = result.city
        }
    }

}
