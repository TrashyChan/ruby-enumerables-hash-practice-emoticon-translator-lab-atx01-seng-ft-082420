# require modules here
require 'pry'
require 'yaml'

def load_library(emote_file)
  emoticons = YAML.load_file('lib/emoticons.yml')
  
  emoticons.each_with_object({}) do |(meaning, emotes), final_hash|
    emotes.each do |english, japanese|
    english = :english
    japanese = :japanese
      if !final_hash[meaning]
          final_hash[meaning] = {}
      end
      if !final_hash[meaning][:english]
          final_hash[meaning][:english] = emotes[0]
      end
      if !final_hash[meaning][:japanese]
          final_hash[meaning][:japanese] = emotes[1]
      end
    end
  end
end

def get_english_meaning(emote_file, jpn_emote)
  final_hash = load_library(emote_file)
  
  final_hash.each do |eng_meaning, value|
    if jpn_emote == value[:japanese]
      return eng_meaning
    end 
  end
  # If argument does not equal anything within' the final_hash return message
  if jpn_emote != final_hash  
    return "Sorry, that emoticon was not found"
  end
end

def get_japanese_emoticon(emote_file, eng_emote)
  final_hash = load_library(emote_file)
  
  final_hash.each do |meaning, value|
    jpn_emote = value[:japanese]
    if eng_emote == value[:english]
      return jpn_emote
    end
  end
  if eng_emote != final_hash
    return "Sorry, that emoticon was not found"
  end
end