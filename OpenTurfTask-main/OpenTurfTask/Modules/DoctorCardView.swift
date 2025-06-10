//
//  DoctorListView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI


struct DoctorCardView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel
    let doctors: [Doctor]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(doctors) { doctor in
                    NavigationLink(destination: DoctorDetailView(doctor: doctor).environmentObject(alertViewModel)) {
                        DoctorCard(
                            name: doctor.name,
                            specialty: doctor.specialty,
                            role: doctor.role,
                            rating: doctor.rating
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 5)
        }
    }
}

struct DoctorCard: View {
    let name: String
    let specialty: String
    let role: String
    let rating: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(name)
                .font(.headline)
                .foregroundStyle(.white)
                .lineLimit(2)

            Text(specialty)
                .font(.subheadline)
                .foregroundStyle(.white)
                .lineLimit(1)

            Text(role)
                .font(.footnote)
                .foregroundStyle(.white)
                .lineLimit(1)

            Spacer()

            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 14))

                Text(String(format: "%.1f", rating))
                    .font(.footnote)
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
        }
        .padding()
        .frame(width: 200, height: 160, alignment: .leading)
        .background(Color(hex: "457AFE"))
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

