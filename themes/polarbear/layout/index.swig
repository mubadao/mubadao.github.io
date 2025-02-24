{% extends "_layout.swig" %}
{% import '_macro/home.swig' as home_template %}


{% block title %} {{ config.title }} - {{ config.description }}{% endblock %}

{% block content %}
  {{ home_template.render() }}
  {% include "_partial/widget.swig" %}
{% endblock %}
