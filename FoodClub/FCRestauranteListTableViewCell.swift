//
//  FCRestauranteListTableViewCell.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 08/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCRestauranteListTableViewCell: UITableViewCell {

    @IBOutlet weak var foto_restaurante: UIImageView!
    
    @IBOutlet weak var nome_restaurante: UILabel!
    @IBOutlet weak var avaliacao: UILabel!
    @IBOutlet weak var categoria: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
