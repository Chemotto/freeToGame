//
//  GameProvider.swift
//  freeToGame
//
//  Created by Tardes on 20/1/26.
//

import Foundation

let SERVER_BASE_URL: String = "https://www.freetogame.com/api"


class GameProvider {
    
   func getGameList() async -> [game]{
        
        let url = URL(string: "\(SERVER_BASE_URL)/games")
        
        guard let url = url else {
            print("Invalid URL")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode([game].self, from: data)
            return result
            
        } catch {
            print("Invalid data")
            return []
        }
    }
    
    
    
    
    func getGamebyId(id: Int) async -> game?{
        
        let url = URL(string: "\(SERVER_BASE_URL)/game?id=\(id)")
        
        guard let url = url else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(game.self, from: data)
            return result
            
        } catch {
            print("Invalid data")
            return nil
            
        }
    }
    
}
