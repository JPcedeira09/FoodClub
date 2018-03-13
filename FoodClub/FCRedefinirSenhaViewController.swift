//
//  FCRedefinirSenhaViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 12/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCRedefinirSenhaViewController: UIViewController {
    
    @IBOutlet weak var buttonEnviar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonEnviar.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
