//
//  GenericResponse.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 05/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation

class Cliente {
    
    var cpf:String
    var nome:String
    var senha:String
    var telefone:String
    var cel:String
    var email:String
    
    init(cpf:String, nome:String, senha:String, telefone:String, cel:String, email:String) {
        self.cpf = cpf
        self.nome = nome
        self.senha = senha
        self.telefone = telefone
        self.cel = cel
        self.email = email
    }
    
    
}
