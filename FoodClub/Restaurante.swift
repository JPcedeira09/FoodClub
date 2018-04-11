//
//  Restaurante.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 09/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation
import UIKit

struct Restaurante {
    
    var CNPJ:String
    var nome:String
    var classificacao:String
    var senha:String
    var telefone:String
    var email:String
    var entrega:Int
    var avaliacao:Double
    var imgViewLogo:UIImage
    
    
    init(CNPJ:String, nome:String, classificacao:String, senha:String, telefone:String, email:String, entrega:Int,avaliacao:Double,imgViewLogo: UIImage) {
        self.CNPJ = CNPJ
        self.nome = nome
        self.classificacao = classificacao
        self.senha = senha
        self.telefone = telefone
        self.email = email
        self.entrega = entrega
        self.avaliacao = avaliacao
        self.imgViewLogo = imgViewLogo
    }
    
    
    init( serializable: [String:Any]) {
        
        self.CNPJ = serializable["CNPJ"] as? String ?? ""
        self.nome = serializable["nome"] as? String ?? ""
        self.classificacao = serializable["classificacao"] as? String ?? ""
        self.senha = serializable["senha"] as? String ?? ""
        self.telefone = serializable["telefone"] as? String ?? ""
        self.email = serializable["email"] as? String ?? ""
        self.entrega = serializable["entrega"] as? Int ?? 0
        self.avaliacao = serializable["avaliacao"] as? Double ?? 0.0
        self.imgViewLogo = serializable[""] as? UIImage ?? UIImage()
        
    }
    
    func toDict(_ restaurante: Restaurante) -> [String:Any]{
        
        let parametros = ["CNPJ":restaurante.CNPJ, "nome":restaurante.nome, "classificacao":restaurante.classificacao, "senha":restaurante.senha, "telefone":restaurante.telefone, "email":restaurante.email, "entrega":restaurante.entrega, "avaliacao":restaurante.avaliacao, "imgViewLogo":restaurante.imgViewLogo] as [String : Any]
        
        return parametros
    }

}
