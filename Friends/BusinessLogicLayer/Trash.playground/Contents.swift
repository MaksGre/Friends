//        for tag in tags {
//            let newTag = Tag()
//            newTag.name = tag
//            user.tags.append(newTag)
//        }
//        for friendId in friends.map({$0.id}) {
//            let friend = IdFriend()
//            friend.id = friendId
//            user.friends.append(friend)
//        }
//static func notExistUserBy(id: Int) -> Bool {
//    let realm = try! Realm()
//    let idUser = realm.objects(UserRealm.self).filter("id == \(id)").first
//    guard idUser == nil else { return false }
//    return true
//}
