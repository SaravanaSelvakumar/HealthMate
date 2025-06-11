//
//  newView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 11/06/25.
//

import SwiftUI


struct PrescptionView: View {
    let name: String
    let dose: String
    var ontap: () -> Void
    
    var body: some View {
        
        Button(action: {
            ontap()
        }) {
            HStack(alignment: .center, spacing: 12) {
                Spacer()
                
                Text(name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(hex: "1E2022"))
                    .padding(.leading, 20)
                    .onTapGesture {
                    }
                
                Text(dose)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(Color(hex: "1E2022"))
                    .padding(.leading, 20)
                
                Spacer()
                
            }
            .padding(5)
            .background(Color(hex: "E9EFFE"))
            .cornerRadius(12)
            .padding(.horizontal)
        }
        
    }
}
