function kaja(bada){
          var somenu1=document.getElementById('somenu1')
          somenu1.style.display="none"
          
          var somenu2=document.getElementById('somenu2')
          somenu2.style.display="none"
          
          var somenu3=document.getElementById('somenu3')
          somenu3.style.display="none"
          
          var somenu3=document.getElementById('somenu4')
          somenu3.style.display="none"
         
          var somenu3=document.getElementById('somenu5')
          somenu3.style.display="none"
          
          bada.style.display="block"
          
};
       
$(function() {

	//날짜 포맷 설정
	$('#datepicker').datepicker({
		showOn : "both", //버튼과 텍스트 필드 모두 달력 보여줌
		changeMonth : true,
		changeYear : true,
		//buttonImage: "", //버튼이미지
		//buttonImageOnly: true, //버튼에 있는 이미지만 표시
		dateFormat : "yy-mm-dd", //표시할 날짜 형식
		showOtherMonths : true, //빈 공간에 현재월의 앞뒤월의 날짜 표시
		showMonthAfterYear : true, //년도 먼저 나오고, 뒤에 월 표시
		nextText : "다음 달",
		prevText : "이전 달",
		yearSuffix : "",
		monthNamesShort : [ '1', '2', '3', '4', '5', '6', '7', '8',
			'9', '10', '11', '12' ], //달력의 월 부분 텍스트
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
				'8월', '9월', '10월', '11월', '12월' ], //달력의 월 부분 Tooltip 텍스트
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ], //달력의 요일 부분 텍스트
				dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일', '금요일',
					'토요일' ], //달력의 요일 부분 Tooltip 텍스트
					minDate : 0, //오늘 날짜 이후부터만 설정되게
	});

	//시간 포맷 설정
	$('#timepicker').timepicker({
		timeFormat: 'p h:mm',
		interval: 60, //60분 간격
		minTime: '11',
		maxTime: '10:00pm',
		startTime: '11:00',
		dynamic: false,
		dropdown: true,
		scrollbar: true
	});

	//세트메뉴 선택안함 체크시 A,B,C세트 클릭 불가
	$('input[type="checkbox"]#ck_no').click(function(){
		if(this.checked){
			$('.setmenu').attr("disabled",true);
			$('.setmenu').val("0");
			$('#totPrice').val("5000");
		} else if(!this.checked) {
			$('.setmenu').attr("disabled",false);
		}
	});
	
	//가격 총합 자동 계산
	$('#setmenu1, #setmenu2, #setmenu3').on('change', function() {
	    $('#totPrice').val(   (Number($('#setmenu1').val()) * $('#APrice').val()) +
	    		(Number($('#setmenu2').val()) * $('#BPrice').val()) +
	    		(Number($('#setmenu3').val()) * $('#CPrice').val()) +
	    		(Number($('#deposit').val()))
	    		);
	});
	
	$('#frmres').submit(function(){
		if($('#totPrice').val()==''){ //총 가격이 입력되지 않았을 시
			alert("메뉴를 선택해주세요")
			return false;
		} 		
		var answer = confirm("예약하시겠습니까?");
		if(answer==true){ //확인
			document.form.submit();
		} else {
			return false;
		}
	});
});
