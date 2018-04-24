//
//  FCAlert.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 23/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation
import UIKit

class FCAlert {
    
    func FCAlertSegue(titulo : String , menssagem : String, segue:String, controller:UIViewController){
        
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
            
            controller.performSegue(withIdentifier: segue, sender: nil)}
        alertController.addAction(action)
        controller.present(alertController, animated: true)
    }
    
    func FCAlert(titulo : String , menssagem : String, controller:UIViewController){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let actionDef = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(actionDef)
        controller.present(alertController, animated: true, completion: nil)
    }
    
    
    
}
