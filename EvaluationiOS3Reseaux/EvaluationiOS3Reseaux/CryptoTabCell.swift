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
        
        var priceString = crypto.priceUsd
        var priceDouble = Double(priceString)
        formattingPrice(price: priceDouble!)
        
        var percentString = crypto.changePercent24Hr
        var percentDouble = Double(percentString)
        formattingPrice(price: percentDouble!)
        
        rankLab.text = crypto.rank
        changeLab.text = String(format:"%.2f $", priceDouble!)
        nameLab.text = crypto.name
        percentLab.text = String(format: "%.2f %", percentDouble!)
    }
    
    func formattingPrice(price: Double){
        let price: Double = 12.75311
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        let formattedPrice = formatter.string(from: price as NSNumber)
    }
}
