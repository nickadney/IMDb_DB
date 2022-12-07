import imdb

#SQL insert template -> f"INSERT INTO **Table Name** VALUES ({variable}, {variable})"

#opening the file to write to
sqlFile = open("finalProject.sql", "w")

#creating an instance of Cinemagoer
ia = imdb.IMDb()

top_movies = ia.get_top250_movies() 
top_tv = ia.get_top250_tv()

# title_id		
# title 			
# release_dt		
# rating			
# num_episodes	
# num_seasons		
# maturity_rating
for tv in top_tv[0:50]:
    title_id = tv.getID()
    title = tv.data['title']
    title = title.replace("'", "")
    release_dt = tv.data['year']
    rating = tv.data['rating']
    genre = tv.data['genres']

    #fetching the number of seasons
    ia.update(tv, 'episodes')
    list_of_seasons = (sorted(tv['episodes'].keys()))

    #summing the number of episodes to assign to num_episodes
    episodes = 0
    for i in list_of_seasons:
        season = tv['episodes'][i]
        episodes += len(season)

    num_episodes = episodes
    #returns the number of seasons by popping the last element in list_of_seasons (the last season)
    num_seasons = list_of_seasons.pop()

    #cannot get this to work
    #maturity_rating = tv.data['certificates']

    #load into finalProject.sql
    # sqlFile.write(f"INSERT INTO tv_show VALUES ({title_id},{title},{release_dt},{rating},{num_episodes},{num_episodes})")

    print({title}, {genre})