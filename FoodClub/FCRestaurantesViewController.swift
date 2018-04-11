//
//  FCRestaurantesViewController.swift
//  FoodClub
//
//  Created by João Paulo  Tieles on 09/03/18.
//  Copyright © 2018 João Paulo  Tieles. All rights reserved.
//

import UIKit
import Alamofire


class FCRestaurantesViewController: UIViewController {
    
    let restaurante1 = Restaurante(CNPJ: "444.444.444-09", nome: "Pacheco Peixes", classificacao: "Frutos do Mar", senha: "123456", telefone: "(11)4232-3142", email: "zup.com.br", entrega: 1, avaliacao: 4.8, imgViewLogo: #imageLiteral(resourceName: "frutos_do_mar"))
    
    let restaurante2 = Restaurante(CNPJ: "555.555.555-55", nome: "The Fifties", classificacao: "Lanches", senha: "123456", telefone: "(11)9748-5353", email: "uol.com.br", entrega: 1, avaliacao: 3.8, imgViewLogo: #imageLiteral(resourceName: "the_fifties"))
    
    let restaurante3 = Restaurante(CNPJ: "666.666.999-69", nome: "America", classificacao: "Diversos", senha: "9910798", telefone: "(11)99748-5353", email: "yahool.com.br", entrega: 0, avaliacao: 4.7, imgViewLogo: #imageLiteral(resourceName: "america"))
    
    let restaurante4 = Restaurante(CNPJ: "111.111.111-11", nome: "Vai de Salada", classificacao: "Fit", senha: "545454", telefone: "(11)99107-2909", email: "gmal.com.br", entrega: 1, avaliacao: 5.0, imgViewLogo: #imageLiteral(resourceName: "vai_de_salada"))
    
    
    
    @IBOutlet weak var tableViewRestaurantes: UITableView!
    
    var restaurantes:[Restaurante]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        confBar()
        getRestaurantes()
        
        let mockRestaurantes = [self.restaurante1, self.restaurante2, self.restaurante3, self.restaurante4]
        
        self.restaurantes = mockRestaurantes
        
        self.tableViewRestaurantes.delegate = self
        self.tableViewRestaurantes.dataSource = self
        self.tableViewRestaurantes.register(UINib(nibName: "FCRestauranteListTableViewCell", bundle: nil), forCellReuseIdentifier: "FCRestauranteCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func getRestaurantes(){
        let urlRequest = URL(string:  "http://localhost:8080/food2abcapi/rest/listarrest")
        
        // print("\n /n INFO: URL:\(urlRequest)\n /n ")
        let header = ["Content-Type" : "application/json"]
        Alamofire.request(urlRequest!, method: HTTPMethod.get,headers : header).responseJSON { (response) in
            if(response.result.isSuccess){
                print(response)
                if let json = response.result.value as? [[String : AnyObject]]{
                    
                    for response in json {
                        let restaurnte = Restaurante(serializable: response)
                        print(restaurnte)
                    }
                    // var restaurantes = json
                    // var mbUser: MBUserInside = MBUserInside(from: json)
                    
                }
            }else{
                print("INFO: ERROR ON REQUEST GET Restaurantes - \(response.error?.localizedDescription)")
            }
            
        }
    }
    
    
    func confBar(){
        UITabBar.appearance().isOpaque = false
        UITabBar.appearance().barTintColor = UIColor.black
        
    }
}

extension FCRestaurantesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (restaurantes?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FCRestauranteCell", for: indexPath) as! FCRestauranteListTableViewCell
        
        let restaurantesIndex = self.restaurantes![indexPath.row]
        
        cell.avaliacao.text = String(restaurantesIndex.avaliacao)
        cell.categoria.text = restaurantesIndex.classificacao
        cell.foto_restaurante.image = restaurantesIndex.imgViewLogo
        cell.nome_restaurante.text = restaurantesIndex.nome
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "seguePratos", sender: nil)
    }
}
