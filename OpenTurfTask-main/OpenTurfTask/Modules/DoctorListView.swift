//
//  DoctorListView.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 10/06/25.
//

import SwiftUI
import Foundation


import SwiftUI

struct DoctorListView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel
    let doctors: [Doctor]
    var header: String? = "Top Rated Doctors"
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(header ?? "")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "1E2022"))
                .padding(.leading, 20)
            
            LazyVStack(spacing: 16) {
                ForEach(doctors) { doctor in
                    NavigationLink(destination: DoctorDetailView(doctor: doctor).environmentObject(alertViewModel)) {
                    TopRatedListView(doctor: doctor)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 5)
    }
}

struct TopRatedListView: View {
    let doctor: Doctor
    var body: some View {
                HStack(alignment: .top, spacing: 16) {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: doctor.color))
                        .frame(width: 70, height: 70)

                    VStack(alignment: .leading, spacing: 8) {
                        Text(doctor.name)
                            .font(.headline)

                        Text(doctor.specialty)
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        HStack(spacing: 8) {
                            Image("MapIcon")
                                .resizable()
                                .frame(width: 12, height: 16)
                            
                            Text(doctor.location)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(hex: "77838F"))
                        }
                    }
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(String(format: "%.1f", doctor.rating))
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing)
                }
                .padding()
                .background(Color(.white))
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}
