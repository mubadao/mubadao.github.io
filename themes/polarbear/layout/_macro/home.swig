{% macro render() %}
<div id="primary">
  <section id="archive" class="archive">
    {% if not page.prev %}
      {% if page.tag %}
        <div class="archive-title tag">
          <h2 class="archive-name">{{ page.tag }}</h2>
        </div>
      {% elif page.category %}
        <div class="archive-title category">
          <h2 class="archive-name">{{ page.category }}</h2>
        </div>
      {% endif %}
    {% endif %}

    {% for post in page.posts %}
      {% set year %}
      {% set post.year = date(post.date, 'YYYY') %}
      {% if post.year !== year %}
        {% set year = post.year %}
        <div class="collection-title">
          <h2 class="archive-year">{{ year }}</h2>
        </div>
      {% endif %}

      <div class="archive-post">
        <span class="archive-post-time" data-time={{post.date}} >
           {% set t1 = Date.now() - post.date %}
           {% set day = t1 / 86400000 %}
           {% set hour = t1 / 3600000 %}
           {% set min = t1 / 60000 %}
           {% if day >= 2 %}
              {{ full_date(post.date, 'MM月DD日') }}
           {% elif day >= 1 %}
              1天前
           {% elif hour >= 1 %}
               {{parseInt(hour)}}小时前
           {% else %}
               {{Math.max(1, parseInt(min))}}分钟前
           {% endif %}
        </span>
        <span class="archive-post-title">
          {% if post.type == 2 %}
              {% set btnname = "btn" + post.date %}
              {% set audioname = "audio" + post.date %}
              {% set titlename = "title" + post.date %}
              
              <a href="{{ url_for(post.path) }}" class="archive-post-link" style="margin-left:5px;">
                <div class='btnaudio' id={{btnname}}>
                
                </div>
                {{ post.title }}
              </a>
           {% else %}
            <a href="{{ url_for(post.path) }}" class="archive-post-link" >
              {{ post.title }}
            </a>
          {% endif %}
        </span>
      </div>
    {% endfor %}
  </section>
 </div>
 <script>
    Date.prototype.format = function(format){
    var o = {
    "M+" : this.getMonth()+1, //month
    "d+" : this.getDate(), //day
    "h+" : this.getHours(), //hour
    "m+" : this.getMinutes(), //minute
    "s+" : this.getSeconds(), //second
    "q+" : Math.floor((this.getMonth()+3)/3), //quarter
    "S" : this.getMilliseconds() //millisecond
    }
     
    if(/(y+)/.test(format)) {
    format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    }
     
    for(var k in o) {
    if(new RegExp("("+ k +")").test(format)) {
    format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
    }
    }
    return format;
    }
    $(".archive-post-time").each(function(index, hr){
        var t2 = parseInt(hr.getAttribute("data-time"));
        var t1 = Date.now() - t2
        var day = t1 / 86400000
        var hour = t1 / 3600000
        var min = t1 / 60000
         if (day >= 2) {
            hr.innerText = (new Date(t2)).format("MM月dd日");
         }else if (day >= 1) {
            hr.innerText = "1天前";
         }else if (hour >= 1) {
             hr.innerText = parseInt(hour)+"小时前";
         }else {
             hr.innerText = Math.max(1, parseInt(min))+"分钟前";
         }
    })
</script>

  {% include '../_partial/pagination.swig' %}
{% endmacro %}
