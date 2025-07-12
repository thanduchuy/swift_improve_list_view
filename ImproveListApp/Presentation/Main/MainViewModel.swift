//
//  MainViewModel.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine
import Factory
import UIKit

struct MainViewModel {
    let navigator: MainNavigatorType
    @Injected(\.listUseCase) var listUseCase
}

extension MainViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
        @Published var alertErrorMessage = ""
        @Published var isLoading = false
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let loadingTracker = ActivityTracker()
        let errorTracker = ErrorTracker()
        
        input.loadTrigger
            .map {
                listUseCase.getCompanies()
                    .trackError(errorTracker)
                    .trackActivity(loadingTracker)
                    .asDriver()
            }
            .switchToLatest()
            .sink(receiveValue: {
                print("************", $0)
            })
            .store(in: cancelBag)
        
        loadingTracker.loading
            .receive(on: DispatchQueue.main)
            .assign(to: \.isLoading, on: output)
            .store(in: cancelBag)
        
        errorTracker
            .receive(on: DispatchQueue.main)
            .map { $0.localizedDescription }
            .assign(to: \.alertErrorMessage, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
