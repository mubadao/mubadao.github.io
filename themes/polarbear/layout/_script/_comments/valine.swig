{% if page.path == "about/index.html" %}
  <div id="vcomments"></div>
  <script>
      new Valine({
          el: '#vcomments',
          appId: 'kdm34f1wYGiv7fpBxunGFmHd-gzGzoHsz',
          appKey: '8tgITTuqvhCeAqpLbsh6tcBc',
          visitor: 'true'
      })
      console.log("init finidh")
  </script>
{% endif %}