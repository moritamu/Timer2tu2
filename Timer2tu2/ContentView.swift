//
//  ContentView.swift
//  Timer2tu2
//
//  Created by MsMacM on 2023/10/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            TimerView()
        }
        .padding()
    }
}
struct TimerView: View {
    @State private var isTimerRunning = false
    @State private var currentTimer = 5 // 最初のタイマーの秒数
    @State private var nextTimer = 2 // 次のタイマーの秒数
    
    var body: some View {
        Text("Current Timer: \(currentTimer)")
            .font(.largeTitle)
            .onTapGesture {
                startTimer()
            }
    }
    
    func startTimer() {
        if !isTimerRunning {
            isTimerRunning = true
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                currentTimer -= 1
                
                if currentTimer < 0 {
                    timer.invalidate()
                // 現在のタイマーが終了したら、次のタイマーを開始
                    startNextTimer()
                }
            }
        }
    }
    
    func startNextTimer() {
        isTimerRunning = false
        currentTimer = nextTimer
        nextTimer = 0 // 次のタイマーが必要なければ0に設定
        startTimer()
    }
}


#Preview {
    ContentView()
}
