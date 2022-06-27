jQuery('#region').change(function () {
                var Rcode = jQuery('#region option:selected').val();
                $.ajax({
                    url: "reservation/theaterlist",
                    type: "post",
                    dataType:"json",
                    data: {
                        "Rcode": Rcode
                    },
                    success: function (data) {
                        $("#regionTheater").html("");
                        for(var i = 0; i<data.length;i++){
                            $('#regionTheater').append("<option value="+data[i].t_code+">" +data[i].t_name + "</option>");
                        }
                    },
                    error: function () {
                        alert('fail');
                    }
                });
            });