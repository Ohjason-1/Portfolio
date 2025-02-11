//
//  ProfilePageView.swift
//  Echo
//
//  Created by Jaewon Oh on 11/21/24.
//
import SwiftUI

struct ProfilePageView: View {
    var profile: ProfilePage
    @State private var isDeliver = false
    @State private var isAwating = false
    var onBack: () -> Void
    var body: some View {
        
        NavigationStack {
            VStack {
                if let profilePicture = profile.profilePicture {
                    Image(uiImage: profilePicture)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
               
                Text(profile.name)
                    .font(.title2)
                    .bold()
                    .padding()
                Text(profile.bibliography ?? "No bibliography provided")
                    .font(.system(size: 12, weight: .ultraLight))
                    .padding(.bottom)
                    
                VStack{
                    ProfileInfoView(text: profile.name)
                    ProfileInfoView(text: profile.email)
                    ProfileInfoView(text: profile.birthday)
                      
                }
                VStack {
                    Text("Delivered Echos:")
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .padding()
                        
                    Button(action: {isDeliver.toggle()})
                    {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(red: 233/255, green: 239/255, blue: 233/255))
                            .frame(height: 100)
                            
                            .overlay(
                                VStack {
                                    Text("This is a message")
                                        .font(.system(size: 15))
                                       Spacer()
                                    Text("This is a message2")
                                        .font(.system(size: 15))
                                        
                                }
                                    .foregroundStyle(Color.black.opacity(0.7))
                                    .blur(radius: 2)
                                    .padding(22)
                                    .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .foregroundStyle(Color(red: 230/255, green: 249/255, blue: 227/255))
                                        .frame(width:80, height:30)
                                        .overlay(
                                            Text("see echos")
                                                .font(.system(size:12))
                                                .foregroundStyle(Color(red:0, green: 0.5, blue:0))
                                    )
                                )
                            )
                            .padding(.horizontal,40)
                    }
                    Text("Awating Echos:")
                        .frame(maxWidth: .infinity, alignment:.leading)
                        .padding()
                    Button(action: {isAwating.toggle()})
                    {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(red: 233/255, green: 239/255, blue: 233/255))
                            .frame(height: 100)
                            
                            .overlay(
                                VStack {
                                    Text("Message")
                                        .font(.system(size: 15))
                                    Text("Message")
                                        .font(.system(size: 15))
                                    Text("Message")
                                        .font(.system(size: 15))
                                    Text("Message")
                                        .font(.system(size: 15))
                                        
                                }
                                    .foregroundStyle(Color.black)
                                    .blur(radius: 2)
                                    .padding(22)
                                    .overlay(
                                        Image(systemName:"lock")
                                            .resizable()
                                            .font(.system(size: 1, weight: .light))
                                            .frame(width: 22, height: 22)
                                            .foregroundStyle(Color(red:0, green:0.4, blue:0))
                                    
                                )
                            )
                            .padding(.horizontal,40)
                    }
                }
            }
            .padding(.top, 40)
            Spacer()
        
        }
    }
}

struct ProfileInfoView: View {
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray, lineWidth: 0.5)
            .frame(height: 35)
            .overlay(
                Text(text)
                    .font(.system(size: 15, weight: .light))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            )
            .padding(.horizontal, 40)
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of ProfilePage with appropriate data
        let sampleProfile = ProfilePage(bibliography: "I am a person who loves to write to myself", name: "John Doe", email: "JohnD@berkeley.edu", birthday: "5/3/2005")
        // Pass the instance to the ProfilePageView
        ProfilePageView(profile: sampleProfile, onBack: {})
    }
}
