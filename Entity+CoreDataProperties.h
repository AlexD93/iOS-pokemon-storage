//
//  Entity+CoreDataProperties.h
//  CoreDataApp
//
//  Created by Student on 2017-03-16.
//  Copyright © 2017 Student. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Entity+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Entity (CoreDataProperties)

+ (NSFetchRequest<Entity *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *location;
@property (nullable, nonatomic, copy) NSString *time;
@property (nullable, nonatomic, copy) NSString *comment;

@end

NS_ASSUME_NONNULL_END
