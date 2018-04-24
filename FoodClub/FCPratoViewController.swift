//
//  FCPratoViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 24/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCPratoViewController: UIViewController {
    
    
    @IBAction func dissmissAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var nomeDoPrato: UILabel!
    
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var imagePrato: UIImageView!
    @IBOutlet weak var descricaoPrato: UILabel!
    @IBOutlet weak var quantidade: UILabel!
    @IBAction func menos(_ sender: UIButton) {
    }
    
    @IBAction func maisPrato(_ sender: UIButton) {
        
    }
    @IBAction func adicionarObservacao(_ sender: UIButton) {
    }
    @IBAction func addAoCarrinho(_ sender: UIButton) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        add.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
