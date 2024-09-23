//
//  gateway.swift
//  ActorSwiftUi
//
//  Created by Nafis Ahmed Munim on 11/11/22.
//

import Foundation
import UIKit
class gateway : ObservableObject{
    @Published var searchresults : SearchReply = SearchReply()
    var selectedsearch : SearchResult = SearchResult()
    @Published var seriesData : SeriesData = SeriesData()
    var selectedactor : Actor = Actor()
    @Published var actorbio : ActorBio = ActorBio()
    func doSeriesSearch(search s : String) async {
        guard !s.isEmpty else { return}
        let escapedString = s.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let key = "k_dl6f3iby"
        let urlStr = "https://imdb-api.com/en/API/SearchSeries/\(key)/\(escapedString!)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SearchReply.self, from: data)
            DispatchQueue.main.async { self.searchresults = pl }
        } catch {
        }
    }
    func doMovieSearch(search s : String) async {
        guard !s.isEmpty else { return}
        let escapedString = s.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let key = "k_dl6f3iby"
        let urlStr = "https://imdb-api.com/en/API/SearchMovie/\(key)/\(escapedString!)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SearchReply.self, from: data)
            DispatchQueue.main.async { self.searchresults = pl }
        } catch {
        }
    }
    func getDetails() async {
        let key = "k_dl6f3iby"
        let id = selectedsearch.id
        let urlStr = "https://imdb-api.com/en/API/Title/\(key)/\(id)/FullActor,"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(SeriesData.self, from: data)
            DispatchQueue.main.async { self.seriesData = pl }
        } catch {
        }
    }
    func getDetailsActor() async {
        let key = "k_dl6f3iby"
        let urlStr = "https://imdb-api.com/en/API/Name/\(key)/\(self.selectedactor.id)"
        guard let url = URL(string: urlStr) else { return }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as! HTTPURLResponse).statusCode == 200 else { return }
            let pl = try JSONDecoder().decode(ActorBio.self, from: data)
            DispatchQueue.main.async { self.actorbio = pl }
        } catch {
        }
    }
    
    
}
