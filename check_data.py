import duckdb

con = duckdb.connect("md:airbyte_curso?motherduck_token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Impvc2R1NzdAZ21haWwuY29tIiwibWRSZWdpb24iOiJhd3MtdXMtZWFzdC0xIiwic2Vzc2lvbiI6Impvc2R1NzcuZ21haWwuY29tIiwicGF0Ijoiclc3b1JJRzlQNzBQQUFoV24yLVBSYWRoMTZ2VjhOLVNqMjlIdXJ5SjdfcyIsInVzZXJJZCI6ImM0Y2ZhNzUwLTFlODYtNDBiZC05MWE3LTBhZjhlNDA5MTk2OCIsImlzcyI6Im1kX3BhdCIsInJlYWRPbmx5IjpmYWxzZSwidG9rZW5UeXBlIjoicmVhZF93cml0ZSIsImlhdCI6MTc3MTk2MTg0MH0.UoSe7HqNSOZWnW1lgiK2M-SrCRDp4OoMJL8PDuG-AR4")

print("openweather:")
print(con.execute("SELECT COUNT(*) FROM main.openweather").fetchall())

print("rest_countries:")
print(con.execute("SELECT COUNT(*) FROM main.rest_countries").fetchall())

print("mart_weather_obt:")
print(con.execute("SELECT COUNT(*) FROM main.mart_weather_obt").fetchall())

