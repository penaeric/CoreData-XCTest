//
//  ModelTests.m
//  ModelTests
//
//  Created by Eric Pena on 9/7/13.
//
//

#import "Person.h"
#import "Organization.h"

@interface ModelTests : XCTestCase

@end

@implementation ModelTests

- (void)setUp
{
    [super setUp];
    
    [MagicalRecord setDefaultModelFromClass:[self class]];
	[MagicalRecord setupCoreDataStackWithInMemoryStore];
    
    Organization *organization = [Organization createEntity];
    organization.name = @"Test.org";
    
    Person *person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"peter";
    
    person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"john";
    
    person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"paul";
    
    person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"mary";
    
    person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"tom";
    
    person = [Person createEntity];
    person.memberOf = organization;
    person.name = @"wil";
    
    [[NSManagedObjectContext defaultContext] saveOnlySelfAndWait];
}

- (void)tearDown
{
    [MagicalRecord cleanUp];
    
    [super tearDown];
}

- (void)testExample
{
    XCTAssertTrue([@"abc" isEqualToString:@"abc"], @"Strings are not equal");
}

- (void)testBasicCoreData
{
    Organization *organization = [Organization findFirstByAttribute:@"name" withValue:@"Test.org"];
    
    XCTAssertNotNil(organization, @"Organization should not be nil");
    XCTAssertTrue([@"Test.org" isEqualToString:organization.name], @"organization.name should be 'Test.org'");
    
    NSArray *persons = [Person findAll];
    
    XCTAssertEqual(@6, [persons count], @"There should only be 6 Person NSManagedObjects");
}

@end
