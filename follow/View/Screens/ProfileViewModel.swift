//
//  ProfileViewModel.swift
//  follow
//
//  Created by user220831 on 1/21/23.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var isFollowing: Bool = false
    @Published var userFollowers = String()
    
    var user = User(picture: "profile",
                    name: "Fábio Rocha",
                    nick: "@rochafabio",
                    follwers: 22643)
    
    init() {
        loadFollowers()
    }
    
     func loadFollowers() {
        self.userFollowers = customizeNumber(value: user.follwers)
    }
    
    func customizeNumber(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        let shorten = formatter.string(for: value) ?? "0"
        return "\(shorten)K"
    }
    
    
     func followToogle() {
        self.isFollowing.toggle()
        self.isFollowing ? (self.user.follwers += 1) : (self.user.follwers -= 1)
        loadFollowers()
    }
     
}
