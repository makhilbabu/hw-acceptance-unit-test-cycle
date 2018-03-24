Given("the following movies exist:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |movie|
      Movie.create movie
  end
end

Then("the director of {string} should be {string}") do |string1, string2|
  movie = Movie.find_by_title string1
  movie.director.should == string2
end

When("I add {string}") do |string|
  Movie.create string
end

Then("{string} should be on home page") do |string|
  flag = false;
  Movie.all.hash do |movie|
    if (movie.title == string)
      flag = True;
    end
  end
end

When("I fill {string} with {string}") do |string, string2|
  movie = Movie.new
  if (string == "Title")
    movie.title = string2
  elsif (string == "Rating")
    movie.rating = string2
  elsif (string == "Director")
    movie.director = string2
  else
    movie.release_date = string2
  end
  movie.save
end