//
//  PredatorDetailView.swift
//  JPApexPredators
//
//  Created by Sudha Rani on 31/05/25.
//

import SwiftUI
import MapKit

struct PredatorDetailView: View {
    let predator: ApexPredator
    @State var position: MapCameraPosition

    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    // Background Image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8), Gradient.Stop(color: .black, location: 1)], startPoint: .top, endPoint: .bottom)
                        }
                    
                    
                    
                    // Dino Image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    
                    // Dino Name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    // Current Location
                    NavigationLink {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                    } label: {
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)
                        }
                        .frame(height: 125)
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading, .bottom])
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
  
                    //Appears in
                    Text("Appears in:-")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    
                    //Movie Moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .font(.footnote)
                            .padding(.bottom, 15)
                    }
                    
                    // Link to webpage
                    Text("Read More")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
                

            }
        }
        .ignoresSafeArea()
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = Predators().apexPredators[2]
    PredatorDetailView(predator: predator,
                       position: .camera(
                        MapCamera(centerCoordinate: predator.location,
                                  distance: 30000)
                       ))
}
