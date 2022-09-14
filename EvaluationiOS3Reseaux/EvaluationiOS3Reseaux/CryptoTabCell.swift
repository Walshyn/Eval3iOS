//
//  CryptoTabCell.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 14/09/2022.
//

import UIKit

class CryptoTabCell: UITableViewCell {
    @IBOutlet var rankLab: UILabel!
    @IBOutlet var changeLab: UILabel!
    @IBOutlet var nameLab: UILabel!
    @IBOutlet var percentLab: UILabel!
    static let identifier = "CryptoTabCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(crypto: Crypto) {
        rankLab.text = crypto.rank
        changeLab.text = crypto.priceUsd
        nameLab.text = crypto.name
        percentLab.text = crypto.changePercent24Hr
    }
}
