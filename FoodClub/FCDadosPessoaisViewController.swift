//
//  FCDadosPessoaisViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 21/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCDadosPessoaisViewController: UIViewController {
    
    var cliente : Cliente?
    var fcAlert = FCAlert()

    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var celular: UITextField!
    
    @IBOutlet weak var btnCadastrar: UIButton!
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {

    dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnProximo(_ sender: UIButton) {
        
        if(testTextField(telefone) == false || testTextFieldCaracteres(telefone, valorMin: 9, valorMax: 20)) {
            
            self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu CPF, de 9 até 20 caracteres, por favor", controller: self )
            
        }else
            if(testTextField(email) == false || testTextFieldCaracteres(email, valorMin: 10, valorMax: 60)) {
                
                self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu e-mail, de 10 até 60 caracteres, por favor", controller: self )
                
            }else
                if(testTextField(celular) == false || testTextFieldCaracteres(celular, valorMin: 10, valorMax: 60)) {
                    
                    self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu celular, de 9 até 20 caracteres, por favor", controller: self )
                    
                }else{
                
                cliente?.telefone = telefone.text!
                cliente?.email = email.text!
                cliente?.cel = celular.text!
                    
                performSegue(withIdentifier: "entregaProximo", sender: nil)
                
        }
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            print(cliente)
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewcontroller = segue.destination as? FCEntregaCadastroViewController {
            viewcontroller.cliente = cliente
        }
    }
    
    }
    
    extension FCDadosPessoaisViewController : UITextFieldDelegate {
        
        func testTextField( _ textField:UITextField) -> Bool{
            if textField.text == "" || textField.text == nil {
                return false
            }else{
                return true
            }
        }
        
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
            self.telefone.resignFirstResponder()
            self.email.resignFirstResponder()
            self.celular.resignFirstResponder()
            self.view.resignFirstResponder()
        }
        
        func testTextFieldCaracteres( _ textField:UITextField, valorMin:Int, valorMax:Int) -> Bool{
            if ((textField.text?.count)! > valorMin ||  (textField.text?.count)! < valorMax ){
                return false
            }else{
                return true
            }
        }
        
}
