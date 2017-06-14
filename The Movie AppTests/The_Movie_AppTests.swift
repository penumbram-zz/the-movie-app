//
//  The_Movie_AppTests.swift
//  The Movie AppTests
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import XCTest
@testable import The_Movie_App
import Alamofire

class The_Movie_AppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testValidAPIKey() {
        XCTAssert(!apiKey.isEmpty,"An api key is needed to run the aplication")
    }
    
    func testMovieRouter() {
        let moviesModuleViewController = MoviesRouter.assembleModule()
        XCTAssertNotNil(moviesModuleViewController)
    }
    
    func testSearchRouter() {
        let searchModuleViewController = SearchRouter.assembleModule()
        XCTAssertNotNil(searchModuleViewController)
    }
    
    func testSaveQuery() {
        let moviesInteractor = MoviesInteractor()
        
        for i in 0..<100 {
            moviesInteractor.saveQuery("Test-\(i)")
        }
        var suggestions : [Search] = []
        do {
            suggestions = try SuggestionsLocalDataManager.retrieveSuggestions()
        } catch {
            abort()
        }
        XCTAssertEqual(suggestions.count, maxSuggestions)
    }
    
    func testValidCallToSearchAPI() {
        let promise = expectation(description: "Movie Response is in place")
        
        NetworkManager.sharedInstance.request(endpointSearch, method: .get, parameters: ["api_key" : apiKey, "query" : "batman"]).responseObject {(response: DataResponse<MovieResponse>) in
            if response.result.value != nil {
                promise.fulfill()
            } else {
                XCTFail("Response value is not of type MovieResponse")
            }
        }
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testValidCallToImageAPI() {
        let promise = expectation(description: "Image downloaded successfully")
        let imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0))
        imageView.sd_setImage(with: URL(string: "\(endpointImage)/2DtPSyODKWXluIRV7PVru0SSzja.jpg"), completed: {(image, error, cacheType, imageURL) -> Void in
            if image != nil && image!.size.width > 0 && image!.size.height > 0 {
                promise.fulfill()
            } else {
                XCTFail("image was not proper")
            }
        })
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
