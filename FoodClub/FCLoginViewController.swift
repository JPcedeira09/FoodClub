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
    override func viewDidLoad() {
        super.viewDidLoad()
        btnEntrar.layer.cornerRadius = 5
    }
    
    @IBAction func btnLogar(_ sender: UIButton) {
    }
    
    @IBAction func btnEsqueceu(_ sender: UIButton) {
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        login(cpf: textCPF.text!, senha: txtSenha.text!)
    }
    @IBAction func btnCadastro(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func login(cpf:String, senha:String){
        
        var cliente = Cliente(cpf: cpf, nome: "", senha: senha, cel: "", telefone: "", email: "")
        let getURL = URL(string: "http://localhost:8080/food2abcapi/rest/login")
        let header = ["Content-Type" : "application/json"]
        let parametros : [String: Any]  =  cliente.toDict(cliente) as [String:Any]

        Alamofire.request(getURL!, method: .post, parameters:parametros , encoding: JSONEncoding.default, headers: header).validate(contentType: ["application/json"]).responseJSON {  response in
            
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
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
    
}
