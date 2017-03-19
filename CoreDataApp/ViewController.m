//
//  ViewController.m
//  CoreDataApp
//
//  Created by Student on 2017-03-16.
//  Copyright © 2017 Student. All rights reserved.
//


#import <CoreData/CoreData.h>
#import "ViewController.h"
#import "Entity+CoreDataClass.h"

@interface ViewController ()


@end

@implementation ViewController


- (IBAction)Save:(id)sender {
        
    NSString *pokeName = _pokeName.text;
    NSString *pokeTimeStamp = _pokeTimeStamp.text;
    NSString *pokeLocation = _pokeLocation.text;
    NSString *pokeComment = _pokeComment.text;
        
        
    // 1. Get a pointer to the database
    NSManagedObjectContext *context = [self managedObjectContext];
    NSError *error;
        
    // 2. Create a new object of type Entity and fill it with data
    Entity* entity = [NSEntityDescription
                        insertNewObjectForEntityForName:@"Entity"
                        inManagedObjectContext:context];
        
    [entity setValue: pokeName forKey:@"name"];
    [entity setValue: pokeTimeStamp forKey:@"time"];
    [entity setValue: pokeLocation forKey:@"location"];
    [entity setValue: pokeComment forKey:@"comment"];
        
        
    // 3. Send the object to the local database
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    // Load data from the local database if it's available.
    
    //NSManagedObjectContext *context = [self managedObjectContext];
    //NSError *error;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Entity" inManagedObjectContext:context]];
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    if (error)
        NSLog(@"Whoops, couldn't fetch requests on OutcropEntity: %@", [error localizedDescription]);
    
    if (results.count > 0)
    {
        for (Entity* e in results)
        {
            NSLog(@"%@", e.name);
            NSLog(@"%@", e.time);
            NSLog(@"%@", e.location);
            NSLog(@"%@", e.comment);
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    

    
}





// For core-data archiving to HD

@synthesize managedObjectContext = _managedObjectContext; // Get, insert, delete.
@synthesize managedObjectModel = _managedObjectModel; // Schema
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator; // Database connection



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




// Used for Core-Data in ViewController.m
// FOR CORE DATA //
// For core-data

- (void)saveContext{
    
    NSError *error = nil;
    
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    
    if (managedObjectContext != nil) {
        
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            abort();
        }
    }
}


- (NSManagedObjectContext *)managedObjectContext{
    
    if (_managedObjectContext != nil) {
        
        return _managedObjectContext;
        
    }
    
    
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
        
    }
    
    return _managedObjectContext;
    
}


- (NSManagedObjectModel *)managedObjectModel{
    
    if (_managedObjectModel != nil) {
        
        return _managedObjectModel;
        
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataApp" withExtension:@"momd"];
    
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return _managedObjectModel;
    
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator

{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ModelCoreData.sqlite"];
    
    NSError *error = nil;
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        
        abort();
        
    }
    
    return _persistentStoreCoordinator;
    
}


#pragma mark - Application's Documents directory


// Returns the URL to the application's Documents directory.

- (NSURL *)applicationDocumentsDirectory{
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
}


// END CORE DATA //

@end
