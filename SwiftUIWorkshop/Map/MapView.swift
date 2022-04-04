//
//  MapView.swift
//  SwiftUIWorkshop
//
//  Created by Moon Jongseek on 2022/04/04.
//

import SwiftUI
import MapKit

// 36.014279, 129.325785

struct PinModel: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State var pinModels: [PinModel] = [
        PinModel(coordinate: .init(latitude: 36.014279, longitude: 129.325785))
    ]
    
    @State var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 36.014279,
            longitude: 129.325785
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005)
    )
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: self.$coordinateRegion, annotationItems: self.pinModels) { pinModel in
                MapPin(coordinate: pinModel.coordinate, tint: .accentColor)
            }
            MapButtonView()
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
