//
//  ViewController.h
//  CoreDataApp
//
//  Created by Student on 2017-03-16.
//  Copyright © 2017 Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *pokeName;
@property (weak, nonatomic) IBOutlet UITextField *pokeTimeStamp;
@property (weak, nonatomic) IBOutlet UITextField *pokeLocation;
@property (weak, nonatomic) IBOutlet UITextField *pokeComment;





// Used for Core-Data in    ViewController.h

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel; // Schema

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;  // Get insert delete from the databse

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;  // Database connection

- (NSURL *)applicationDocumentsDirectory; // nice to have to reference files for core data

@end

