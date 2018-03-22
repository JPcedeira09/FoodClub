//
//  FCCadastraisViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 21/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCCadastraisViewController: UIViewController {
    
    @IBOutlet weak var btnProximo: UIButton!
    @IBOutlet weak var cnpj: UITextField!
    @IBOutlet weak var nomeRestaurante: UITextField!
    @IBOutlet weak var senhaRestaurante: UITextField!
    
    @IBOutlet weak var confirmaSenha: UITextField!
    
    @IBOutlet weak var imageRestaurante: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageRestaurante.layer.cornerRadius = imageRestaurante.frame.width/2
        btnProximo.layer.cornerRadius = 5
        NotificationCenter.default.addObserver(self, selector: #selector(FCCadastraisViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(FCCadastraisViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let keyboardHeight = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as AnyObject).cgRectValue.height
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = -1 * keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.view.window?.frame.origin.y = 0
            self.view.layoutIfNeeded()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        confirmaSenha.resignFirstResponder()
        senhaRestaurante.resignFirstResponder()
        nomeRestaurante.resignFirstResponder()
        cnpj.resignFirstResponder()
        
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
