//    RulesSetInfoViewController
//    @IBAction func studyButtonTap(_ sender: UIButton) {
//        presenter?.didTapStudyButton()
//    }
//    
//    RulesSetInfoPresenterImpl
//    func didTapStudyButton() {
//        router.showExercise(rulesSetId: state.rulesSetId)
//    }
//    
//    RulesSetInfoRouterImpl
//    func showExercise(rulesSetId: String) {
//        let vc = ExerciseAssembly.createModule(serviceAssembly: serviceAssembly, rulesSetId: rulesSetId)
//        viewController?.show(vc, sender: self)
//    }
//init(realmUser: RealmUser) {
//    self.id = realmUser.id
//    self.guid = realmUser.guid
//    self.isActive = realmUser.isActive
//    self.balance = realmUser.balance
//    self.age = realmUser.age
//    self.eyeColor = realmUser.eyeColor
//    self.name = realmUser.name
//    self.gender = Gender(rawValue: realmUser.gender) ?? .male
//    self.company = realmUser.company
//    self.email = realmUser.email
//    self.phone = realmUser.phone
//    self.address = realmUser.address
//    self.about = realmUser.about
//    self.registered = realmUser.registered
//    self.latitude = realmUser.latitude
//    self.longitude = realmUser.longitude
//    self.tags = realmUser.tags.map { $0 }
//    self.friends = realmUser.friends.map { Friend(id: $0) }
//    self.favoriteFruit = realmUser.favoriteFruit
//}

//struct DetailsItem {
//    
//    //name, age, company, email, phone, address, about, balance, eyeColor,
//    //favoriteFruit, registered, latitud, longitude, tags, friends
//    var id: Int
//    var balance: String
//    var age: Int
//    var eyeColor: EyeColor
//    var name: String
//    var company: String
//    var email: String
//    var phone: String
//    var address: String
//    var about: String
//    var registered: String
//    var latitude: Double
//    var longitude: Double
//    var tags: [String]
//    var friends: [Int]
//    var favoriteFruit: FavoriteFruit
//    
//    init(user: RealmUser) {
//        self.id = user.id
//        self.balance = user.balance
//        self.age = user.age
//        self.eyeColor = user.eyeColor
//        self.name = user.name
//        self.company = user.company
//        self.email = user.email
//        self.phone = user.phone
//        self.address = user.address
//        self.about = user.about
//        self.registered = user.registered
//        self.latitude = user.latitude
//        self.longitude = user.longitude
//        self.tags = user.tags.map {$0}
//        self.friends = user.friends.map {$0}
//        self.favoriteFruit = user.favoriteFruit
//    }
//    
}
