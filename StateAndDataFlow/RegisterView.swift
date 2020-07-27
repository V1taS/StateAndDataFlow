//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $user.name)
                    .multilineTextAlignment(.center)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                }
                .frame(width: 300)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("\(user.name.count)")
                    .foregroundColor(user.correctName ? .green : .red)
            }
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(!user.correctName)
            }
        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        
        if !user.name.isEmpty {
            user.isRegister = true
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(UserManager())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
