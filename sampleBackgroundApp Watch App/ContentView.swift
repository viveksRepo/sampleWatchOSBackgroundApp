//
//  ContentView.swift
//  sampleBackgroundApp Watch App
//
//  Created by Vivek Agarwal on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    let extendedRuntimeSessionManager = ExtendedRuntimeSessionManager();
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onChange(of: scenePhase, perform: { newValue in
            switch newValue {
            case .active:
                extendedRuntimeSessionManager.startTicks()
            case .background:
                print("Entered background state") // Called when user presses the crown on the watch
            case .inactive:
                print("Entered inactive state") // Called when app auto enters always on state
            default:
                print("App state : Unknown")
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
