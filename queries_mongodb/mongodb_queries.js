import { MongoClient } from 'mongodb';

const client = await MongoClient.connect(
  'mongodb://localhost:27017/'
);

async function run(){

  
const coll = client.db('restaurants_db').collection('restaurants');



//1

const cursor1 = coll.find({});

//2

const cursor2 = coll.find({},{projection:{ restaurant_id: true, 
  name: true, 
  borough: true, 
  cuisine: true, }});

//3

const cursor3 = coll.find({},{projection:{ _id: 0,restaurant_id: true, 
name: true, 
borough: true, 
cuisine: true, }});

//4

const cursor4 = coll.find({},{projection:{ _id: 0,restaurant_id: true, 
  name: true, 
  borough: true, 
  address: {zipcode:true}, }});

//5

const cursor5 = coll.find({ borough: "Bronx"});

//6

const cursor6 = coll.find({ borough: "Bronx"}).limit(5);

//7

const cursor7 = coll.find({ borough: "Bronx"}).skip(5).limit(5);

//8

const cursor8 = coll.find({
  "grades.score": {$gt:90}
});

//9

const cursor9 = coll.find({
  "grades.score": {$gt:80, $lt:100}
});

//10

const cursor10 = coll.find({
  "address.coord.0": {$lt:
    -95.754168}
});

//11

const cursor11 = coll.find({$and:[{cuisine: { $not: /American/ }},{"grades.score": {$gt:70}},{"address.coord.0": {$lt:
  -65.754168}}] });

  //12

const cursor12 = coll.find({ cuisine: { $not: /American/ },"grades.score": {$gt:70},"address.coord.0": {$lt:
  -65.754168} });

//13

const cursor13 = coll.find({ cuisine: { $not: /American/ },"grades.grade": "A",borough: { $not: /Brooklyn/ }}).sort( { cuisine: 1, _id: 1 } );

//14

const cursor14 = coll.find({name:/^Wil/},{projection:{ 
  restaurant_id: true, 
  name: true, 
  borough: true, 
  cuisine: true }} );

  //15

const cursor15 = coll.find({name:/ces$/},{projection:{ 
  restaurant_id: true, 
  name: true, 
  borough: true, 
  cuisine: true }} );

  //16

  const cursor16 = coll.find({name:/Reg/},{projection:{ 
    restaurant_id: true, 
    name: true, 
    borough: true, 
    cuisine: true }} );

    //17

    const cursor17 = coll.find({borough: "Bronx", cuisine:{ $in: ["American", "Chinese"] }});

    //18
    const cursor18 = coll.find({borough:{ $in: ["Staten Island", "Queens","Brooklyn","Bronx"] }},{projection:{ 
      restaurant_id: true, 
      name: true, 
      borough: true, 
      cuisine: true }} );

      //19
      const cursor19 = coll.find({borough:{ $nin: ["Staten Island", "Queens","Brooklyn","Bronx"] }},{projection:{ 
        restaurant_id: true, 
        name: true, 
        borough: true, 
        cuisine: true }} );

        //20
        const cursor20 = coll.find({"grades.score":{$lt:10}},{projection:{ 
          restaurant_id: true, 
          name: true, 
          borough: true, 
          cuisine: true }} );

          //21
          const cursor21 = coll.find({ $or: [ { cuisine: "Seafood" }, { cuisine: "American" }, { cuisine: "Chinese" }, {name:/^Wil/} ] },{projection:{ 
            restaurant_id: true, 
            name: true, 
            borough: true, 
            cuisine: true }} );

            //22

 const cursor22 = coll.find({"grades.grade":"A", "grades.score":11, "grades.date": new Date("2014-08-11T00:00:00Z")},{projection:{ 
            restaurant_id: true, 
            name: true, 
            grades: true}} );

            //23

            const cursor23 = coll.find({"grades.1.grade":"A", "grades.1.score":9, "grades.date": new Date("2014-08-11T00:00:00Z")},{projection:{ 
              restaurant_id: true, 
              name: true, 
              grades: true}} );

              //24
              const cursor24 = coll.find({"address.coord.1":{$gte:42, $lte:52}},{projection:{ 
                restaurant_id: true, 
                name: true, 
                address: {street:true},
                address: {coord:true}}} );

                //25

                const cursor25 = coll.find({}).sort( { name: 1 } )

                //26

                const cursor26 = coll.find({}).sort( { name: -1 } )

          //27
          const cursor27 = coll.find({}).sort( { cuisine: 1 , borough: -1} )

          //28
          const cursor28 = coll.find({},{projection:{ 
            "address.street": false }} );
          // 29
          const cursor29 = coll.find({
            "address.coord": { $type: 1 }
          });

          //30
          const cursor30 = coll.find({ "grades.score": { $mod: [ 7, 0 ] } }
            ,{projection:{ 
            restaurant_id: true, 
            name: true, 
            grades: {grade:true}}} );


          //31

          const cursor31 = coll.find({ name:/mon/ }
          ,{projection:{ 
          
          name: true, 
          borough:true,
        "address.coord.0":true,
        "address.coord.1":true,
      cuisine:true}} );

      //32
      const cursor32 = coll.find({ name:/^Mad/ }
      ,{projection:{ 
      
      name: true, 
      borough:true,
    "address.coord.0":true,
    "address.coord.1":true,
  cuisine:true}} );




// RESULTADOS

const result1 = await cursor1.toArray();
const result2 = await cursor2.toArray();
const result3 = await cursor3.toArray();
const result4 = await cursor4.toArray();
const result5 = await cursor5.toArray();
const result6 = await cursor6.toArray();
const result7 = await cursor7.toArray();
const result8 = await cursor8.toArray();
const result9 = await cursor9.toArray();
const result10 = await cursor10.toArray();
const result11 = await cursor11.toArray();
const result12 = await cursor12.toArray();
const result13 = await cursor13.toArray();
const result14 = await cursor14.toArray();
const result15 = await cursor15.toArray();
const result16 = await cursor16.toArray();
const result17 = await cursor17.toArray();
const result18 = await cursor18.toArray();
const result19 = await cursor19.toArray();
const result20 = await cursor20.toArray();
const result21 = await cursor21.toArray();
const result22 = await cursor22.toArray();
const result23 = await cursor23.toArray();
const result24 = await cursor24.toArray();
const result25 = await cursor25.toArray();
const result26 = await cursor26.toArray();
const result27 = await cursor27.toArray();
const result28 = await cursor28.toArray();
const result29 = await cursor29.toArray();
const result30 = await cursor30.toArray();
const result31 = await cursor31.toArray();
const result32 = await cursor32.toArray();

await client.close();

}

run().catch(console.dir);

