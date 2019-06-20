require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @num_of_words = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    puts @analyzed_text.most_used_letter[:i].to_s
    erb :results
  end
end
