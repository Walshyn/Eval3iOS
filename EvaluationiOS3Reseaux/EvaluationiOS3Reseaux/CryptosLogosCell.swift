//
//  CryptosLogosCell.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 15/09/2022.
//

import UIKit
import AlamofireImage

class CryptosLogosCell: UITableViewCell {
    static let identifier = "CryptosLogosCell"
    @IBOutlet weak var CryptoLog: UIImageView!
    @IBOutlet weak var CryptoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setup(logos: Logos) {
        if let imageURL = logos.icon,
           let url = URL(string: imageURL) {
            CryptoLog.af.setImage(withURL: url)
            CryptoLabel.text = logos.name
        } else {
            CryptoLog.isHidden = true
           
        }
        
    }
    /*override func prepareForReuse() {
        super.prepareForReuse()
        
        CryptoLog.af.cancelImageRequest()
        CryptoLog.image = nil
        CryptoLog.isHidden = false
    }*/
}
