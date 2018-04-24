
//
//  FCEntregaCadastroViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 14/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit
import Alamofire

class FCEntregaCadastroViewController: UIViewController {
    
    var cliente:Cliente?
    var fcAlert = FCAlert()
    var CPF:String = ""
    
    @IBOutlet weak var rua: UITextField!
    @IBOutlet weak var complemento: UITextField!
    @IBOutlet weak var bairro: UITextField!
    @IBOutlet weak var cidade: UITextField!
    @IBOutlet weak var estado: UITextField!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    @IBAction func btnProximo(_ sender: UIButton) {
        
        if(testTextField(rua) == false || testTextFieldCaracteres(rua, valorMin: 3, valorMax: 150)) {
            
            self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o sua rua, de 3 até 150 caracteres, por favor" , controller : self)
            
        }else
            if(testTextField(complemento) == false || testTextFieldCaracteres(complemento, valorMin: 3, valorMax: 150)) {
                
                self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o complemento, de 3 até 150 caracteres, por favor" , controller : self)
                
            }else
                if(testTextField(bairro) == false || testTextFieldCaracteres(bairro, valorMin: 3, valorMax: 150)) {
                    
                    self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu bairo, de 3 até 150 caracteres, por favor" , controller : self)
                    
                }else
                    if(testTextField(cidade) == false || testTextFieldCaracteres(cidade, valorMin: 3, valorMax: 150)) {
                        
                        self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu celular, de 3 até 150 caracteres,  por favor" , controller : self)
                        
                    }else
                        if(testTextField(estado) == false || testTextFieldCaracteres(estado, valorMin: 3, valorMax: 60)) {
                            
                            self.fcAlert.FCAlert(titulo: "Opps!", menssagem:"Preencha o seu estado, de 3 até 60 caracteres, por favor", controller : self )
                            
                        }else{
                            
                            cliente?.endereco.rua = rua.text!
                            cliente?.endereco.complemento = complemento.text!
                            cliente?.endereco.bairro = bairro.text!
                            cliente?.endereco.cidade = cidade.text!
                            cliente?.endereco.estado = estado.text!
                            cliente?.endereco.cpf = CPF

                            print( cliente?.endereco)
                            self.cadastroCliente(cliente: cliente!)
        }
        print( (cliente?.toDict(cliente!))!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print( (cliente?.endereco)!)
        CPF = (cliente?.cpf)!
        
        self.rua.delegate = self
        self.complemento.delegate = self
        self.bairro.delegate = self
        self.cidade.delegate = self
        self.estado.delegate = self
        
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

extension FCEntregaCadastroViewController : UITextFieldDelegate {
    
    func cadastroCliente(cliente:Cliente ) {
        
        let getURL = URL(string: "http://localhost:8080/food2abcapi/rest/cadastrocliente")
        let header = ["Content-Type" : "application/json"]
        let parametros : [String: Any]  =  cliente.toDict(cliente) as [String:Any]
        
        Alamofire.request(getURL!, method: .post, parameters:parametros , encoding: JSONEncoding.default, headers: header).validate(contentType: ["application/json"]).responseJSON {  response in
            print(parametros)
            switch response.result {
            case .success:
                
                self.fcAlert.FCAlertSegue(titulo: "Bem Vindo", menssagem: "Agora você pode pedir comida em um piscar de olhos.", segue: "cadastradoSegue", controller : self)
                
            case .failure(let error):
                print(error.localizedDescription)
                
                self.fcAlert.FCAlert(titulo: "Opss!", menssagem: "Algo deu errado, tente cadastrar-se mais tarde.", controller : self)
            }
        }
    }
    
    func testTextField( _ textField:UITextField) -> Bool{
        if textField.text == "" || textField.text == nil {
            return false
        }else{
            return true
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.rua.resignFirstResponder()
        self.complemento.resignFirstResponder()
        self.bairro.resignFirstResponder()
        self.cidade.resignFirstResponder()
        self.estado.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.rua.resignFirstResponder()
        self.complemento.resignFirstResponder()
        self.bairro.resignFirstResponder()
        self.cidade.resignFirstResponder()
        self.estado.resignFirstResponder()
        
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.rua.resignFirstResponder()
        self.complemento.resignFirstResponder()
        self.bairro.resignFirstResponder()
        self.cidade.resignFirstResponder()
        self.estado.resignFirstResponder()
    }
    
    func testTextFieldCaracteres( _ textField:UITextField, valorMin:Int, valorMax:Int) -> Bool{
        if ((textField.text?.count)! > valorMin ||  (textField.text?.count)! < valorMax ){
            return false
        }else{
            return true
        }
    }
    
}

