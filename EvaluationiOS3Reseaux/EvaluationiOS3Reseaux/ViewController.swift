//
//  ViewController.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 14/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private var cryptos = [Crypto]()
    private let apiService = ApiServiceImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: CryptoTabCell.identifier, bundle: .main), forCellReuseIdentifier: CryptoTabCell.identifier)
        
        
       /* apiService.fetchCryptosl { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let cryptos):
                self.cryptos = cryptos
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }*/
        apiService.fetchCryptosLessPro { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let cryptos):
                self.cryptos = cryptos.data
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
   
}




extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTabCell.identifier, for: indexPath) as? CryptoTabCell
        else {
            fatalError("Unable to dequeue CryptoTabCell")
        }
        cell.setup(crypto: cryptos[indexPath.row])
        return cell
    }
}
