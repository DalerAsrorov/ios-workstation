//
//  NotesModel.h
//  Capnote
//
//  Created by Daler Asrorov on 12/7/16.
//  Copyright © 2016 Daler Asrorov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@interface NotesModel : NSObject

@property (strong, nonatomic) FIRDatabaseReference *ref;

// each note has an id (time), title (string), section (string), description (string), files (array)
- (void) addNote: (NSDictionary *) note;
- (void) removeNoteAt: (NSInteger) noteID;
- (NSMutableArray *) getAllNotes;
- (NSDictionary *) getCurrentNoteAt: (NSInteger) noteID;
- (NSString *) generateKey;
- (void) getSubsFeedNotes: (NSString *) sectionName
               completion: (void (^)(NSDictionary *data))completionBlock;
- (void) isSubscribedTo: (NSString *) sectionName
             completion: (void (^)(BOOL success))completionBlock;
- (int) getNumOfSubPosts;

@end
