//
//  ContentView.swift
//  Hacker New
//
//  Created by MAC on 30/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            //            List(posts, rowContent: { post in
            //                Text(post.title)
            //            })
            
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("Hacker News")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//    Post(id: "1", title: "Hello! How are you?"),
//    Post(id: "2", title: "I'm good!"),
//    Post(id: "3", title: "What about you?")
//]
