//
//  LandmarkList.swift
//  Landmarks
//
//  Created by ios dev lab fi unam on 26/01/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
//    @StateObject private var modelData = ModelData()
    @State private var showFavoritesOnly = false
    //var showFavoritesOnly = false
    var filteredLandmarks: [Landmark]{
        modelData.landMarks.filter{landmark in
            (landmark.isFavorite || !showFavoritesOnly)
        }
    }
    
    var body: some View {
        NavigationView {
            
            List{
                
                Toggle(isOn:
                $showFavoritesOnly
                ){
                    Text("FavoritesOnly")
                }
                ForEach(filteredLandmarks){
                    landmark in
                    
                    
                    NavigationLink
                    {LandmarkDetailView(landmark: landmark)
                        
                    }label :{
                        LandmarkRowView(landmark: landmark)
                    }}
            }.navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var modelDta = ModelData()
    static var previews: some View {
        LandmarkList()
            .environmentObject(modelDta)
            //.previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}
