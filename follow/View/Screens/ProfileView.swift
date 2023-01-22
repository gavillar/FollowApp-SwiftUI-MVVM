//
//  ContentView.swift
//  follow
//
//  Created by user220831 on 1/21/23.
//

import SwiftUI

//MARK: - ProfileView
struct ProfileView: View {
    
    @EnvironmentObject var profileviewmodel: ProfileViewModel
    
    var body: some View {
        VStack {
            ProfileDataView()
            ActionView()
        }
        .animation(.easeInOut, value: profileviewmodel.isFollowing)
    }
}
//MARK: - ProfileDataView
struct ProfileDataView: View {
    
    @EnvironmentObject var profileviewmodel: ProfileViewModel
    
    var body: some View {
    
        
        Image(profileviewmodel.user.picture)
            .resizable()
            .cornerRadius(250)
            .frame(width: 250, height: 250)
            .padding(.bottom, 10)
        
        Text(profileviewmodel.user.name)
            .font(.system(size: 50, weight: .bold))
        
        Text(profileviewmodel.user.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text(profileviewmodel.userFollowers)
            .font(.system(size: 80, weight: .light))
            .padding(profileviewmodel.isFollowing ? 40 : 20)
    }
}
//MARK: - ActionView
struct ActionView: View {
    
    @EnvironmentObject var profileviewmodel: ProfileViewModel
    
    var body: some View {
        
        VStack{
            Button{ profileviewmodel.followToogle() } label: {
                Label(!profileviewmodel.isFollowing ? "follow" : "unfollow", image: "")
                    .font(.title3)
                    .frame(maxWidth: .infinity )
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!profileviewmodel.isFollowing ? .blue : .black)
            
            Button{} label: {
                Label("Enviar Mensagem", image: "")
                    .font(.title3)
                    .frame(maxWidth: .infinity )
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!profileviewmodel.isFollowing)
        }
        .padding(20)
    }
        
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
            
    }
}
