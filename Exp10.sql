test> use library

switched to db library

library> db.authors.insertMany([ {"authorID":1,"firstName":"George","lastName":"Orwell"}, {"authorID":2,"firstName":"Aldous","lastName":"Huxley"}, {"authorID":3,"firstName":"J.K.","lastName":"Rowling"} ])

{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6ab2562dfdbf8a556a909e3f'),
    '1': ObjectId('6ab2562dfdbf8a556a909e40'),
    '2': ObjectId('6ab2562dfdbf8a556a909e41')
  }
}


library> db.authors.find().pretty()

[
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e3f'),
    authorID: 1,
    firstName: 'George',
    lastName: 'Orwell'
  },
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e40'),
    authorID: 2,
    firstName: 'Aldous',
    lastName: 'Huxley'
  },
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e41'),
    authorID: 3,
    firstName: 'J.K.',
    lastName: 'Rowling'
  }
]



library> db.book.insertMany([ {"bookID":1,"title":"1984","genre":"Dystopian","publicationYear":1949,"authors":[1]}, {"bookID":2,"title":"Brave New World","genre":"Science Fiction","publicationYear":1932,"authors":[2]}, {"bookID":3,"title":"Harry Potter and the Philosopher's Stone","genre":"Fantasy","publicationYear":1997,"authors":[3]} ])

{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6ab25655fdbf8a556a909e42'),
    '1': ObjectId('6ab25655fdbf8a556a909e43'),
    '2': ObjectId('6ab25655fdbf8a556a909e44')
  }
}


library> db.book.find().pretty()


[
  {
    _id: ObjectId('6ab25655fdbf8a556a909e42'),
    bookID: 1,
    title: '1984',
    genre: 'Dystopian',
    publicationYear: 1949,
    authors: [ 1 ]
  },
  {
    _id: ObjectId('6ab25655fdbf8a556a909e43'),
    bookID: 2,
    title: 'Brave New World',
    genre: 'Science Fiction',
    publicationYear: 1932,
    authors: [ 2 ]
  },
  {
    _id: ObjectId('6ab25655fdbf8a556a909e44'),
    bookID: 3,
    title: "Harry Potter and the Philosopher's Stone",
    genre: 'Fantasy',
    publicationYear: 1997,
    authors: [ 3 ]
  }
]


library> db.borrower.insertMany([ {"borrowerID":1,"firstName":"John","lastName":"Doe","membershipDate":new Date("2023-01-01")}, {"borrowerID":2,"firstName":"Jane","lastName":"Smith","membershipDate":new Date("2023-02-15")} ])


{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6ab25677fdbf8a556a909e45'),
    '1': ObjectId('6ab25677fdbf8a556a909e46')
  }
}


library> db.borrower.find().pretty()

[
  {
    _id: ObjectId('6ab25677fdbf8a556a909e45'),
    borrowerID: 1,
    firstName: 'John',
    lastName: 'Doe',
    membershipDate: ISODate('2023-01-01T00:00:00.000Z')
  },
  {
    _id: ObjectId('6ab25677fdbf8a556a909e46'),
    borrowerID: 2,
    firstName: 'Jane',
    lastName: 'Smith',
    membershipDate: ISODate('2023-02-15T00:00:00.000Z')
  }
]


library> db.borrowedBook.insertMany([ {"borrowerID":1,"bookID":1,"borrowedDate":new Date("2023-03-01"),"returnDate":new Date("2023-03-15")}, {"borrowerID":2,"bookID":3,"borrowedDate":new Date("2023-03-05"),"returnDate":new Date("2023-03-20")} ])

{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('6ab2568ffdbf8a556a909e47'),
    '1': ObjectId('6ab2568ffdbf8a556a909e48')
  }
}


library> db.borrowedBook.find().pretty()

[
  {
    _id: ObjectId('6ab2568ffdbf8a556a909e47'),
    borrowerID: 1,
    bookID: 1,
    borrowedDate: ISODate('2023-03-01T00:00:00.000Z'),
    returnDate: ISODate('2023-03-15T00:00:00.000Z')
  },
  {
    _id: ObjectId('6ab2568ffdbf8a556a909e48'),
    borrowerID: 2,
    bookID: 3,
    borrowedDate: ISODate('2023-03-05T00:00:00.000Z'),
    returnDate: ISODate('2023-03-20T00:00:00.000Z')
  }
]


library> db.authors.updateOne( {"authorID":1}, {$set:{"lastName":"Smith"}} )

{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}


library> db.authors.find().pretty()

[
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e3f'),
    authorID: 1,
    firstName: 'George',
    lastName: 'Smith'
  },
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e40'),
    authorID: 2,
    firstName: 'Aldous',
    lastName: 'Huxley'
  },
  {
    _id: ObjectId('6ab2562dfdbf8a556a909e41'),
    authorID: 3,
    firstName: 'J.K.',
    lastName: 'Rowling'
  }
]


library> db.book.deleteOne({"bookID":3})


{
  acknowledged: true,
  deletedCount: 1
}

library> db.book.find().pretty()

[
  {
    _id: ObjectId('6ab25655fdbf8a556a909e42'),
    bookID: 1,
    title: '1984',
    genre: 'Dystopian',
    publicationYear: 1949,
    authors: [ 1 ]
  },
  {
    _id: ObjectId('6ab25655fdbf8a556a909e43'),
    bookID: 2,
    title: 'Brave New World',
    genre: 'Science Fiction',
    publicationYear: 1932,
    authors: [ 2 ]
  }
]