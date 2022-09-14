//
//  Crypto.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 14/09/2022.
//

import Foundation

struct CryptoData: Codable {
    let data: [Crypto]
}


struct Crypto: Codable {
    var name: String
    var rank: String
    var priceUsd: String
    var changePercent24Hr: String
    
}
