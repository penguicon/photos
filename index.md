---
layout: default
title: List Of Galleries
---
Browse galleries from the Penguicon photo booth, and other collections
of photos taken at Penguicon. This is a convention in Michigan about
science fiction, open source software, and all geek interests!
<h2>List of Galleries:</h2>
<ul class="gallery-nav">
{% comment %} Create a list of image folders {% endcomment %} 

{% assign folder_string = "" %}
{% for static_file in site.static_files %}
{%   assign path_segments = static_file.path | split: "/" %}
{%   assign folder_name = path_segments[3] %}
{% unless folder_name == Nil %}
{%   unless folder_string contains folder_name %}
{%     capture folder_string %}
{{ folder_string}}{{ folder_name }},
{%     endcapture %}
{%   endunless %}
{% endunless %}
{% endfor %}
{% comment %} Remove the final comma {% endcomment %}
{% assign size = folder_string | size | minus: 1 %}
{% assign folder_list = folder_list | slice: 0, size %}

{% comment %} Turn the list of image folders into links to galleries {% endcomment %}

{% assign folder_list = folder_string | slice: 0, size | split: "," %}
{% for folder in folder_list %}
{% unless folder == "" %}
  <li>
    <a href="{{ folder | strip_newlines | absolute_url }}">{{ folder | replace: "_", " " | title_case }}</a>
  </li>
{% endunless %}
{% endfor %}</ul>
