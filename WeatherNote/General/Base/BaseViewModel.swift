//
//  BaseViewModel.swift
//  WeatherNote
//
//  Created by Ostap Marchenko on 21.04.2026.
//

import Foundation
import Combine

protocol BaseViewModelType: ObservableObject {
}

class BaseViewModel: BaseViewModelType {
    var cancellables = Set<AnyCancellable>()
    
    deinit {
        print("- \(String(describing: type(of: self))) deinit")
    }
}
