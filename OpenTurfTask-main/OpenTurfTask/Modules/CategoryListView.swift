import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Doctor Specialties")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color(hex: "1E2022"))
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(CategoryModelData.categories) { category in
                        NavigationLink(destination: CategoryDeatilView(categorie: category.name).environmentObject(alertViewModel)) {
                            CategoryCardView(category: category)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

struct CategoryCardView: View {
    let category: Category
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: category.imageName)
                .resizable()
                .scaledToFit()
                .foregroundColor(Color(hex: "457AFE"))
                .frame(width: 30, height: 30)
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Text(category.name)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(hex: "77838F"))
                .padding(.bottom, 5)
        }
        .frame(width: 100, height: 100)
        .padding(.vertical)
        .background(Color(hex: "E9EFFE"))
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
