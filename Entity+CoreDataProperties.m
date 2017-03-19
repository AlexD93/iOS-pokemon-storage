//
//  Entity+CoreDataProperties.m
//  CoreDataApp
//
//  Created by Student on 2017-03-16.
//  Copyright © 2017 Student. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Entity+CoreDataProperties.h"

@implementation Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Entity"];
}

@dynamic name;
@dynamic location;
@dynamic time;
@dynamic comment;

@end
