{% macro render(post) %}
  <article class="post">
    


    {% if is_home() %}
        <div class="post-excerpt post-content">
            {% set excerpt = "" %}
            {% if post.description %}
              {% set excerpt = post.description %}
            {% elif post.excerpt %}
              {% set excerpt = post.excerpt %}
            {% endif %}

            {% if excerpt %}
              {{ excerpt }}
        </div>
            {% endif %}
          {% else %}
            <div class="post-content">
              {% if post.htoc != true %}
                {{ toc(post.content, {list_number: false}) }}
              {% endif %}
	            {{ post.content }}
            </div>
          {% endif %}

    {% if not is_home() %}
      <footer class="post-footer">
		{% if post.tags and post.tags.length %}
		<div class="post-tags">
		  {% for tag in post.tags %}
			<a href="{{ url_for(tag.path) }}">{{ tag.name }}</a>
		  {% endfor %}
		</div>
		{% endif %}

        {# Post Pagination #}
        {% include "../_partial/pagination.swig" %}
        {% include "../_partial/comments.swig" %}
      </footer>
    {% endif %}
  </article>
{% endmacro %}
