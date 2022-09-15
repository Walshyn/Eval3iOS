//
//  CryptosLogosCell.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 15/09/2022.
//

import UIKit

class CryptosLogosCell: UITableViewCell {
    static let identifier = "CryptosLogosCell"
    @IBOutlet var CryptoLog: UIImageView!
    @IBOutlet var CryptoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(logos: Logos) {
        CryptoLog.image = UIImage(named: logos.icon)
        CryptoLabel.text = logos.name
    }
    
}
