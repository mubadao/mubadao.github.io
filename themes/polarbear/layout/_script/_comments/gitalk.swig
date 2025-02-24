{% if page.path == "about/index.html" %}
  <div id="gitalk-container"></div>
  <script>
      const gitalk = new Gitalk({
      clientID: '1c127fd5b3f138049645',
      clientSecret: '4f0e458a8bf54e1f13606502d24f22267517bf9c',
      repo: 'mygitalk.github.io',      // The repository of store comments,
      owner: 'mubadao',
      admin: ['mubadao'],
      id: location.pathname,      // Ensure uniqueness and length less than 50
      distractionFreeMode: false  // Facebook-like distraction free mode
    })

    gitalk.render('gitalk-container')
  </script>
{% endif %}