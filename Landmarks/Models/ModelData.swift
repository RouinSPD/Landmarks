//
//  ModelData.swift
//  Landmarks
//
//  Created by iOS Development Lab FI UNAM on 25/01/23.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var landMarks: [Landmark] = load("landmarkData.json")
    
    var categories: [String: [Landmark]]{
        Dictionary(
            grouping: landMarks, by: {$0.category.rawValue})
    }
    
    var features: [Landmark]{
        landMarks.filter({ $0.isFeatured})
    }
}



func load<T: Decodable>(_ filename: String) ->T {
    //1. leemos archivo
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("No se encontró el siguiente nombre de archivo \(filename)")
    }
    
    //2. cargamos la data
    do{
        data = try Data(contentsOf: file )
    }catch{
        fatalError("No se pudo cargar la data: \(error)")
    }
    //3. decodificamos
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("No se pudo decodificar la información como \(T.self)")
    }
}
