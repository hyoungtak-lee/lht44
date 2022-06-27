$(document).ready(function (){
            let date = $('#datepicker').val();
            $('#resultDate').val(date);
            $('#SresultDate').val(date);
        });
        $(function() {
            var today = getToday();
            $("#datepicker").datepicker(); $("#datepicker").val();
            var resultdate = $('#resultDate'); var hiddenResultdate = $('#SresultDate');

            $("#datepicker").on("change",function(){
                var selected = $(this).val();
                if(selected < today){
                    alert('지난 날짜는 선택할 수 없습니다.');
                    resultdate.val('');
                    hiddenResultdate.val('');
                }else{
                    resultdate.val(selected);
                    hiddenResultdate.val(selected);
                }
            });
        });
function getToday(){
    var date= new Date();
    return date.getFullYear() + "-" + ("0"+(date.getMonth()+1)).slice(-2)+ "-" + ("0"+date.getDate()).slice(-2);
};