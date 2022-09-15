//
//  ApiService.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 14/09/2022.
//

import Foundation
import Alamofire

protocol ApiService {
    func fetchCryptos(completion: @escaping (Swift.Result<[Crypto], AFError>) -> Void)
    func fetchCryptosLessPro(completion: @escaping (_ result: Result<CryptoData, Error>) -> Void)
    
    func fetchLogosLessPro(completion: @escaping (_ result: Result<LogosData, Error>) -> Void)
}
