import 'package:first_app/UI/util/hexcolor.dart';
import 'package:first_app/model/movie.dart';
import 'package:first_app/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//to know about any widget or class simply click on it and press Ctrl + B

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();



  MovieListView({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(itemCount: movieList.length,
          itemBuilder: (BuildContext context , int index) {
        return Stack(
            children: [movieCard(movieList[index], context)
            ,
              Positioned(
                top: 10.0,
            child: movieImage(movieList[index].images[0])
            ),

            ]
        );
        // return Card(color: Colors.white,
        // elevation: 10.0,
        // child: ListTile(
        //   leading: CircleAvatar(
        //     child: Container(
        //       width: 200,
        //       height: 200,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: NetworkImage(movieList[index].images[0]),
        //           fit: BoxFit.cover
        //         ),
        //         //color: Colors.blue,
        //         borderRadius: BorderRadius.circular(14.0),
        //       ),
        //     ),
        //   ),
        //   trailing: Text("..."),
        //   title: Text(movieList[index].title, style: TextStyle(fontSize: 17.0),),
        //   subtitle: Text(movieList[index].year),
        //   onTap: () {
        //     //we push the page into the stack
        //     Navigator.push(context, MaterialPageRoute(
        //         builder: (context) => MovieListViewDetails(movie: movieList[index],)));
        //   },
        // ),);
      }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context)
  {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left : 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(movie.title, style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                      Text("Rating: ${movie.imdbRating} /10", style: mainTextStyle())
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Released: ${movie.released}", style: mainTextStyle(),),
                      Text(movie.runtime,style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle()),

                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => { Navigator.push(context, MaterialPageRoute(
         builder: (context) => MovieListViewDetails(movie: movie)
      )
      )}
    );
  }

  Widget movieImage(String imageUrl)
  {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://picsum.photos/100'),
          fit: BoxFit.cover
        )

      ),
    );
  }

  TextStyle mainTextStyle()
  {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey.shade600
    );
  }
}

//new route( screen or page)
class MovieListViewDetails extends StatelessWidget {
  //final String movieName;
  final Movie movie;
  //key controls how one widget replaces another widget in the tree
  const MovieListViewDetails({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blueGrey.shade900,

      ),
      body: ListView(

        children: [

          MovieDetailsThumbnail(thumbnail: movie.images[0],),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MovieDetailsHeader(movie: movie),
          ),
          HorizontalLine(),
          MovieExtraPosters(posters: movie.images,),
          HorizontalLine()


        ],
      ),

      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go back"),
      //       onPressed: () {
      //         Navigator.pop(context); //go back to previous page
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    thumbnail), fit: BoxFit.cover ),
              ),
            ),
            Icon(Icons.play_circle_outline , size: 100, color: Colors.white,)
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [ Color(0x0095d5f5), Color(0x98989890),],
            begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          height: 30,
        )
      ],
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(movie.title.toUpperCase(), style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25, color: Colors.blueAccent.shade700

              ),),
              Text("${movie.type} | ${movie.genre} | ${movie.year} ", style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,

              ),),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  CustomButton(data : movie.rated.toString()),

                    CustomButton(data : movie.runtime.toString()),


                  ]

                ),
              ),
              Text.rich(TextSpan(style: TextStyle(

              ),
              children: [
                TextSpan(text: movie.plot),
                TextSpan(text: " more...", style: TextStyle(
                  color: Colors.blue.shade700
                ))
              ])),
              MovieDetailsCast(movie: movie,),
              HorizontalLine()

            ],
          ),
        ),
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MovieField(field: "Cast", value: movie.actors,),
          MovieField(field: "Director", value: movie.director,),
          MovieField(field: "Awards", value: movie.awards,)

        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$field : ", style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 17
          ), ),
          Expanded(
            child: Text(value, style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
                fontSize: 13
            ), ),
          )
        ],
      ),
    );
  }
}


class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          //MoviePoster(poster: movie.images[0].toString()),

        ],

      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster), fit: BoxFit.cover
            )

          ),
        ),

      ),
    );
  }
}
class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      color: Colors.grey,
    );
  }
}


class MovieExtraPosters extends StatelessWidget {
  final List<String> posters;
  const MovieExtraPosters({Key key, this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Movie Posters".toUpperCase(), style: TextStyle(
          fontSize: 16,
          color: Colors.black54,

        ),),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: posters.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(posters[index]), fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            ),


          ),
        )
      ],
    );
  }
}






class CustomButton extends StatelessWidget {
  final String data;
  const CustomButton({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ()
      // {
      //   final snackBar = SnackBar(content: Text("hello again!"),
      //   backgroundColor: Colors.redAccent,);
      //   Scaffold.of(context).showSnackBar(snackBar);
      // },
      child: Container(
        width: data.length.toDouble()*22,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.indigo.shade600,
          borderRadius: BorderRadius.circular(7.0)
        ),
        child: Center(child: Text(data, style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.white),)),
      ),
    );
  }
}

//context knows the location of a widget in the widget tree



