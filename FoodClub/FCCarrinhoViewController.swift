//
//  FCCarrinhoViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 25/04/2018.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCCarrinhoViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    
    var pratos : [Prato] = []
    
    @IBOutlet weak var ViewPedidos: UIView!
    @IBOutlet weak var ViewPagamento: UIView!
    @IBOutlet weak var enderecoText: UILabel!
    @IBOutlet weak var EnderecoComplementoTxt: UILabel!
    @IBOutlet weak var taxaEntregatxt: UILabel!
    @IBOutlet weak var tablePedidos: UITableView!
    @IBOutlet weak var totalEntregatxt: UILabel!
    
    @IBAction func EscolherCPJNota(_ sender: UIButton) {
    }
    @IBAction func EscolherPagamento(_ sender: UIButton) {
    }
    @IBAction func adicionarPedidos(_ sender: UIButton) {
    }
    @IBAction func FazerPedido(_ sender: UIButton) {
    }
    
    var prato1 = Prato(id_cardapio: 1, nome: "salada com hamburguer", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9229")!, quantidade: 1)
    var prato2 = Prato(id_cardapio: 1, nome: "salada cesar", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9235")!, quantidade: 1)
    var prato3 = Prato(id_cardapio: 1, nome: "salada com frango", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9266")!, quantidade: 1)
    var prato4 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9257")!, quantidade: 3)
    var prato5 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9259")!, quantidade: 1)
    var prato6 = Prato(id_cardapio: 1, nome: "salada com frango", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9266")!, quantidade: 1)
    var prato7 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9257")!, quantidade: 3)
    var prato8 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9259")!, quantidade: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mockpratos = [self.prato1, self.prato2, self.prato3, self.prato4,self.prato5, self.prato6, self.prato7,self.prato8]
        
        ViewPedidos.layer.cornerRadius = 5
        ViewPagamento.layer.cornerRadius = 5
   
        self.pratos = mockpratos
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UINib(nibName: "FCPedidosTableViewCell", bundle: nil), forCellReuseIdentifier: "FCPedidosTableViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension FCCarrinhoViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pratos.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCPedidosTableViewCell", for: indexPath) as! FCPedidosTableViewCell
        
        let pratosIndex = self.pratos[indexPath.row]
        
        cell.nomePrato.text = pratosIndex.nome
        cell.precoPrato.text = String(Double(pratosIndex.quantidade) * pratosIndex.preco)
        
       var quantidade = String(pratosIndex.quantidade)
        cell.quantidade.text = "\(quantidade) x"
        
        return cell
    }
    
    
}

