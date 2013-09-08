//
//  MainTVC.m
//  CoreDataXCTest
//
//  Created by Eric Pena on 9/7/13.
//
//

#import "MainTVC.h"
#import "Person.h"
#import "Organization.h"

@interface MainTVC ()

@property (strong, nonatomic) NSArray *persons;

@end

@implementation MainTVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self loadDebugData];
    [self setupView];
}

- (void)loadDebugData
{
    Organization *organization = [Organization findFirst];
    
    if (!organization) {
        organization = [Organization createEntity];
        organization.name = @"Apple";
        
        organization = [Organization createEntity];
        organization.name = @"NeXT";
    }
    
    Person *person = [Person findFirst];
    
    if (!person) {
        // For testing, get "Apple" from Core Data
        Organization *apple = [Organization findFirstByAttribute:@"name" withValue:@"Apple"];
        
        person = [Person createEntity];
        person.name = @"John";
        person.memberOf = apple;
        
        person = [Person createEntity];
        person.name = @"Matt";
        person.memberOf = organization;
        
        person = [Person createEntity];
        person.name = @"Michael";
        person.memberOf = organization;
    }
    
    [[NSManagedObjectContext defaultContext] saveOnlySelfAndWait];
}

- (void)setupView
{
    self.persons = [Person findAll];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.persons count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Person *person = self.persons[indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = person.memberOf.name;
    
    return cell;
}

@end
