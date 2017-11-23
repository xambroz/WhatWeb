##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
#
Plugin.define do
name "Plugin-Tutorial-1"
author "Your preferred name <email@address>"
description "Generic CMS is an open-source Content Management System developed in PHP."
website "http://example.com/"

# This is the matches array. 
# Each match is treated independently.

# Matches #
matches [

# This searches for a text string.
{ :text => "This page was generated by <b>Generic CMS</b>" },

# This searches for a regular expression. Note that the slashes are escaped.
{ :regexp => /This page was generated by <a href="http:\/\/www.genericcms.com\/en\/products\/generic-cms\/">Generic CMS<\/a>/ },

# This extracts the version of Generic CMS from the Mega generator tag.
{ :name => "Meta generator",  :version => /<meta name="generator" content="Generic CMS version ([a-z0-9])+/ }, 

] 

end
