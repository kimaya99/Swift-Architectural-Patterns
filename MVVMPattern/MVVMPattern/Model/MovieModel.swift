//
//  MovieModel.swift
//  MVVMPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import Foundation


class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName:String, trackName:String) {
        self.trackName = trackName
        self.artistName = artistName
    }
}


class ResultsModel: Decodable {
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
}
