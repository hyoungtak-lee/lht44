/**
 * 
 */
 /*==================== 좌석 선택 ====================*/
                $(document).ready(function() {
                	//화면에 예약된 좌석 표시
                	let data = $('#bookedSeatList').val();
                	let dataLength = data.length;
                	let result1 = data.substr(1, dataLength-2);
                	let word = result1.split(', '); //예약한 좌석 배열에 담음
                	let wordNum = word.length; //예약 좌석 개수
                	let checked = $('.hseat'); //전체 좌석
                	let checkNum = checked.length; //전체 좌석 개수
                	
                	for(let i=0;i<checkNum;i++){
                		for(let j=0;j<wordNum;j++){
                			if(checked[i].value ==word[j]){
                				checked[i].disabled = true;
                			}
                		}
                	}
					//좌석 선택                	
                    let count = 0;
                    let numarr = new Array();

                    $('.hseat').on('click',function () {
                        let svalue = $(this).val();//선택한 좌석 value값 가져옴 (a1~g10)
                        let num = $('#totalNum').val(); //총 인원
                        let val = this.checked;
                        if(val == true){
                            count+=1;
                        }else if(val == false){
                            count-=1;
                        }
                        numarr.push(svalue); //선택 좌석 배열에 넣음
                        
                        
                        if(!num){
                            alert('인원을 선택해주세요');
                            this.checked = false;
                            --count;
                            numarr.pop();
                        }
                        //초기화 1
                        if(count > num && num){
                            alert('더 이상 선택할 수 없습니다.');
                            this.checked = false;
                            --count;
                            numarr.pop();
                        } 
                    });
                    function getSmallerNum(){
                    }
                    //초기화 2
                    $('#teenPrice, #adultPrice').on('change', function(){ 
                    	count = numarr.length;
                    	let totalSumNum = $('#totalNum').val();
                    	let resultCount = count - totalSumNum;
                    	let deletedSeats = new Array();
                    	
                    	for(let i=count-1;i>=totalSumNum;i--){
                    		deletedSeats.push(numarr[i]);
                    	}
                    	let selectedSeat = $('.hseat');
                    	let selectedSeatNumber = $('.hseat').length;
                    	for(let i=0;i<checkNum;i++){
                    		for(let j=0;j<deletedSeats.length;j++){
                    			if(checked[i].value ==deletedSeats[j]){
                    				checked[i].checked = false;
                    				numarr.pop();
                    			}
                    		}
                    	}
                    });
                    $('.btn-pay').on("click",function () {
                    	
                        let seatarr = new Array();
                        let seatInfo = '';
                        for (let i = 0; i < numarr.length; i++) {
                            seatarr[i] = numarr[i];
                            seatInfo += seatarr[i];
                            seatInfo += ' '; //a1 a2 a3
                        }
                        //극장 코드
                        let t_code = $('#mtcode').val();
                        //상영관 코드
                        let hall = $('#mhall').val();
                        //uid
                        let uid = $('#userId').val();
                        //좌석 => seatInfo
                        //mcode
                        let mCode = $('#mMcode').val();
                        //날짜
                        let date = $('#mdate').val(); //날짜
                        //가격
                        let tNUm = $('#teenNum').val();
                        let tPrice = $('#teenPrice').val();

                        let aNUm = $('#adultNum').val();
                        let aPrice = $('#adultPrice').val();
                        let totalPrice = $('#htotalprice').val();

                        let pcode1 = Number(tPrice)/Number(tNUm);
                        let pcode2 = Number(aPrice)/Number(aNUm);

                        //시간
                        let time = $('#mtime').val(); //영화 시작 시간

                        /*----------------------------------*/
                        let movName = $('#mName').val();
                        let region = $('#mRegion').val();

                        // let place = region + " " + hall;
                        let place = hall;
                        let num = $('#totalNum').val();
                        if(num > 0 && seatarr[0] != null && count == num){
                            let totalSum = $('#htotalprice').val();
                            let sum = totalSum + " " + num;

                            //상영관 코드, 사용자 아이디, 좌석 번호 코드, 영화 코드, 예매 날짜
                            var IMP = window.IMP;
                            IMP.init('imp55234985');
                            IMP.request_pay({
                                pg : 'inicis',
                                pay_method : 'card',
                                merchant_uid : 'merchant_' + new Date().getTime(),
                                name : movName,  //MovieName
                                amount : '100',
                                buyer_email : 'iamport@siot.do',
                                buyer_name: '구매자이름',
                                buyer_tel : '010-1234-5678',
                                buyer_addr : '서울특별시 강남구 삼성동',
                                buyer_postcode : '123-456',
                            }, function(rsp) {
                                console.log(rsp);
                                if(rsp.success) {
                                    alert('결제 완료');
                                    location.href="/team/";
                                    $.ajax({
                                        type: 'post',
                                        url: 'seats/payment',
                                        data: {
                                        	"tcode":t_code, //tcode
                                            "hNum" : hall, //상영관 번호
                                            "uid":uid, //uid
                                            "seats":seatInfo, //좌석 => seatInfo
                                            "mcode":mCode, //mcode
                                            "date":date, //날짜
                                            "pcode1":pcode1, //p_code
                                            "pcode2":pcode2,
                                            "totalPrice":totalPrice,
                                            "time":time //시간
                                        },
                                    });
                                }else{
                                    let msg = '결제 실패';
                                }
                            });
                        }else{
                            if(seatarr[0] == null){
                                alert('좌석을 선택해주세요');
                            }
                            if(num == 0 || !num){
                                alert('인원을 선택해주세요');
                            }
                        }
                    });
                });