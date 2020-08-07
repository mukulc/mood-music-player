//
//  GenreButtonScreen.swift
//  first project
//
//  Created by Sandeep Rana on 29/05/20.
//  Copyright © 2020 MishPay Pvt. Ltd. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {
	
	var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
		
		MPMediaLibrary.requestAuthorization { (status) in
			print(status)
		}

        // Do any additional setup after loading the view.
    }
    
	@IBAction func genreButtontaped(_ sender: UIButton) 
	{
		MPMediaLibrary.requestAuthorization{ ( status ) in if status == .authorized{
			self.playGenre(genre: sender.currentTitle!) 
			
			}
		}
		
	}
	
	
	@IBAction func stopbuttontapped(_ sender: UIButton)
	{
		musicPlayer.stop()
	}
	
	
	@IBAction func nextbuttontapped(_ sender: UIButton) 
	{
		musicPlayer.skipToNextItem()
//		musicPlayer.skipToNextItem()
	}
	
	    func playGenre(genre: String)
	
	    {
		
		   musicPlayer.stop()
		
		   let query = MPMediaQuery()
		
            _ = MPMediaPropertyPredicate(value:genre, forProperty: MPMediaItemPropertyGenre)
		
//		   query.addFilterPredicate (Predicate)
		
		   musicPlayer.setQueue(with: query)
			musicPlayer.shuffleMode = .songs
		   musicPlayer.play()
		
		
		
	   }
	
	
}
