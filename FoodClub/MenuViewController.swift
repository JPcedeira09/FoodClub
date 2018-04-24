//
//  MenuViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 15/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func logout(_ sender: UIButton) {
        performSegue(withIdentifier: "logout", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.cornerRadius = image.frame.width/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
