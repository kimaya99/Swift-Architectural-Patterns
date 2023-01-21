//
//  Service.swift
//  MVVMPattern
//
//  Created by Kimaya Desai on 12/20/22.
//
//  https://itunes.apple.com/search?media=music&term=bollywood
import UIKit

class Service: NSObject {
    
    static let shareInstance = Service()
    
    func getAllMovieData(completion: @escaping([MovieModel]?, Error?) -> ()) {
        let urlStr = "https://itunes.apple.com/search?media=music&term=bollywood"
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
               completion(nil, err)
                print("Loading data error")
            } else {
                guard let data = data else { return }
                do {
                    var arrMoviewData = [MovieModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for movie in results.results {
                        arrMoviewData.append(MovieModel(artistName: movie.artistName!, trackName: movie.trackName!))
                    }
                    completion(arrMoviewData, nil)
                } catch let jsonErr {
                    print("json error \(jsonErr)")
                }
            }
        }.resume()
    }
    
}
