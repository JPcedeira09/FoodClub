//
//  FCPratosListTableViewCell.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 08/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCPratosListTableViewCell: UITableViewCell {

    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var classificacao: UILabel!
    @IBOutlet weak var nota: UILabel!
    @IBOutlet weak var tamanho: UILabel!
    @IBOutlet weak var foto_prato: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
