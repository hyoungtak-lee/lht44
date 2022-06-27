function ajaxt(){
            var Mcode = document.getElementById("SresultNameCode").value;
            $.ajax({
                url: "reservation/timetable",
                type: "post",
                dataType:"json",
                data: {
                    "Mcode": Mcode
                },
                success: function (data) {
                    $("#htlist1").html(""); $("#htlist2").html(""); $("#htlist3").html(""); $("#htlist4").html("");
                    html1=''; html2=''; html3=''; html4='';
                    for(var i =0;i<data.length;i++){
                        // if(data[i].h_num == (i+1)){
                        //     //div안의 i번째 자식
                        // }
                        if(data[i].h_num == 1) html1+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                        if(data[i].h_num == 2) html2+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                        if(data[i].h_num == 3) html3+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                        if(data[i].h_num == 4) html4+="<option value="+data[i].h_num+">" + data[i].h_time +"</option>";
                    }
                    $('#htlist1').append(html1); $('#htlist2').append(html2); $('#htlist3').append(html3); $('#htlist4').append(html4);
                },
                error: function () {
                    alert('fail');
                }
            });
        };