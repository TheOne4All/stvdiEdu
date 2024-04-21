// FILTER CS CONTROLLER SCRIPT------------------------------------------------------------------------------------

function selectAll() {
  $("#selectAll").click(function () {
    if ($(this).prop("checked")) {
      var allChecked = $("input.checkBoxClass").prop("checked", true);
      var allCheckedArray = allChecked
        .map(function () {
          return $(this).val();
        })
        .get();
      $("input:hidden[name=fynx_selected_id]").val(allCheckedArray);
      // console.log(allCheckedArray);
    } else {
      $("input.checkBoxClass").prop("checked", false);
      $("input:hidden[name=fynx_selected_id]").attr("value", "");
    }
  });
}

function singleSelect() {
  $("input.checkBoxClass").click(function () {
    if ($(this).prop("checked")) {
      var allChecked = $("input.checkBoxClass:checkbox:checked");
      var allCheckedArray = allChecked
        .map(function () {
          return $(this).val();
        })
        .get();
      $("input:hidden[name=fynx_selected_id]").val(allCheckedArray);
      // console.log(allCheckedArray);
    } else {
      $(this).prop("checked", false);
      var allChecked = $("input.checkBoxClass:checkbox:checked");
      var allCheckedArray = allChecked
        .map(function () {
          return $(this).val();
        })
        .get();
      $("input:hidden[name=fynx_selected_id]").val(allCheckedArray);
      // console.log(allCheckedArray);
    }
  });
}

function pageEntry() {
  $("#entry").change(function (e) {
    var entry = $("#entry option:selected").val();
    var url = $(this).attr("data-url") + "/" + entry;
    // showLoader();
    window.location.replace(encodeURI(url));
  });
}

function toggleSearchFilter() {
  $("button.toggle-filter").click(function () {
    var displayStatus = $(".search-filter").hasClass("d-none");
    if (displayStatus == true) {
      $("div.search-filter").removeClass("d-none").fadeIn("slow");
    } else {
      $("div.search-filter").fadeOut("slow").addClass("d-none");
    }
  });
}

function bulkUploadEntry() {
  $("#csv_option").change(function (e) {
    var entry = $("#csv_option option:selected").val();
    var url_path = $(this).attr("data-url");
    var url =
      $(this).attr("data-url") + "public/media/offline-files/" + entry + ".csv";
    // showLoader();
    // window.location.replace(encodeURI(url));
    switch (entry) {
      case "questions":
        var selectedFieldSet =
          '<div class="col-sm-12"><div class="form-group form-group-default"><label class="bold"><a href="' +
          url +
          '">Download Sample CSV File</a> <b>Note:</b> for a brief tutorial on how to upload bulk questions, click <a href="' +
          url_path +
          'documentation/#bulk_upload" target="_blank">Here</a></label></div></div><div class="col-sm-12"><div class="form-group form-group-default"><label class="bmd-label-floating">Seperator <code>Default ","</code></label> <input type="text" class="form-control" name="seperator" value="" autofocus></div></div>';
        break;
      case "staffs":
        var selectedFieldSet =
          '<div class="col-sm-12"><div class="form-group form-group-default"><label class="bold"><a href="' +
          url +
          '">Download Sample CSV File</a></label></div></div>';
        break;
      case "examinees":
        var selectedFieldSet =
          '<div class="col-sm-12"><div class="form-group form-group-default"><label class="bold"><a href="' +
          url +
          '">Download Sample CSV File</a></label></div></div>';
        break;

      default:
        break;
    }
    $("#bulkUploadSelectBox").empty();
    $("#bulkUploadSelectBox").append(selectedFieldSet);
  });
}

function refreshList(containerEle, contentEle, json_array) {
  let keyArray = JSON.parse(json_array);
  var url = $("table").attr("data-url");
  // console.log(encodeURI(url));
  // req=new XMLHttpRequest();
  // req.open("POST", url,true);
  keyArray.forEach((element) => {
    setInterval(() => {
      $("#" + containerEle + element).load(url + " #" + contentEle + element);

      // req.onreadystatechange = function(){
      //   if (req.readyState != 4 || req.status != 200) return;
      //   document.getElementById(containerEle+element) = req.responseText;
      // }
      console.log("#" + containerEle + element);
    }, 5000);
  });
  // $.ajax({
  // type: "POST",
  // 	url: url,
  // data: formData,
  // dataType: 'html',
  // beforeSend: showLoader(),
  //complete: hideLoader(),
  // 	success: function(response){

  // 	}
  // });
}

// PRINT PAGE

