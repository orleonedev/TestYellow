//
//  ContentView.swift
//  TestYellow
//
//  Created by Oreste Leone on 30/10/22.
//

import SwiftUI

enum Continents: Int, CaseIterable {
    case europe, africa, asia, America
    
    var name: String {
        switch self {
        case .europe:
            return "Europe"
        case .africa:
            return "Africa"
        case .asia:
            return "Asia"
        case .America:
            return "America"
        
        }
    }
    
    var image: String {
        switch self {
        case .europe:
            return "🇪🇺"
        case .africa:
            return "🌍"
        case .asia:
            return "🌏"
        case .America:
            return "🌎"
        
        }
    }
    
    mutating func next() {
            let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
        }
}


struct ContinentView: View {
    @EnvironmentObject var navhelp: NavHelper
    
    var body: some View {
        NavigationStack(path: $navhelp.path) {
            ZStack {
                Image(navhelp.currentContinent.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .ignoresSafeArea()
                
                VStack {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .ignoresSafeArea()
                            .opacity(0.5)
                        HStack{
                            Spacer()
                            Button {} label: {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .foregroundColor(.yellow)
                                    .frame(width: 32 ,height: 32)
                            }
                        }
                        .padding(.horizontal,32)
                        
                        HStack{
                            Button {} label: {
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.cyan)
                                    
                            }
                            .padding(10)
                            .background(.white.opacity(0.1))
                            .frame(width: 32,height: 32)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                            Text(navhelp.currentContinent.name.uppercased())
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Button {
                                navhelp.currentContinent.next()
                                switch navhelp.currentContinent {
                                case .europe:
                                    navhelp.currentCountry = EuropeCountries.italy
                                case .africa:
                                    navhelp.currentCountry = AfricaCountries.morocco
                                case .asia:
                                    navhelp.currentCountry = EuropeCountries.germany
                                case .America:
                                    navhelp.currentCountry = EuropeCountries.germany
                                }
                            } label: {
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundColor(.cyan)
                                    
                            }
                            .padding(10)
                            .background(.white.opacity(0.1))
                            .frame(width: 32,height: 32)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        
                            
                    }
                    .frame(width:512-128+32, height: 64)
                    
                    Spacer()
                    
                    NavigationLink(value: navhelp.currentContinent.name){
                        Text("Explore")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(8)
                            .padding(.horizontal,64)
                            .background(.teal.opacity(0.8))
                    }.clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                .padding(.top, 32)
                .padding(.bottom, 64)
            }
            
            .navigationDestination(for: String.self) {next in
                switch next {
                case navhelp.currentContinent.name:
                    CountryView()
                case "Stage1":
                    StageView(number: 1)
                case "Stage2":
                    StageView(number: 2)
                case "Stage3":
                    StageView(number: 3)
                default:
                    Text("wops")
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContinentView().environmentObject(NavHelper())
    }
}
