/**
 * 
 */
 function chanfunc() {
                    let teenNumber = $("#teenNum"); 
                    let adultNumber = $("#adultNum"); 
                    let totalNumber = $("#totalNum");
                    //인원수 불러옴 (MAX : 4명)
                    let tNum = $("#teenPrice option:selected").text(); 
                    let aNum = $("#adultPrice option:selected").text();
                    teenNumber.val(tNum); 
                    adultNumber.val(aNum);
                    let total = Number(tNum) + Number(aNum); 
                    totalNumber.val(total);
                    let teenPrice = $("#tPrice"); 
                    let adultPrice = $("#aPrice"); 
                    let totalprice = $("#totalPrice");
                    let hprice1 = $("#htprice"); 
                    let hprice2 = $("#haprice"); 
                    let htotalprice = $("#htotalprice");
                    //가격

                    let tPrice = $("#teenPrice option:selected").val(); 
                    let aPrice = $("#adultPrice option:selected").val();
                    teenPrice.val(tPrice); 
                    adultPrice.val(aPrice);
                    hprice1.val(tPrice); 
                    hprice2.val(aPrice);

                    let teenagerPrice = Number(hprice1.val()); 
                    let AdultPrice = Number(hprice2.val()); 
                    let totalSum = teenagerPrice + AdultPrice;
                    totalprice.val(totalSum); 
                    htotalprice.val(totalSum);

                    if (total > 4) {
                        alert("최대 4명까지 선택 가능합니다");
                        teenNumber.val(null); 
                        adultNumber.val(null); 
                        totalNumber.val(null);
                        //가격
                        teenPrice.val(null); 
                        adultPrice.val(null); 
                        totalprice.val(null);
                        location.reload();
                        $('#teenPrice').focus();
                    } }