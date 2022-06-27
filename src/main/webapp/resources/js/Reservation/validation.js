function sendData(){
            //let reserveform = document.resvform;
            let reserveform = $('resvform');
            let Mname = $('#SresultName').val(); let Mcode = $('#SresultNameCode').val();
            if (!Mname == null || !Mcode == null){
                alert("영화를 선택해주세요")
                $('#movie').focus();
            }

            let Rname = $('#SresultRegion').val(); let Rcode = $('#SresultRegionCode').val();
            if (!Rname|| !Rcode){
                alert("지역을 선택해주세요")
                $('#region').focus();
            }

            let Tname = $('#SresultTheater').val(); let Tcode = $('#SresultTheaterCode').val();
            if (!Tname|| !Tcode){
                alert("영화관을 선택해주세요")
                $('#regionTheater').focus();
            }

            let Sdate = $('#SresultDate').val();
            if(!Sdate){
                alert('날짜를 선택해주세요');
                $('#datepicker').focus();
            }

            let Shall = $('#SresultHall').val(); let Stime = $('#SresultTime').val();
            if (!Tname|| !Tcode){
                alert("상영관과 시간을 선택해주세요")
                $('#regionTheater').focus();
            }
            if(Mname && Mcode && Rname && Rcode && Tname && Tcode && Sdate && Shall && Stime){
                reserveform.submit();
            }
        };