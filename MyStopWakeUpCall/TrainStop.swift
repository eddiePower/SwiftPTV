//
//  TrainStop.swift
//  MyStopWakeUpCall
//
//  Created by Eddie Power on 6/6/19.
//  Copyright © 2019 Eddie Power. All rights reserved.
//

import Foundation

/*
 Stop Example JSON
 {
 "disruption_ids": [],
 "stop_suburb": "Armadale",
 "stop_name": "Armadale Station",
 "stop_id": 1008,
 "route_type": 0,
 "stop_latitude": -37.8564529,
 "stop_longitude": 145.019333,
 "stop_sequence": 0
 },
 */

//struct for our stop items.
struct Stop: Codable
{
    let disruption_ids: [String: Int]?
    let stop_suburb: String
    let stop_name: String
    let stop_id: Int
    let route_type: Int
    let stop_latitude: Double
    let stop_longitude: Double
    let stop_sequence: Int
    
    static func AllStops() -> String
    {
        return "http://timetableapi.ptv.vic.gov.au/v3/stops/route/6/route_type/0?devid=3000745&signature=29E493F1F76DC4EC9459DFAE495A5C32FCEBDC18"
    }
    
    static func allStops(completionHandler: @escaping ([Stop]?, Error?) -> Void)
    {
        let endpoint = Stop.AllStops()
        guard let url = URL(string: endpoint) else
        {
            print("Error: cannot create URL")
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest)
        {
            (data, response, error) in
            guard let responseData = data else
            {
                print("Error: did not receive data")
                completionHandler(nil, error)
                return
            }
            guard error == nil else
            {
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            do
            {
                //let dictionary: [String: Any] = try container.decode([String: Any].self, forKey: key)
                 let allJSONstops = try decoder.decode([Stop].self, from: responseData).self
                completionHandler(allJSONstops, nil)
            }
            catch
            {
                print("error trying to convert data to JSON")
                print(error)
                completionHandler(nil, error)
            }
        }
        task.resume()  //end blocking call
    }


    enum BackendError: Error
    {
        case urlError(reason: String)
        case objectSerialization(reason: String)
    }
}
