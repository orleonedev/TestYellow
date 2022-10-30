//
//  StageOneView.swift
//  TestYellow
//
//  Created by Oreste Leone on 30/10/22.
//

import SwiftUI

struct StageView: View {
    @EnvironmentObject var navhelp: NavHelper
    var number: Int
    var body: some View {
        ZStack {
            Image(navhelp.currentContinent.name)
                .resizable()
                .scaledToFill()
                .scaleEffect(3)
                .offset(x:-230, y: -512)
                .ignoresSafeArea()
            Color.black
                .ignoresSafeArea()
                .opacity(0.8)
            Color.blue
                .ignoresSafeArea()
                .opacity(0.5)
            
            VStack {
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .ignoresSafeArea()
                        .opacity(0.5)
                    HStack{
                        Button {
                            navhelp.path.removeLast()
                        } label: {
                            Text(navhelp.currentCountry.image)
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
                        
                        Text("Stage \(number)".uppercased())
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                    }
                }
                .frame(width:512-128+32, height: 64)
                
                NavigationLink(value: "beginner") {
                    ZStack(alignment: .topLeading){
                        
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.4)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading) {
                            Text("Beginner")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.bottom)
                            Image(systemName: "crown")
                                .font(.title)
                                .foregroundColor(.brown)
                            
                        }.padding()
                    }
                }.padding(32)
                
                NavigationLink(value: "Intermediate") {
                    ZStack(alignment: .topLeading){
                        
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.4)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading) {
                            Text("Intermediate")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.bottom)
                            Image(systemName: "crown")
                                .font(.title)
                                .foregroundColor(.gray)
                            
                        }.padding()
                    }
                }.padding(32)
                
                NavigationLink(value: "Hard") {
                    ZStack(alignment: .topLeading){
                        
                        RoundedRectangle(cornerRadius: 20)
                            .opacity(0.4)
                            .foregroundColor(.black)
                        
                        VStack(alignment: .leading) {
                            Text("Hard")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.bottom)
                            Image(systemName: "crown")
                                .font(.title)
                                .foregroundColor(.yellow)
                            
                        }.padding()
                    }
                }.padding(32)
            }.padding(.bottom, 128)
        }
        .toolbar(.hidden)
    }
}

struct StageOneView_Previews: PreviewProvider {
    static var previews: some View {
        StageView(number: 3).environmentObject(NavHelper())
    }
}
