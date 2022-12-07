from imdb import Cinemagoer

#SQL insert template -> f"INSERT INTO **Table Name** VALUES ({variable}, {variable})"

#opening the file to write to
sqlFile = open("finalProject.sql", "w")

#creating an instance of Cinemagoer
ia = Cinemagoer()

top_movies = ia.get_top250_movies() 
top_tv = ia.get_top250_tv()

#{'rating': 8.4, 'title': 'Cinema Paradiso', 'year': 1988, 'votes': 261457, 'top 250 rank': 50, 'kind': 'movie'}
for movie in top_movies[0:50]:
    count = 0
    title_id = movie.getID()
    movie = ia.get_movie(f"{title_id}")
    if count == 0:
        print(movie.data)
    title = movie.data['original title']
    title = title.replace("'", "")
    releaseYear = movie.data['original air date']
    rating = movie.data['rating']
    runtime = movie.data['runtimes']
    genres = movie.data['genres']
    count += 1
    #there is no "runtime in minutes" attribute

    #movie table
    sqlFile.write(f"INSERT INTO Movie VALUES ({title_id}, {title}, {releaseYear}, {rating}, {runtime})")

    #genre table
    sqlFile.write(f"INSERT INTO genre_lkp VALUES ({genres}, {title_id})")






# nameId		
# firstName			
# lastName		
# birthDate			
# acting_credits
# writing_credits	
# directing_credits
# for movie in top_movies:
#     id = ia.get_imdbID(movie)
#     tempMovie = ia.get_movie(id)
#     for director in movie["director"]:
#         personId = ia.search_person(director['name'])['id']
#         person = ia.get_person(personId)
#         print(person.data)
        




# title_id		
# title 			
# release_dt		
# rating			
# num_episodes	
# num_seasons		
# maturity_rating
# for tv in top_tv[0:50]:
#     title_id = tv.getID()
#     title = tv.data['localized title']
#     title = title.replace("'", "")
#     release_dt = tv.data['year']
#     rating = tv.data['rating']
#     num_episodes = tv.data['episodes']
#     num_seasons = tv.data['series']
#     maturity_rating = tv.data['certificates'][0] 

#     print(f"INSERT INTO tv_show VALUES ({title_id},{title},{release_dt},{rating},{num_episodes},{num_episodes},{maturity_rating})")


#     #load into finalProject.sql
#     sqlFile.write()



#person
#--------
#nameId
#f_name
#l_name
#Bdate
#act creds
#write creds
#direct creds

# nameID = person.personID #?
# name = person.data['name'].split()
# fname = name[0]
# lname = name[1]
# bdate = person.data['birth date']
# #look at person object to figure out the name for these
# actCreds = person.data['acting credits']
# writeCreds = person.data['writing credits']
# directCreds = person.data['directing credits']

# sqlFile.write(f"INSERT INTO Person VALUES ({nameID}, {name}, {fname}, {lname}, {bdate}, {actCreds}, {writeCreds}, {directCreds})")










        



