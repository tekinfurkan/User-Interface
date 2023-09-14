//
//  ContentView.swift
//  Tuttorials
//
//  Created by utku on 1.09.2023.
//

import SwiftUI

struct ContentView: View {
    @State var showSheet: Bool = false
    @State var whichSheet : sheets = .settings
    enum sheets {
        case settings, menu, directory
    }
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        whichSheet = .menu
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 40, weight: .black, design: .default))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button {
                        whichSheet = .settings
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "gear")
                            .font(.system(size: 40, weight: .black, design: .default))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 25)
                Spacer()
                Button {
                    whichSheet = .directory
                    showSheet.toggle()
                } label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 30, weight: .black, design: .default))
                        .foregroundColor(.white)
                        .frame(width: 115, height: 55)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.gray)
                        )
                }

            }
            .sheet(isPresented: $showSheet) {
                showSheet = false
            } content: {
                switch whichSheet {
                    case .settings : SettingsSheet()
                    case .menu : MenuSheet()
                    case .directory : DirectorySheet().presentationDetents([.large,.medium])
                }
            }
        }
        .background(
            Image("background")
            .resizable()
            .frame(maxWidth: .infinity)
            .ignoresSafeArea()
        )
    }
}
struct DirectorySheet: View {
    var names = [
        "Furkan", "Yusuf", "İbrahim", "Serhat",
        "Kemal", "Hüseyin", "Karen",
        "Messi", "Ronaldo", "Modric", "Hagi",
        "Haaland", "Kobe Braynt", "İbrahimovic", "Fatih Terim",
        "Maradona", "Pele", "Alex", "Guiza"
    ]
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
            }
            .scrollIndicators(.hidden)
            HStack {
                Button(action: {}) {
                    Text("Call")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                }
                Image(systemName: "phone")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 48)
            .background(.green)
            .cornerRadius(12)
            .padding(.horizontal, 20)
        }
    }
}
    
struct MenuSheet: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Home")
            }
            HStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Profile")
            }
            HStack {
                Image(systemName: "safari")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Search")
            }
            HStack {
                Image(systemName: "shield.lefthalf.filled")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text("Privacy and Policy")
            }
        }
    }
}
    
struct SettingsSheet: View {
    enum AppearanceMod {
        case auto
        case light
        case dark
    }
    @State var isUserActive : Bool = false
    @State var userName : String = ""
    @State var isPrivate : Bool = false
    @State var isNotificationActive : Bool = false
    @State var fontSize : CGFloat = 5
    @State var Appearance : AppearanceMod = .auto
    var body: some View {
        List {
            Section {
                TextField("User Name", text: $userName)
                HStack {
                    Image("private")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Toggle("Private Acount", isOn: $isPrivate)
                }
                HStack {
                    HStack {
                        Image(systemName: "bubble.left.and.exclamationmark.bubble.right")
                            .frame(width: 30, height: 30)
                        Toggle("Notifications", isOn: $isNotificationActive)
                    }
                }
                Button {
                    isUserActive.toggle()
                } label: {
                    Text("Sign Out")
                }
            } header: {
                Text("Profile")
            }
            Section {
                Slider(value: $fontSize, in: 1...10) {
                    Label("Default Font Size", systemImage: "text.magnifyingglass")
                }
                Picker("Appearance", selection: $Appearance) {
                    Text("Dark").tag(AppearanceMod.dark)
                    Text("Light").tag(AppearanceMod.light)
                    Text("Auto").tag(AppearanceMod.auto)
                }
            } header: {
                Text("Appearance")
            }
            Section {
                HStack {
                    Text("Version")
                    Spacer()
                    Text("15.7.8")
                }
                
            } header: {
                Text("About")
            }



        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

