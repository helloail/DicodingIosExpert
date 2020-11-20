//
//  DetailPresenter.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 04/11/20.
//

import SwiftUI
import Combine
import MapKit

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    
    private var cancellables: Set<AnyCancellable> = []

    @Published var place: PlaceModel
    
    @Published private(set) var state = LoadedStateHelper.idle

    init(detailUseCase: DetailUseCase) {
      self.detailUseCase = detailUseCase
        place = detailUseCase.getPlace()
    }
    
    func updateFavoriteMeal() {
        state = .loading
        detailUseCase.updateFavoriteMeal()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.state = .error(error)
                case .finished:
                    self.state = .loaded
                }
            }, receiveValue: { place in
                self.place = place
            })
            .store(in: &cancellables)
    }
    
}
