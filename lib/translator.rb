# require modules here

def load_library(p)
  require "yaml"
	gov = YAML.load_file(p)
	get_meaning = {}
	get_emoticon = {}
	gov.each do |key, value|
	  get_meaning[value[1]] = key
	  get_emoticon[value[0]] = value[1]
	end
	new_h = {'get_meaning' => get_meaning, 'get_emoticon' => get_emoticon}
	return new_h
end

def get_japanese_emoticon(pa, emo)
  h = load_library(pa)
  if h['get_emoticon'][emo]
    jap_emo = h['get_emoticon'][emo]
    return jap_emo
  else
    puts 'Sorry, we dont have that emoticon'
  end
  # return jap_emo
end

def get_english_meaning(pa, jap_emo)
  h = load_library(pa)
  mean = h['get_meaning'][jap_emo]
  return mean
end