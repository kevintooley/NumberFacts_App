//
//  ContentView.swift
//  M5L14_Challenge
//
//  Created by Kevin Tooley on 8/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var factString = "Get some fun facts by pressing button below."
    
    var body: some View {
        
        VStack {
            
            // Downloaded text
            Text(factString)
                .padding()
            
            // Button to get next fact
            Button(action: {
                getFact()
            }, label: {
                Text("Get a fact")
                    .frame(width: 150.0, height: 60.0)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            })
            
            
        }
        
    }
    
    func getFact() {
        
        /*
         String(data: <Data object here>, encoding: .utf8)
         */
        
        // url string
        let urlString = "http://numbersapi.com/random/trivia"
        
        // create url object
        let remoteUrl = URL(string: urlString)
        
        // guard it
        guard remoteUrl != nil else {
            // Something went wrong
            return
        }
        
        // create session
        let session = URLSession.shared
        
        // create dataTask (skipping request)
        let dataTask = session.dataTask(with: remoteUrl!) { data, response, error in
            
            // check if there was an error
            guard error == nil else {
                return
            }
            
            // Because the website feed straight text data, there is no need for a JSON decoder
            factString = String(data: data!, encoding: .utf8)!
            
        }
        
        dataTask.resume()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
