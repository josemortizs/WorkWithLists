//
//  ContentView.swift
//  WorkWithLists
//
//  Created by Jose Manuel Ortiz Sanchez on 9/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var editMode = EditMode.active
    
    @State private var devs = [
        FamousDevelopers(id: 0, name: "Chris Lattner", language: "Swift"),
        FamousDevelopers(id: 1, name: "Brad Cox", language: "Objective-C"),
        FamousDevelopers(id: 2, name: "Dennis Ritchie", language: "C"),
        FamousDevelopers(id: 3, name: "James Gosling", language: "Java"),
        FamousDevelopers(id: 4, name: "Bjarne Stroustrup", language: "C++"),
        FamousDevelopers(id: 5, name: "Guido van Rossum", language: "Python"),
    ]
    
    var body: some View {
        List {
            ForEach(devs) { dev in
                DevView(dev: dev)
                    .hideRowSeparator(background: .white)
            }.onMove(perform: onMove)
        }.padding(.top, 30)
        .listStyle(PlainListStyle())
        .environment(\.editMode, $editMode)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
            devs.move(fromOffsets: source, toOffset: destination)
            // we check re-ordering of the array
            for dev in devs {
                print("\(dev.id) - \(dev.name) - \(dev.language)")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FamousDevelopers: Identifiable {
    let id: Int
    let name: String
    let language: String
}

struct DevView: View {
    
    var dev: FamousDevelopers
    
    var body: some View {
        HStack {
            Text("id: \(dev.id)").padding(.trailing)
            Text(dev.name)
            Spacer()
            Text(dev.language)
        }.padding(.trailing, 15)
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .offset(x: -20)
    }
}
