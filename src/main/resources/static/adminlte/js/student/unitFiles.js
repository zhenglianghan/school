/**
 * Created by hama on 2018/10/24.
 */
$(function(){
    //退出页面前记录学习时长
    window.onbeforeunload=function() {

        var minu=document.getElementById("minute").innerHTML;
        var secon=document.getElementById("second").innerHTML;
        console.log(minu+secon);

        var data = {"minute":minu,
            "second": secon}
        $.ajax({
            type:"POST",
            url:"/course/student/time",
            contentType:"application/json;charset=utf-8",
            data: JSON.stringify(data),
       //     async:false,//设置成true，这标志着在请求开始后，其他代码依然能够执行。如果把这个选项设置成false，这意味着所有的请求都不再是异步的了，这也会导致浏览器被锁死
            success:function (data) {
                console.log(data);
            },
            error:function (jqXHR,textStatus,errorThrown){

            }
        });
   }

    //学习时长计时
    var s = parseInt($("#minute").text())*60 + parseInt($("#second").text());
    setTimeout(getRTime,1000);
    function getRTime(){
        s++;
        $("#minute").text(parseInt(s/60));
        $("#second").text(s%60);
        setTimeout(getRTime,1000);
    }

})