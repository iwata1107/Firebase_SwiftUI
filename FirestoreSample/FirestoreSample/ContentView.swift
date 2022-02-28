//
//  ContentView.swift
//  FirestoreSample
//
//  Created by 岩田照太 on 2022/01/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    
    @State var name = ""
    @State var notes = ""
    
    var body: some View {
        VStack{
            List(model.list) {item in
                
                HStack{
                    Text(item.name)
                    Spacer()
                    
                    //Update button
                    Button(action: {
                        model.updateData(todoToUpdate: item)
                        //Delete todo
                    }, label: {
                        Image(systemName: "pencil")
                    }).buttonStyle(BorderedButtonStyle())
                    
                    // Delete button
                    Button(action: {
                        model.deleteData(todoToDelete: item)
                        //Delete todo
                    }, label: {
                        Image(systemName: "minus.circle")
                    }).buttonStyle(BorderedButtonStyle())
                }
                
            }
            
            Divider()
            VStack{
                TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Note", text: $notes).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    //Call add data
                    model.addData(name: name, notes: notes)
                    
                    //Clear the text fields
                    name = ""
                    notes = ""
                    
                }, label: {
                    Text("Add Todo Item")
                })
            }
        }.padding()
    }
    init() {
        model.getData()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
