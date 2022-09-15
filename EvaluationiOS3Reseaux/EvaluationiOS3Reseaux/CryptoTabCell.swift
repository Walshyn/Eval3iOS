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
        
        let priceString = crypto.priceUsd
        let priceDouble = Double(priceString)
        
        let percentString = crypto.changePercent24Hr
        let percentDouble = Double(percentString)
        
        rankLab.text = crypto.rank
        changeLab.text = formattingPrice(price: priceDouble!)
        nameLab.text = crypto.name
        percentLab.text = formattingPercent(percent: percentDouble!)
    }
    
    func formattingPrice(price: Double) -> String?{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        let formattedPrice = formatter.string(from: price as NSNumber)
        return formattedPrice
    }
    
    func formattingPercent(percent: Double) -> String?{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        
        let formattedPercent = formatter.string(from: percent as NSNumber)
        return formattedPercent
    }
}
