//
//  Menu.swift
//  Food App
//
//  Created by Balaji on 26/10/20.
//

import SwiftUI

struct Menu: View {
    @ObservedObject var homeData : HomeViewModel
    @StateObject var model = ModelData()
    
    var body: some View {
        
        VStack{
            NavigationView{
            NavigationLink(destination: CartView(homeData: homeData)) {
                
                HStack(spacing: 15){
                    
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(Color.green)
                    
                    Text("Cart")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    
                    Spacer(minLength: 0)
                }
                .padding()
            
            }
            }
            Spacer()
            
            HStack{
                
                Spacer()
                
                Text("Version 0")
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                
                Button(action:{model.status = false}){
                    Text("log out")
                }
            }
            .padding(10)
        }
        .padding([.top,.trailing])
        .frame(width: UIScreen.main.bounds.width / 1.6)
        .background(Color.white.ignoresSafeArea())
    }
}

