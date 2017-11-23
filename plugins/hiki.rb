##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "Hiki"
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "Hiki is a powerful and fast wiki clone written in Ruby."
website "http://hikiwiki.org/en/"

# Google results as at 2011-06-07 #
# 344 for "Generated by Hiki" "Powered by Ruby"

# Dorks #
dorks [
'"Generated by Hiki" "Powered by Ruby"'
]



# Matches #
matches [

# Version Detection # Meta Generator
{ :version=>/<meta name="generator" content="Hiki ([^"^\s]+)">/ },

# Error Page
{ :text=>'<html><head><title>Hiki Error</title></head><body>' },

# Version Detection # Generated by
{ :version=>/<div class="footer">Generated by <a href="http:\/\/hikiwiki.org\/">Hiki<\/a> ([^\s]+) \([\d]{4}-[\d]{2}-[\d]{2}\)/ },

]

# Passive #
def passive
	m=[]

	# Ruby Version Detection
	if @body =~ /<div class="footer">Generated by <a href="http:\/\/hikiwiki.org\/">Hiki<\/a>/ and @body =~ /Powered by <a href="http:\/\/www\.ruby-lang\.org\/">(Ruby)<(\/)a> ([^\s]+) \([\d]{4}-[\d]{2}-[\d]{2}\)/

		m << { :string=>@body.scan(/Powered by <a href="http:\/\/www\.ruby-lang\.org\/">(Ruby)<(\/)a> ([^\s]+) \([\d]{4}-[\d]{2}-[\d]{2}\)/).flatten }

	end

	# Return passive matches
	m
end

end

