//
//  ContentView.swift
//  demo
//
//  Created by 32 Technologies on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack{
                NavigationLink(destination: SignupView(), label:{
                    VStack {
                        Image(systemName: "globe")
                            .imageScale(.large)
                            .foregroundColor(.accentColor)
                        Text("Hello, world!")
                    }
                    .padding()
                } )
                NavigationLink(destination: LoginView(), label: {Text("Hi")})
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
