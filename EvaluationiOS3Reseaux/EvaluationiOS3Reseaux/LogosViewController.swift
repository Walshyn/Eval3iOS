//
//  LogosViewController.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 15/09/2022.
//

import UIKit

class LogosViewController: UIViewController {
    private var logos = [Logos]()
    private let apiService = ApiServiceImpl()

    @IBOutlet var logosTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        logosTableView.dataSource = self
        logosTableView.register(UINib(nibName: CryptosLogosCell.identifier, bundle: .main), forCellReuseIdentifier: CryptosLogosCell.identifier)
        
        
        apiService.fetchLogosLessPro { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let logos):
                self.logos = logos.coins
                self.logosTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    


}
extension LogosViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptosLogosCell.identifier, for: indexPath) as? CryptosLogosCell
        else {
            fatalError("Unable to dequeue CryptosLogosCell")
        }
        cell.setup(logos: logos[indexPath.row])
        return cell
    }
}
