//
//  FCDadosPessoaisViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 21/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCDadosPessoaisViewController: UIViewController {
    
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var celular: UITextField!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.telefone.delegate = self
        self.email.delegate = self
        self.celular.delegate = self
        
        btnCadastrar.layer.cornerRadius = 5
        NotificationCenter.default.addObserver(self, selector: #selector(FCDadosPessoaisViewController.keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(FCDadosPessoaisViewController.keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FCDadosPessoaisViewController : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.telefone.resignFirstResponder()
        self.email.resignFirstResponder()
        self.celular.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.telefone.resignFirstResponder()
        self.email.resignFirstResponder()
        self.celular.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
        self.view.resignFirstResponder()
    }
}
