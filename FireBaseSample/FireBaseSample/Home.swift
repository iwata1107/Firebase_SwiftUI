//
//  Home.swift
//  FireBaseSample
//
//  Created by 岩田照太 on 2021/06/03.
//

import SwiftUI

struct Home: View {
    
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing: 10){
                
                HStack(spacing: 15){
                    

                    Button(action: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    }, label: {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(Color.pink)
                    })
                    
                    Text(HomeModel.userLocation == nil ? "位置..." : "お届け先")
                        .foregroundColor(.black)
                    
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                    
                    Spacer(minLength: 0)
 
                }
                .padding([.horizontal,.top])
                
                Divider()
                
                HStack(spacing: 15){
                    
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("検索", text: $HomeModel.search)
                    
                }
                .padding(.horizontal)
                .padding(.top,10)
                
                Divider()
                
                if HomeModel.items.isEmpty{
                    
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                }
                else{
                    
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        VStack(spacing: 25){
                            
                            ForEach(HomeModel.filtered){item in
                                
                                // Item View...
                                
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                    
                                    ItemView(item: item)
                                    
                                    HStack{
                                        
                                        Text("配送料無料")
                                            .foregroundColor(.blue)
                                            .padding(.vertical,10)
                                            .padding(.horizontal)
                                            .background(Color.pink)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                           HomeModel.addToCart(item: item)
                                        }, label: {
                                            
                                            Image(systemName: item.isAdded ? "checkmark" : "plus")
                                                .foregroundColor(.blue)
                                                .padding(10)
                                                .background(item.isAdded ? Color.green : Color.pink)
                                                .clipShape(Circle())
                                        })
                                    }
                                    .padding(.trailing,10)
                                    .padding(.top,10)
                                        
                                })
                                .frame(width: UIScreen.main.bounds.width - 30)
                            }
                        }
                        .padding(.top,10)
                    })
                }
            }
            
            // Side Menu.....
            
            HStack{
                
                Menu(homeData: HomeModel)
                    // Move Effect From Left....
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: 0)
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                // clsing when Taps on outside...
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
            )
            
            // Non CLosable ALert If Permission Denied....
        
            if HomeModel.noLocation{
                
                Text("Please Enable Location Access In Settings To Further Move On !!!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
            }
 
        }
        
        .onAppear(perform: {
            
            // calling location delegate....
            HomeModel.locationManager.delegate = HomeModel
            print("もももっっもっっも")
        })
 
        .onChange(of: HomeModel.search, perform: { value in
            
            // to avoid Continues Search requests....
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                if value == HomeModel.search && HomeModel.search != ""{
                    
                    // Search Data....
                    
                    HomeModel.filterData()
                }
            }
            
            if HomeModel.search == ""{
                // reset all data....
                withAnimation(.linear){HomeModel.filtered = HomeModel.items}
            }
        })
        
    }
}
 

