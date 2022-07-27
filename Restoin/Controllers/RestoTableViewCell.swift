//
//  RestoTableViewCell.swift
//  Restoin
//
//  Created by Kozi on 27/07/22.
//

import UIKit

class RestoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restoImage: UIImageView!
    @IBOutlet weak var restoLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var locImage: UIImageView!
    @IBOutlet weak var locLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
