//
//  PhotoListViewModel.swift
//  MVVMPlayground
//
//  Created by Neo on 03/10/2017.
//  Copyright © 2017 ST.Huang. All rights reserved.
//

import Foundation

class PhotoListViewModel {
    
    let apiService: APIServiceProtocol

    private var photos: [Photo] = [Photo]()

    init( apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    func initFetch() {
        apiService.fetchPopularPhoto { [weak self] (success, photos, error) in
            if let error = error {
            } else {
                
            }
        }
    }
    
}



struct PhotoListCellViewModel {
    let titleText: String
    let descText: String
    let imageUrl: String
    let dateText: String
}
