---
layout: default
title: blog
namespace: blog
permalink: /blog/
---
<h2>{% t page.title %}</h2>
<ul>
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>{{ post.excerpt }}</li>
  {% endfor %}
    
</ul>
