//
//  ApiServiceImpl.swift
//  EvaluationiOS3Reseaux
//
//  Created by Carmelo Arancio on 14/09/2022.
//

import Foundation
import Network
import Alamofire

struct ApiServiceImpl: ApiService {
    func fetchLogosLessPro(completion: @escaping (Result<LogosData, Error>) -> Void) {
        checkNetwork (
            success: {
                let apiURL = URL(string: "https://api.coinstats.app/public/v1/coins?skip=0&currency=EUR")!
                AF.request(apiURL).response { response in
                    switch response.result {
                    case .success(let data):
                        guard let data = data else { return }
                        
                        do {
                            let logos = try JSONDecoder().decode(LogosData.self, from: data)
                            completion(.success(logos))
                        } catch {
                            print(error)
                            completion(.failure(error))
                        }
                    case .failure(let error):
                        print(error)
                        completion(.failure(error))
                    }
                }
            },
            failure: {
                print("No network")
            }
            )
    }
    
    private let monitor = NWPathMonitor()
    
    func fetchCryptos(completion: @escaping (Swift.Result<[Crypto], AFError>) -> Void) {
        checkNetwork(
            success: {
                let apiURL = URL(string: "https://api.coincap.io/v2/assets")!
                AF.request(apiURL).responseDecodable(of: [Crypto].self) {
                    completion($0.result)}
            },
            failure: {
                print("No network")
            })
    }
    
    func fetchCryptosLessPro(completion: @escaping (Result<CryptoData, Error>) -> Void) {
        checkNetwork (
        success: {
            let apiURL = URL(string: "https://api.coincap.io/v2/assets")!
            AF.request(apiURL).response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else { return }
                    
                    do {
                        let cryptos = try JSONDecoder().decode(CryptoData.self, from: data)
                        completion(.success(cryptos))
                    } catch {
                        print(error)
                        completion(.failure(error))
                    }
                case .failure(let error):
                    print(error)
                    completion(.failure(error))
                }
            }
        },
        failure: {
            print("No network")
        }
        )
    }
    
    private func checkNetwork(success: @escaping () -> Void, failure: @escaping () -> Void) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                success()
            } else {
                failure()
            }
        }
        monitor.start(queue: .global())
    }
}
