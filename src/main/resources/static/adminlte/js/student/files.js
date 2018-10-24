/**
 * Created by hama on 2018/10/24.
 */
$(function(){
    var table = $("table")[0];
    //完成状态
    (function(){
        var totalTimeMin,
            spendTimeMin,
            i,
            len,
            statement,
            totalTime;
        for(i=1,len=table.rows.length;i<len;i++){
            totalTime = table.rows[i].cells[1];
            totalTimeMin = Math.floor((parseFloat(totalTime.innerText)*60));
            totalTime.innerText = totalTimeMin+"m";
            spendTimeMin = parseInt(table.rows[i].cells[2].innerText.split("m")[0]);
            statement = table.rows[i].cells[3];
            if(spendTimeMin>=totalTimeMin){
                statement.innerText = "finished √";
            }
            else{
                statement.innerText = "unfinished ×";
            }
        }
    })();


})