{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
  <script src="//unjkp.com/valine/dist/Valine.min.js"></script>  //删除Valine核心代码库外链调用
  <script src="/js/src/Valine.min.js"></script>  //调用刚下载的本地文件以加速加载速度

  {% set valine_uri = '/js/src/Valine.min.js' %}  //这里改为从本地加载
  {% if theme.vendors.valine %}
    {% set valine_uri = theme.vendors.valine %}
  {% endif %}
  <script src="{{ valine_uri }}"></script>
  
  <script type="text/javascript">
    var GUEST = ['nick','mail','link'];
    var guest = '{{ theme.valine.guest_info }}';
    guest = guest.split(',').filter(function (item) {
      return GUEST.indexOf(item)>-1;
    });
    new Valine({
        el: '#comments' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        appId: '{{ theme.valine.appid }}',
        appKey: '{{ theme.valine.appkey }}',
        placeholder: '{{ theme.valine.placeholder }}',
        avatar:'{{ theme.valine.avatar }}',
        guest_info:['nick'] ,  //评论者只需要提供评论的昵称即可
        pageSize:'{{ theme.valine.pageSize }}' || 10,
    });
    //增加以下六行代码去除 power by valine
    var infoEle = document.querySelector('#comments .info');
    if (infoEle && infoEle.childNodes && infoEle.childNodes.length > 0){
      infoEle.childNodes.forEach(function(item) {
        item.parentNode.removeChild(item);
      });
    }
  </script>
{% endif %}