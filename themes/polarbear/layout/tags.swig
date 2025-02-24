{% extends "_layout.swig" %}

{% block title %} {{ __('menu.categories') }} - {{ config.title }} {% endblock %}

{% block content %}
  <div class="tag-cloud">
    <div class="tag-cloud-title">
      {{ _p('counter.categories', site.tags.length) }}
    </div>
    <div class="tag-cloud-tags">
      {{ list_tags({style: null, separator: '    '}) }}
    </div>
  </div>
{% endblock %}
