//
//  Menu.swift
//  Little Lemon
//
//  Created by Roman on 15.03.2024.
//

import SwiftUI
import CoreData

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    let categories = ["Starters", "Mains", "Desserts", "Drinks"]
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                                
                if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                    for dish in fullMenu.menu {
                        let newDish = Dish(context: viewContext)

                        newDish.title = dish.title
                        newDish.price = dish.price
                        newDish.descriptionDish = dish.descriptionDish
                        newDish.image = dish.image
                        newDish.category = dish.category
                    }
                    try? viewContext.save()
                }
            } else {
                print(error.debugDescription.description)
            }
        }
        dataTask.resume()
    }
    

        
    var body: some View {
        NavigationView {
            VStack {
                Header()
                
                VStack{
                    Hero()

                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .foregroundColor(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .font(.system(size: 40))
                        TextField("", text: $searchText)
                            .textFieldStyle(.roundedBorder)
                        
                    }.padding(.horizontal, 20)
                        .padding(.bottom, 10)
                }.background(Color(red: 73/255, green: 94/255, blue: 87/255)).padding(.bottom, 20)
                
                Text("Order for delivery!").textCase(.uppercase).font(.custom("Karla-Bold", fixedSize: 20))
                
                HStack(spacing: 20) {
                    ForEach(categories, id: \.self) { category in
                        Button(category) {}
                            .font(.custom("Karla-Bold", fixedSize: 17))
                            .background(Color(red: 237/255, green: 239/255, blue: 238/255))
                            .cornerRadius(10)
                            .buttonStyle(.bordered)
                            .foregroundColor(Color(red: 73/255, green: 94/255, blue: 87/255))
                    }
                }
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                    ScrollView {
                        VStack {
                            ForEach(dishes, id: \.self) { dish in
                                HStack {
                                    VStack(alignment: .leading, spacing: 15) {
                                        Text(dish.title!)
                                            .font(.custom("Karla-bold", fixedSize: 20))
                                            .padding(.leading, 10)
                                        
                                        Text(dish.descriptionDish!)
                                            .font(.custom("Karla-bold", fixedSize: 15))
                                            .padding(.leading, 10)
                                        
                                        Text("$" + dish.price!)
                                            .font(.custom("Karla-bold", fixedSize: 17))
                                            .padding(.leading, 10)
                                    }
                                    
                                    Rectangle()
                                                        .aspectRatio(1, contentMode: .fit)
                                                        .overlay(
                                                            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                                                                image.resizable().scaledToFill()
                                                            } placeholder: {}

                                                        ).clipShape(Rectangle())
                                                        .frame(maxWidth: 100)
                                                        .padding(.trailing, 15)
                                }
                            }.padding(.vertical, 10)
                            Divider()
                        }
                    }
     }
                    }
            }
        .onAppear {
            getMenuData()
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
            return [NSSortDescriptor(key: "title",
                                      ascending: true,
                                      selector:
                                        #selector(NSString.localizedStandardCompare))]
        }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }

        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

#Preview {
    Menu().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
