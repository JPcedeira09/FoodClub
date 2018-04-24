//
//  Cliente.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 05/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation


struct Cliente {
    
     var cpf:String
     var nome:String
     var senha:String
     var cel:String
     var telefone:String
     var email:String
     var endereco : Endereco
    
    init(cpf:String,nome:String,senha:String,cel:String,telefone:String,email:String, endereco:Endereco) {
        self.cpf = cpf
        self.nome = nome
        self.senha = senha
        self.cel = cel
        self.telefone = telefone
        self.email = email
        self.endereco = endereco
    }
    
    init(serializable: [String:Any]) {
        
        self.cpf = serializable["cpf"] as? String ?? ""
        self.nome = serializable["nome"] as? String ?? ""
        self.senha = serializable["senha"] as? String ?? ""
        self.cel = serializable["cel"] as? String ?? ""
        self.telefone = serializable["telefone"] as? String ?? ""
        self.email = serializable["email"] as? String ?? ""
        self.endereco = Endereco(serializable: serializable["endereco"] as? [String : Any] ?? [:])
    }
    
    func toDict(_ cliente: Cliente) -> [String:Any]{
        
        let parametros = ["cpf":cliente.cpf,
                          "nome":cliente.nome,
                          "senha":cliente.senha,
                          "cel":cliente.cel,
                          "telefone":cliente.telefone,
                          "email":cliente.email,
                          "endereco": endereco.toDict(cliente.endereco)
                          ] as [String : Any]
        return parametros
    }
    
    
}
