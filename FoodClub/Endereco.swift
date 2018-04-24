//
//  Endereco.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 14/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation


struct Endereco {
    
    var id_enderecos:Int
    var CEP:String
    var bairro:String
    var cidade:String
    var estado:String
    var cpf:String
    var rua:String
    var complemento:String
    
    init(id_enderecos:Int, CEP:String, bairro:String, cidade:String, estado:String, cpf:String, rua:String, complemento:String){
        
        self.id_enderecos = id_enderecos
        self.CEP = CEP
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
        self.cpf = cpf
        self.rua = rua
        self.complemento = complemento
        
    }
    
    init(serializable: [String:Any]) {
        
        self.id_enderecos = serializable["id_enderecos"] as? Int ?? 0
        self.CEP = serializable["CEP"] as? String ?? ""
        self.bairro = serializable["bairro"] as? String ?? ""
        self.cidade = serializable["cidade"] as? String ?? ""
        self.estado = serializable["estado"] as? String ?? ""
        self.cpf = serializable["cpf"] as? String ?? ""
        self.rua = serializable["rua"] as? String ?? ""
        self.complemento = serializable["complemento"] as? String ?? ""
        
    }
    
    func toDict(_ endereco: Endereco) -> [String:Any]{
        let parametros = ["id_enderecos":endereco.id_enderecos,
                          "CEP":endereco.CEP,
                          "bairro":endereco.bairro,
                          "cidade":endereco.cidade,
                          "estado":endereco.estado,
                          "cpf":endereco.cpf,
                          "rua":endereco.rua,
                          "complemento":endereco.complemento]
        as [String : Any]
        return parametros
    }
    
}
