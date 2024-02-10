//
//  HomeView.swift
//  EDeveloper
//
//  Created by Nagaraju on 08/02/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = RemoteViewModel()
    @Environment (\.horizontalSizeClass) var horizontalSizeClass
    @Environment (\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView {
            
            if verticalSizeClass == .regular {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100))
                ], spacing: 10) {
                    ForEach(viewModel.commentsData.flatMap(\.photos), id: \.id) { photo in
                        imageFromURL(photo.url)
                    }
                }
            }else {
                LazyVGrid(columns: [
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100)),
                    GridItem(.adaptive(minimum: 100))
                ], spacing: 10) {
                    ForEach(viewModel.commentsData.flatMap(\.photos), id: \.id) { photo in
                        imageFromURL(photo.url)
                    }
                }
            }
        }.padding()
        .onAppear {
            Task {
                await viewModel.load()
            }
        }
    }
    
    func imageFromURL(_ url:String) -> some View {
        
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 150)
                .clipped()
            
        } placeholder: {
            ProgressView()
        }
        .cornerRadius(10)
        
    }
    
    
    
}




#Preview {
    HomeView()
}


//1.geomentry
//2.sizeClass



