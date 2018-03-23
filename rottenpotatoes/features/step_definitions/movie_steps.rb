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
  redirect_to movies_path
end