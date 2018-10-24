/**
 * Created by hama on 2018/10/24.
 */
$(function(){
    //完成状态
    (function(){
        var table = $("table")[0],
            totalTimeMin,
            spendTimeMin,
            i,
            len,
            statement;
        for(i=1,len=table.rows.length;i<len;i++){
            totalTimeMin = parseInt(table.rows[i].cells[1].innerText.slice(0,-1));
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