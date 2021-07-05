//
//  MovieTableViewCell.swift
//  Flix
//
//  Created by Edidiong Ekong on 05/07/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var synopsis: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
