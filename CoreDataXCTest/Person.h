//
//  Person.h
//  CoreDataXCTest
//
//  Created by Eric Pena on 9/7/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Organization;

@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Organization *memberOf;

@end
