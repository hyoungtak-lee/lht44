$(function () {
            var outer = $("#resultName");
            var hiddenOuter = $("#SresultName");
            var inner = $("#resultNameCode");
            var hiddenInner = $("#SresultNameCode");
            $("#movie").change(function () {
                var element = $(this).find("option:selected");
                var rtouter = element.text(); //지역 명
                var rtinner = element.attr("value"); //지역 코드
                outer.val(rtouter);
                hiddenOuter.val(rtouter);
                inner.val(rtinner);
                hiddenInner.val(rtinner);
            });
        });
        $(function () {
            var outer = $("#resultRegion");
            var hiddenOuter = $("#SresultRegion");
            var inner = $("#resultRegionCode");
            var hiddenInner = $("#SresultRegionCode");
            $("#region").change(function () {
                var element = $(this).find("option:selected");
                var rtouter = element.text(); //지역 명
                var rtinner = element.attr("value"); //지역 코드
                outer.val(rtouter);
                hiddenOuter.val(rtouter);
                inner.val(rtinner);
                hiddenInner.val(rtinner);
            });
        });
        $(function () {
            var outer = $('#resultTheater');
            var hiddenOuter = $('#SresultTheater');
            var inner = $('#resultTheaterCode');
            var hiddenInner = $("#SresultTheaterCode");
            $('#regionTheater').change(function () {
                var element = $(this).find('option:selected');
                var rtouter = element.text(); //극장 명
                var rtinner = element.attr('value'); // 극장 코드
                outer.val(rtouter);
                hiddenOuter.val(rtouter);
                inner.val(rtinner);
                hiddenInner.val(rtinner);
            });
        });
        $(function () {
            var hall = $('#resultHall');
            var hiddenhall = $('#SresultHall');
            var time = $('#resultTime');
            var hiddentime = $('#SresultTime');
            $('#htlist1').change(function () {
                hall.val('');
                time.val('');
                var element = $(this).find('option:selected');
                var mtime = element.text(); //시간
                var mcode = element.attr('value'); // 상영관코드(H_NUM)
                hall.val(mcode);
                hiddenhall.val(mcode)
                time.val(mtime);
                hiddentime.val(mtime);
            });
        });
        $(function () {
            var hall = $('#resultHall');
            var hiddenhall = $('#SresultHall');
            var time = $('#resultTime');
            var hiddentime = $('#SresultTime');
            $('#htlist2').change(function () {
                hall.val('');
                time.val('');
                var element = $(this).find('option:selected');
                var mtime = element.text(); //시간
                var mcode = element.attr('value'); // 상영관코드(H_NUM)
                hall.val(mcode);
                hiddenhall.val(mcode)
                time.val(mtime);
                hiddentime.val(mtime);
            });
        });
        $(function () {
            var hall = $('#resultHall');
            var hiddenhall = $('#SresultHall');
            var time = $('#resultTime');
            var hiddentime = $('#SresultTime');
            $('#htlist3').change(function () {
                hall.val('');
                time.val('');
                var element = $(this).find('option:selected');
                var mtime = element.text(); //시간
                var mcode = element.attr('value'); // 상영관코드(H_NUM)
                hall.val(mcode);
                hiddenhall.val(mcode)
                time.val(mtime);
                hiddentime.val(mtime);
            });
        });
        $(function () {
            var hall = $('#resultHall');
            var hiddenhall = $('#SresultHall');
            var time = $('#resultTime');
            var hiddentime = $('#SresultTime');
            $('#htlist4').change(function () {
                hall.val('');
                time.val('');
                var element = $(this).find('option:selected');
                var mtime = element.text(); //시간
                var mcode = element.attr('value'); // 상영관코드(H_NUM)
                hall.val(mcode);
                hiddenhall.val(mcode)
                time.val(mtime);
                hiddentime.val(mtime);
            });
        });