//
//  NavHelper.swift
//  TestYellow
//
//  Created by Oreste Leone on 30/10/22.
//

import Foundation
import SwiftUI

class NavHelper: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var currentContinent: Continents = Continents.europe
    @Published var currentCountry: any Countries = EuropeCountries.italy
    
}
