//
//  FCLoginViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 03/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit
import Alamofire

class FCLoginViewController: UIViewController {
    
    @IBOutlet weak var textCPF: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    
    var fcAlert = FCAlert()
    
    /**
     Login Rest
     */
    @IBAction func btnLogar(_ sender: UIButton) {
        if(testTextField(textCPF) == false) {
            
            fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o campo CPF, por favor", controller: self )
        }else if (testTextField(txtSenha) == false) {
            fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o campo senha, por favor", controller: self )
        }else{
            login(cpf: textCPF.text!, senha: txtSenha.text!)
        }
    }
    
    @IBAction func btnEsqueceu(_ sender: UIButton) {
    }
    
    /**
     Login com o facebook
     */
    @IBAction func btnLogin(_ sender: UIButton) {
        
    }
    
    @IBAction func btnCadastro(_ sender: UIButton) {
        performSegue(withIdentifier: "cadastrar", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEntrar.layer.cornerRadius = 5
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
        textCPF.resignFirstResponder()
        txtSenha.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textCPF.resignFirstResponder()
        txtSenha.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension FCLoginViewController {
    
    func testTextField( _ textField:UITextField) -> Bool{
        if textField.text == "" || textField.text == nil {
            return false
        }else{
            return true
        }
    }
    
    func login(cpf:String, senha:String){
        
        var endereco = Endereco(id_enderecos: 0, CEP: "", bairro: "", cidade: "", estado: "", cpf: "", rua: "", complemento: "")
        var cliente = Cliente(cpf: cpf, nome: "", senha: senha, cel: "", telefone: "", email: "",endereco: endereco)
        
        let getURL = URL(string: "http://localhost:8080/food2abcapi/rest/login")
        let header = ["Content-Type" : "application/json"]
        let parametros : [String: Any]  =  cliente.toDict(cliente) as [String:Any]
        
        Alamofire.request(getURL!, method: .post, parameters:parametros , encoding: JSONEncoding.default, headers: header).validate(contentType: ["application/json"]).responseJSON {  response in
            
            switch response.result {
            case .success(let data):
                print(data)
                self.fcAlert.FCAlertSegue(titulo: "Bem Vindo", menssagem: "Agora você pode pedir comida em um piscar de olhos.", segue: "login", controller : self)
            case .failure(let error):
                print(error.localizedDescription)
                self.fcAlert.FCAlert(titulo: "Opss!", menssagem: "Algo deu errado, tente novamente.", controller: self)
            }
        }
    }
    
}

/*
 func sendFeedBack( feedback: MBFeedback)-> String{
 let parametros : [String: Any]  =  feedback.toDict(feedback) as [String:Any]
 let postURL = URL(string:  "https://api.taximanager.com.br/v1/taximanager/feedback")
 
 let header = ["Content-Type" : "application/json",
 "Authorization" : MBUser.currentUser?.token ?? ""]
 
 Alamofire.request(postURL!, method: .post, parameters:parametros , encoding: JSONEncoding.default, headers: header).validate(contentType: ["application/json"]).responseJSON {  response in
 
 SwiftSpinner.hide()
 
 switch response.result {
 case .success(let data):
 print(data)
 
 let feedbackTitle = self.alertSuccessSendFeedbackTitle != "" ? self.alertSuccessSendFeedbackTitle : "Enviada!"
 let feedbackDescription = self.alertSuccessSendFeedbackDescription != "" ? self.alertSuccessSendFeedbackDescription : "A mensagem foi enviada com sucesso!"
 
 let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
 let alertView = SCLAlertView(appearance: appearance)
 alertView.addButton("Fechar", action: {self.dismiss(animated: true)})
 alertView.showSuccess(feedbackTitle, subTitle: feedbackDescription)
 
 //                alertView.addButton("Second Button") {
 //                    print("Second button tapped")
 //                }
 //                alertView.setDismissBlock {
 //                    self.dismiss(animated: true)
 //                }
 
 case .failure(let error):
 print(error.localizedDescription)
 print("iNFO: error in localizedDescription getBookmarks")
 
 if(self.alertFailSendFeedbackTitle == "" || self.alertFailSendFeedbackDescription == ""){
 
 let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
 let alertView = SCLAlertView(appearance: appearance)
 alertView.addButton("Fechar", action: {self.dismiss(animated: true)})
 alertView.showError("Falha ao adicionar favorito", subTitle: "Tente mais tarde.")
 
 }else{
 
 let appearance = SCLAlertView.SCLAppearance(showCloseButton: false)
 let alertView = SCLAlertView(appearance: appearance)
 alertView.addButton("Fechar", action: {self.dismiss(animated: true)})
 alertView.showError(self.alertFailSendFeedbackTitle, subTitle: self.alertFailSendFeedbackDescription)
 }
 }
 }
 return feedback.message
 }*/
