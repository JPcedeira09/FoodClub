//
//  FCPedidosTableViewCell.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 25/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCPedidosTableViewCell: UITableViewCell {

    @IBOutlet weak var precoPrato: UILabel!
    @IBOutlet weak var quantidade: UILabel!
    @IBOutlet weak var nomePrato: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
