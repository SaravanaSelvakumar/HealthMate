//
//  Homevc.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 09/06/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = MainViewModel()
    @EnvironmentObject var alertViewModel: AlertViewModel
    @State private var searchText: String = ""
    @State private var isSidebarOpen: Bool = false
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isSearching {
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search...", text: $searchText)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .padding(.trailing, 35)
                        .background(
                            ZStack{
                                Rectangle().fill(.gray.opacity(0.2))
                                
                                Rectangle().fill(.ultraThinMaterial)
                            }
                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        )
                        .overlay(
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        isSearching = false
                                        searchText = ""
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                                .padding(.trailing, 12)
                            }
                        )
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                }
                
                Spacer()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 12) {
                        DoctorCardView(doctors: DoctorModelData.doctor)
                        CategoryListView()
                        HealthTipListView()
                        DoctorListView(doctors: DoctorModelData.topRatedDoctors)
                    }
                }
                Spacer()
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isSidebarOpen.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundStyle(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !isSearching {
                        Button(action: {
                            withAnimation {
                                isSearching = true
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.black)
                        }
                    }
                }
            }
            .alert(isPresented: $alertViewModel.showAlert) {
                Alert(title: Text(alertViewModel.alertTitle),
                      message: Text(alertViewModel.alertMessage),
                      dismissButton: .default(Text("OK")))
            }
        }
    }
}

