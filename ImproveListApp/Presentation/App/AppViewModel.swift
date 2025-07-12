//
//  AppViewModel.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine

struct AppViewModel {
    let navigator: AppNavigatorType
}

extension AppViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    final class Output: ObservableObject {
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .sink(receiveValue: navigator.toMain)
            .store(in: cancelBag)
        
        return output
    }
}
