<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		</section>
	</section>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="/buengbueng/js/dashBoard/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/buengbueng/js/dashBoard/bootstrap.min.js"></script>
    <script src="/buengbueng/js/dashBoard/busy.js"></script>
    <script src="/buengbueng/js/dashBoard/sparklines.js"></script>
    <script src="/buengbueng/js/dashBoard/flot/jquery.flot.min.js"></script>
    <script src="/buengbueng/js/dashBoard/flot/jquery.flot.resize.min.js"></script>
    <script src="/buengbueng/js/dashBoard/page-specific/index2.js"></script>
    <link href="/buengbueng/js/dashBoard/plugins/c3/c3.css" rel="stylesheet">
    <script type="text/javascript" src="/buengbueng/js/dashBoard/plugins/c3/d3.min.js"></script>
    <script type="text/javascript" src="/buengbueng/js/dashBoard/plugins/c3/c3.js"></script>
    <script src="/buengbueng/js/dashBoard/page-specific/chart-graphs.js"></script>
    <script>
        $(".ajax-menu").click(function () {
            $("#main-content").load($(this).attr("href"));
            return false;
        });
    </script>
</body>

</html>