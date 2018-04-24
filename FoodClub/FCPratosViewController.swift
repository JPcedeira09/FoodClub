//
//  FCPratosViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 12/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit

class FCPratosViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var pratos : [Prato]?
    
    var prato1 = Prato(id_cardapio: 1, nome: "salada com hamburguer", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9229")!)
    var prato2 = Prato(id_cardapio: 1, nome: "salada cesar", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9235")!)
    var prato3 = Prato(id_cardapio: 1, nome: "salada com frango", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9266")!)
    var prato4 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9257")!)
        var prato5 = Prato(id_cardapio: 1, nome: "salada com carne", classificacao: "Saladas", preco: 16.90, tamanho: "medio", CNPJ: "333.333.333-90", disponivel: true, nota: 5.0, imgPrato: UIImage(named:"IMG_9259")!)
  
    @IBAction func dissmisButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confBar()
        
        let mockpratos = [self.prato1, self.prato2, self.prato3, self.prato4,self.prato5]
        
        self.pratos = mockpratos
        
        self.table.delegate = self
        self.table.dataSource = self
        self.table.register(UINib(nibName: "FCPratosListTableViewCell", bundle: nil), forCellReuseIdentifier: "FCPratosCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func confBar(){
        UITabBar.appearance().isOpaque = false
        UITabBar.appearance().barTintColor = UIColor.black
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FCPratosViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (pratos?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCPratosCell", for: indexPath) as! FCPratosListTableViewCell
        
        let pratosIndex = self.pratos![indexPath.row]
        
        cell.nome.text = pratosIndex.nome
        cell.nota.text = String(pratosIndex.nota)
        cell.foto_prato.image = pratosIndex.imgPrato
        cell.preco.text = "R$"+String(pratosIndex.preco)
        cell.classificacao.text = pratosIndex.classificacao
        cell.tamanho.text = "tamanho "+pratosIndex.tamanho
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "segueInfoPrato", sender: nil)
    }

}
