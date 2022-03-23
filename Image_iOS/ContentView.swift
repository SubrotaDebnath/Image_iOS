//
//  ContentView.swift
//  Image_iOS
//
//  Created by Subrota Debnath on 24/3/22.
//

import SwiftUI

extension Image{
    func imageModifier () ->some View{
        self
            .scaledToFit()
    }
    
    func iconModifier () -> some View{
        self
            .resizable()
            .imageModifier()
            .frame(maxWidth:128)
            .foregroundColor(.orange)
            .opacity(0.9)
        
    }
}

struct ContentView: View {
    
    private let imageUrl: String = "https://avatars.githubusercontent.com/u/25770704?v=4"
    var body: some View {
      //MARK:- 1. BASIC ASYNC IMAGE
        
//        AsyncImage(url: URL(string: imageUrl))
        
        //MARK:- 2. SCALE OF A ASYNC IMAGE
        
//        AsyncImage(url: URL(string: imageUrl), scale: 0.55)
        
        //MARK:- 3. CUSTOM PLACEHOLDER OF A ASYNC IMAGE
        
//        AsyncImage(url: URL(string: imageUrl), scale: 0.55){
//            image in image.imageModifier()
//
//        }placeholder: {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//
        
        //MARK:- 4. PHASE ASYNC IMAGE FORM INTERNET
        
//        AsyncImage(url: URL(string: imageUrl),scale: 0.55){phase in
//             //SUCESS: THE IMAGE LOADED SUCESSFULLY
//            //FAILURE: THE IMAGE FAIL TO LOAD WITH ERROR
//            //EMPTY: NO IMAGE IS LOADED
//
//            if  let image = phase.image{
//                image.imageModifier()
//            }else if (phase.error != nil) {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            }else{
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
        
    //MARK:- 5. ANIMATIONS FOR ASYNC IMAGE
        
        AsyncImage(
            url: URL(string: imageUrl),
            scale: 0.55,
            transaction: Transaction(
                animation: .spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0.25
                )
        )){
            phase in
            switch phase{
            case .success(let image):
                image
                    .imageModifier()
                    //.transition(.move(edge: .bottom))
                    //.transition(.slide)
                    .transition(.scale )
                
            case.failure(_):
                Image(systemName: "ant.circle.fill").imageModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").imageModifier()
            @unknown default:
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
