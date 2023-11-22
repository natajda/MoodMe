//
//  JokeViewModel.swift
//  MoodMe
//
//  Created by Natália Pohanková on 04/02/2023.
//

import Foundation

class JokeViewModel: ObservableObject {
    @Published var jokeData: Joke?
    @Published var isLoaded: Bool = false
    
    @MainActor
    public func fetchJoke() async {
        var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Programming?type=single")!)
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            jokeData = try JSONDecoder().decode(Joke.self, from: data)
            
            isLoaded = jokeData == nil ? false : true
        } catch {
            print("[ERROR]", error)
        }
    }

}
