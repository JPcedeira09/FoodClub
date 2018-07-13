//
//  FCCadastraisViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 21/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCCadastraisViewController: UIViewController {
    
    var cliente : Cliente?
    var endereco : Endereco?
    var fcAlert = FCAlert()

    @IBOutlet weak var btnProximo: UIButton!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBOutlet weak var confirmaSenha: UITextField!
    @IBOutlet weak var viewObj: UIView!
    @IBOutlet weak var imageRestaurante: UIImageView!
    
    @IBAction func dissmissBtn(_ sender: Any) {
  dismiss(animated: true, completion: nil)
    }
    @IBAction func btnProximo(_ sender: UIButton) {

        if(testTextField(cpf) == false || testTextFieldCaracteres(cpf, valorMin: 11, valorMax: 16)) {
            self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu CPF, de 11 até 15 caracteres, por favor", controller: self )
        }else
            if(testTextField(nome) == false || testTextFieldCaracteres(nome, valorMin: 3, valorMax: 60)) {
                self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha seu nome, de 3 até 60 caracteres, por favor", controller: self )
            }else
                if(testTextField(senha) == false  || testTextFieldCaracteres(senha, valorMin: 6, valorMax: 8)) {
                    self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha a senha, de 6 até 8 caracteres, por favor", controller: self )
                }else
                    if(testTextField(confirmaSenha) == false  || testTextFieldCaracteres(confirmaSenha, valorMin: 6, valorMax: 8)) {
                        self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha a confirmação de senha, de 6 até 8 caracteres, por favor", controller: self )
                    }
                    else
                        if(confirmaSenha.text! != senha.text!) {
                            self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Por Favor, Digite Novamente Suas Senhas, Senhas Divergentes", controller: self )
                        }else{
                            cliente?.cpf = cpf.text!
                            cliente?.nome = nome.text!
                            cliente?.senha = senha.text!
                            
                            performSegue(withIdentifier: "contatoProximo", sender: nil)
        }
    }
    
    func testTextField( _ textField:UITextField) -> Bool{
        if textField.text == "" || textField.text == nil {
            return false
        }else{
            return true
        }
    }
    
    func testTextFieldCaracteres( _ textField:UITextField, valorMin:Int, valorMax:Int) -> Bool{
        if ((textField.text?.count)! > valorMin ||  (textField.text?.count)! < valorMax ){
            
            return false
            
        }else{
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endereco = Endereco(id_enderecos: 0, CEP: "", bairro: "", cidade: "", estado: "", cpf: "", rua: "", complemento: "")
        
        cliente = Cliente(cpf: "", nome: "", senha: "", cel: "", telefone: "", email: "",endereco : endereco!)
        
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
    
}
