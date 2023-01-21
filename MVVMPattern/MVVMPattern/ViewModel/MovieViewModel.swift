//
//  MovieViewModel.swift
//  MVVMPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import UIKit


class MovieViewModel: NSObject {
    var artistName: String?
    var trackName: String?
    
    
    // Dependency injection
    init(movie: MovieModel) {
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
