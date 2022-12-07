from imdb import Cinemagoer

#SQL insert template -> f"INSERT INTO **Table Name** VALUES ({variable}, {variable})"

#opening the file to write to
sqlFile = open("finalProject.sql", "w")

#creating an instance of Cinemagoer
ia = Cinemagoer()

top_movies = ia.get_top250_movies() 
top_tv = ia.get_top250_tv()


# nameId		
# firstName			
# lastName		
# birthDate			
# acting_credits
# writing_credits	
# directing_credits
for movie in top_movies:
    id = ia.get_imdbID(movie)
    tempMovie = ia.get_movie(id)
    for director in tempMovie['directors']:
        people = ia.search_person(director.data['name'])
        for person in people:
            print(person.data)
