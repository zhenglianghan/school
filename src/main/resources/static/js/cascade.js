$(function () {
    // 选择一级分类时，调整二级分类
    $("select[name='courseId']").change(
        function () {
            var courseId = $(this).val();

            $.ajax({
                type: "GET",
                url: "/msg/getUsers/"+courseId,   //使用绝对路径
                /*data: "courseId=" + ,*/
                dataType: "text",

                success: function (msg) {
                    $("select[name='receiver.id']").empty(); // 清空

                    var data = JSON.parse(msg); // 一定要转化成jQuery类型的json数据
                    $.each(data, function (i, item) {
                        var option = $(
                            "<option value='" + item.id
                            + "'></option>").text(
                            item.username);
                        $("select[name='receiver.id']").append(option);
                    });
                },
            });
        });
});

