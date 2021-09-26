//
//  ContentView.swift
//  Labz
//
//  Created by user203110 on 9/25/21.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State var results = [Pokedata]()
    @State var textFieldText = ""
    var body: some View {
        
        VStack(alignment: .leading) {

            TextField("Search Pokemon", text: $textFieldText, onCommit: {
                loadData(pokename: self.textFieldText)
                print(self.textFieldText)
            }).textCase(.lowercase)
                         
            if results.count > 0 {
                List(results, id: \.ids) { item in
                    VStack(alignment: .leading) {
                        KFImage(URL(string: item.images.small))
                        Text(item.id)
                        Text(item.name)
                        Text(item.supertype)
                        
                        
                    }
                }
            }else{
                Text("No hay resultados para esa busqueda")
            }
            
            
        }
        

    }
    
    func loadData(pokename: String) {

        guard let url = URL(string: "https://api.pokemontcg.io/v2/cards?q=name:"+pokename) else {
            print("Your API end point is Invalid")
            return
        }
    let request = URLRequest(url: url)
    // The shared singleton session object.
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let data = data {
            if let response = try? JSONDecoder().decode(Pokecard.self, from: data) {
                DispatchQueue.main.async {
                    self.results = response.data
    
                }
                return
            }
        }
    }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
