//
//  Prato.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 12/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import Foundation
import UIKit

class Prato {
    var id_cardapio:Int
    var nome: String
    var classificacao:String
    var preco: Double
    var tamanho:String
    var CNPJ:String
    var disponivel: Bool
    var nota:Double
    var imgPrato:UIImage

    
    init(id_cardapio:Int,nome: String, classificacao:String, preco: Double, tamanho:String, CNPJ:String, disponivel: Bool, nota:Double,imgPrato:UIImage) {
        self.id_cardapio = id_cardapio
        self.nome = nome
        self.classificacao = classificacao
        self.preco = preco
        self.tamanho = tamanho
        self.CNPJ = CNPJ
        self.disponivel = disponivel
        self.nota = nota
        self.imgPrato = imgPrato
    }
    
}
