//
//  HomeViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 01/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCHomeViewController: UIViewController {

    @IBOutlet weak var entrar: UIButton!
    @IBOutlet weak var facebookEntrar: UIButton!
    @IBOutlet weak var cadastar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cadastar.layer.cornerRadius = 5
        entrar.layer.cornerRadius = 5
        facebookEntrar.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
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