function PrintPage(divToPrint = null) {
  var divToPrint = document.getElementById(divToPrint);
  var popupWin = window.open("", "_blank", "width=300,height=300");
  popupWin.document.open();
  popupWin.document.write(
    '<html><body onload="window.print()">' + divToPrint.innerHTML + "</html>"
  );
  popupWin.document.close();
}

// function submitForm(formID=null, func=null){
//   if (func != null){
//     let funcArray = func.split(':');
//     let paraArray = funcArray[1].split(',');
//     let funcParaBuild = '';
//     for (let index = 0; index < paraArray.length; index++) {
//       funcParaBuild = funcParaBuild+"'"+paraArray[index]+"'," ;
//     }
//     funcParaBuild = funcParaBuild.slice(0,-1);
//   equalCompare('newpass', 'confirmpass', 'Passwords');
//     // funcArray[0]=function(+funcParaBuild+);
//     // alert(error);
//   }
//   // alert(funcArray);
//   // let error=false;
//   // functionName();
//   // alert(error);
//   if(error==false) {
//     $("#"+formID).submit();
//   }
// }

// COMPARE TWO FORM FIELDS SCRIPT------------------------------------------------------------------------------------

function equalCompare(elementId, elementCompId, notice) {
  //	if (!$('#info'+elementId).length){
  //		$('.error'+elementId).append("<div id='info"+elementId+"'></div>");
  //	}
  var nameInfo = $(".error" + elementId).css("display", "block");
  var ele = $("#" + elementId);
  var eleComp = $("#" + elementCompId);
  var elementVal = ele.val();
  var elementCompVal = eleComp.val();

  if (elementVal !== elementCompVal) {
    error = true;
    nameInfo
      .html("&larr; " + notice + " not equal")
      .removeClass("text-success")
      .addClass("text-danger")
      .fadeIn();
  } else if (elementVal === elementCompVal && elementVal != "") {
    error = false;
    nameInfo
      .html("&larr; " + notice + " equals correctly")
      .removeClass("text-danger")
      .addClass("text-success")
      .fadeIn();
  } else {
    error = true;
    // nameInfo.delay(500).fadeOut();
  }
}

// SCANNER DEVICE SCRIPT------------------------------------------------------------------------------------

function processAttendance(page, action, reg) {
  var meeting_day = $("#meeting_day").val();
  var cell_name = $("#cell_name").val();
  var sub_cell_name = $("#sub_cell_name").val();
  var current_meeting_start = $("#current_meeting_start").val();
  var current_meeting_end = $("#current_meeting_end").val();
  //alert(cell_name+'-'+sub_cell_name);
  $(".modalBackground").fadeIn();
  showLoader();
  $.post(
    "modalBox.php?page=" + page + "&action=" + action + "&reg=" + reg,
    {
      meeting_day: meeting_day,
      current_meeting_start: current_meeting_start,
      current_meeting_end: current_meeting_end,
      cell_name: cell_name,
      sub_cell_name: sub_cell_name,
    },
    function (data) {
      if (data == 1) {
        location.reload(true);
        //alert(data);
      } else {
        hideLoader();
        alert(data);
      }
      $("#searchString").val("");
      //$('html').focus();
    }
  );
}

function verifyAttendance(page, action) {
  $(function () {
    $(document).pos();
    $(document).on("scan.pos.barcode", function (event) {
      //default scan read
      //var hexBarcodeRev = event.code;

      //custom scan read
      if ($("#searchString").val() != "") {
        var outputString = $("#searchString").val();
        //alert(outputString+' - '+event.code);
      } else {
        var barcode = event.code;
        var barcodeLen = barcode.length;
        var hexBarcode = baseToBase("10", "16", barcode);
        var outputString = "";
        var i = 0;
        while (i < barcodeLen) {
          i = i + 2;
          var str = hexBarcode.substr(barcodeLen - i, 2);
          var outputString = outputString.concat(str);
        }
      }

      //process data from scan
      processAttendance(page, action, outputString);
    });

    $(document).on("swipe.pos.card", function (event) {
      //access following:
      // `event.card_number` - card number only
      // `event.card_holder_first_name` - card holder first name only
      // `event.card_holder_last_name` - card holder last name only
      // `event.card_exp_date_month` - card expiration month - 2 digits
      // `event.card_exp_date_year_2` - card expiration year - 2 digits
      // `event.card_exp_date_year_4` - card expiration year - 4 digits
      // `event.swipe_data` - original swipe data from raw processing or sending to a 3rd party service
    });
  });
}
