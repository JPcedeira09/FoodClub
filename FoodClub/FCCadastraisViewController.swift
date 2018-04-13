//
//  FCCadastraisViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 21/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCCadastraisViewController: UIViewController {
    // TODO
    var cliente : Cliente?// TODO
    // TODO
    @IBOutlet weak var btnProximo: UIButton!// TODO
    @IBOutlet weak var cpf: UITextField!// TODO
    @IBOutlet weak var nome: UITextField!// TODO
    @IBOutlet weak var senha: UITextField!// TODO
    @IBOutlet weak var confirmaSenha: UITextField!// TODO
    @IBOutlet weak var viewObj: UIView!// TODO
    @IBOutlet weak var imageRestaurante: UIImageView!// TODO
    // TODO// TODO
    @IBAction func btnProximo(_ sender: UIButton) {// TODO
        if(testTextField(cpf) == false || testTextFieldCaracteres(cpf, valorMin: 11, valorMax: 15)) {// TODO// TODO
            FCAlert(titulo: "Opps!", menssagem:"Preencha o seu CPF, de 11 até 15 caracteres, por favor" )// TODO// TODO
        }else// TODO
            if(testTextField(nome) == false || testTextFieldCaracteres(nome, valorMin: 3, valorMax: 60)) {
                FCAlert(titulo: "Opps!", menssagem:"Preencha seu nome, de 3 até 60 caracteres, por favor" )
            }else
                if(testTextField(senha) == false  || testTextFieldCaracteres(senha, valorMin: 6, valorMax: 8)) {
                    FCAlert(titulo: "Opps!", menssagem:"Preencha a senha, de 6 até 8 caracteres, por favor" )
                }else
                    if(testTextField(confirmaSenha) == false  || testTextFieldCaracteres(confirmaSenha, valorMin: 6, valorMax: 8)) {
                        FCAlert(titulo: "Opps!", menssagem:"Preencha a confirmação de senha, de 6 até 8 caracteres, por favor" )
                    }// TODO
                    else
                        if(confirmaSenha.text! != senha.text!) {
                            FCAlert(titulo: "Opps!", menssagem:"Por Favor, Digite Novamente Suas Senhas, Senhas Divergentes" )
                        }else{
                            cliente?.cpf = cpf.text!
                            cliente?.nome = nome.text!
                            cliente?.senha = senha.text!
                            
                            performSegue(withIdentifier: "contatoProximo", sender: nil)
        }
    }// TODO
    
    func testTextField( _ textField:UITextField) -> Bool{
        if textField.text == "" || textField.text == nil {
            return false
        }else{
            return true
        }
    }
    
    func testTextFieldCaracteres( _ textField:UITextField, valorMin:Int, valorMax:Int) -> Bool{
        if ((textField.text?.count)! < valorMin ||  (textField.text?.count)! > valorMax ){
            return false
        }else{
            return true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cliente = Cliente(cpf: "", nome: "", senha: "", cel: "", telefone: "", email: "")
        
        viewObj.layer.cornerRadius = viewObj
            .frame.width/2
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
        senha.resignFirstResponder()
        nome.resignFirstResponder()
        cpf.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewcontroller = segue.destination as? FCDadosPessoaisViewController {
            viewcontroller.cliente = cliente
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        confirmaSenha.resignFirstResponder()
        senha.resignFirstResponder()
        nome.resignFirstResponder()
        cpf.resignFirstResponder()
        
    }
    
    func FCAlert(titulo : String , menssagem : String){
        let alertController = UIAlertController(title: titulo, message: menssagem, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
