//
//  HealthTipCardView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI

struct HealthTipListView: View {
    @StateObject private var viewModel = MainViewModel()
    @EnvironmentObject var alertViewModel: AlertViewModel
        let healthTips: [Category] = [
            Category(name: "Order Medicines", imageName: "pills.fill"),
            Category(name: "Book a Doctor", imageName: "stethoscope"),
            Category(name: "Check Schedules", imageName: "calendar")
            ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Quick Health Actions")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "1E2022"))
                .padding(.leading, 20)
            
                HStack(spacing: 15) {
                    ForEach(healthTips) { healthTip in
                        NavigationLink(destination: destinationView(for: healthTip.name)) {
                            HealthTipCard(Healthtip: healthTip)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
        }
        .padding(.bottom)
    }
    @ViewBuilder
    private func destinationView(for categoryName: String) -> some View {
        switch categoryName {
        case "Order Medicines":
            DrugListView()
                .environmentObject(alertViewModel)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        case "Book a Doctor":
            BookDoctorView()
                .environmentObject(alertViewModel)
                .navigationBarBackButtonHidden(true)
        case "Check Schedules":
            ScheduleView()
                .environmentObject(alertViewModel)
                .navigationBarBackButtonHidden(true)
        default:
            Text("Unknown Category")
        }
    }

}

struct HealthTipCard: View {
    let Healthtip: Category

    var body: some View {
        VStack(alignment: .leading ,spacing: 8) {
            Image(systemName: Healthtip.imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(hex: "457AFE"))
                .frame(width: 40, height: 40)
                .padding(.horizontal)
                .padding(.vertical, 10)
            
            Text(Healthtip.name)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color(hex: "77838F"))
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 5)
        }
        .frame(width: 115, height: 120, alignment: .leading)
        .background(Color(hex: "E9EFFE"))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

