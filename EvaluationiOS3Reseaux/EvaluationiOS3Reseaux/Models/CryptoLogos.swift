//
//  CryptoLogos.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 15/09/2022.
//

import Foundation

struct LogosData: Codable {
    let coins: [Logos]
}

struct Logos: Codable {
    var name: String
    var icon: String?
}
