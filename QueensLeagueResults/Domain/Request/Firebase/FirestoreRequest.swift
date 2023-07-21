//
//  FirestoreRequest.swift
//  QueensLeagueResults
//
//  Created by Ibrahim Hernández Jorge on 20/7/23.
//

import FirebaseFirestore

class FirestoreRequest {
//    private lazy var appDIContainer: AppDIContainer = {
//        return AppDIContainer()
//    }()

    static var shared: FirestoreRequest = {
        let instance = FirestoreRequest()

        return instance
    }()

    private lazy var firestore = Firestore.firestore()

    func getData<T: Codable>(collectionName: String, documentName: String = "", _: T.Type, success succeed: @escaping (([T]) -> ()),
                             error failed: @escaping (() -> ())) {
        let request = self.firestore.collection(collectionName)

        if !documentName.isEmpty {
            request.document(documentName).getDocument() { (documentSnapshot, error)  in
                if let document = documentSnapshot, var data = document.data() {
                    do {
                        data.removeValue(forKey: "serverTimeStamp")
                        let docsDecoded = try JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: data, options: []))

                        succeed([docsDecoded])
                    } catch {
                        failed()
                    }
                } else {
                    failed()
                }
            }
        } else {
            request.getDocuments { (querySnapshot, error) in
                if let _ = error {
                    failed()
                } else {
                    if let documents = querySnapshot?.documents {
                        do {
                            let docsDecoded = try documents.compactMap { try JSONDecoder().decode(T.self, from: JSONSerialization.data(withJSONObject: $0.data(), options: [])) }

                            succeed(docsDecoded)
                        } catch {
                            failed()
                        }
                    } else {
                        failed()
                    }
                }
            }
        }
    }
}
