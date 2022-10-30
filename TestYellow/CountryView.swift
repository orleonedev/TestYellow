//
//  CountryView.swift
//  TestYellow
//
//  Created by Oreste Leone on 30/10/22.
//

import SwiftUI

protocol Countries: CaseIterable {
    var name: String {get}
    var image: String {get}
    
    mutating func next()
}

enum EuropeCountries: Int, Countries {
    case italy,spain,france,germany
    
    var name: String {
        switch self {
        case .italy:
            return "Italy"
        case .spain:
            return "Spain"
        case .france:
            return "France"
        case .germany:
            return "Germany"
        }
    }
    
    var image: String {
        switch self {
        case .italy:
            return "🇮🇹"
        case .spain:
            return "🇪🇸"
        case .france:
            return "🇫🇷"
        case .germany:
            return "🇩🇪"
        }
    }
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}

enum AfricaCountries: Int ,Countries {
    case morocco, egypt
    
    var name: String {
        switch self {
        case .morocco:
            return "Morocco"
        case .egypt:
            return "Egypt"
            
        }
    }
    
    var image: String {
        switch self {
        case .morocco:
            return "🇲🇦"
        case .egypt:
            return "🇪🇬"
            
        }
    }
    
    mutating func next() {
        let allCases = type(of: self).allCases
        self = allCases[(allCases.firstIndex(of: self)! + 1) % allCases.count]
    }
}

struct CountryView: View {
    @EnvironmentObject var navhelp: NavHelper
    
    var body: some View {
        ZStack {
            Image(navhelp.currentContinent.name)
                .resizable()
                .scaledToFill()
                .scaleEffect(3.2)
                .offset(x:-240, y: -512)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .ignoresSafeArea()
                        .opacity(0.5)
                    HStack{
                        Button {
                            navhelp.path.removeLast()
                        } label: {
                            Text(navhelp.currentContinent.image)
                                .font(Font.custom("SFPro", size: 58))
                        }.clipShape(Circle())
                            .frame(width: 32, height: 32)
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
                        
                        Text(navhelp.currentCountry.name.uppercased())
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Button {
                            navhelp.currentCountry.next()
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
                
                
                
                
                NavigationLink(value: "Stage1") {
                    Text("📚")
                        .font(Font.custom("SFPro", size: 58))
                }
                .padding()
                .offset(x:-78,y: 16)
                
                
                NavigationLink(value: "Stage2") {
                    Text("🤌")
                        .font(Font.custom("SFPro", size: 58))
                }
                .padding()
                .offset( y:42)
                
                NavigationLink(value: "Stage3") {
                    Text("🍕")
                        .font(Font.custom("SFPro", size: 58))
                }
                .padding()
                .offset(x:98,y:42)
                
                Spacer()
                
                ZStack(alignment: .topLeading){
                    
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.4)
                        .foregroundColor(.black)
                    
                    VStack(alignment: .leading) {
                        Text("Some Info")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        Image(systemName: "crown")
                            .font(.title)
                            .foregroundColor(.yellow)
                        
                    }.padding()
                    
                }
                .frame(height: 128)
                .padding(.horizontal,32)
                .padding(.bottom,64)
                
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView().environmentObject(NavHelper())
    }
}
