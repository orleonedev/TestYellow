//
//  TestYellowApp.swift
//  TestYellow
//
//  Created by Oreste Leone on 30/10/22.
//

import SwiftUI

@main
struct TestYellowApp: App {
    @StateObject var navhelp: NavHelper = NavHelper()
    var body: some Scene {
        WindowGroup {
            ContinentView().environmentObject(navhelp)
        }
    }
}
