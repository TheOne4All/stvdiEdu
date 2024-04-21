$(document).ready(function () {
  var current_fs, next_fs, previous_fs; //fieldsets
  var opacity;
  var current = 1;
  var url = $("table").attr("data-url");
  var checkit_url = $("table").attr("data-server");
  var steps = $("fieldset").length;
  var mode = "online";
  var api_url;

  hideLoader();
  setProgressBar(current);

  //ON TRIGGER NEXT BUTTON EVENT...........................................................................................
  $(".next").click(function () {
    showLoader();
    current_fs = $(this).parent();
    next_fs = $(this).parent().next();

    //Check callback result if true
    installationStage(current, function (callback) {
      if (callback == true || callback == "true") {
        //Add Class Active
        $("#progressbar li")
          .eq($("fieldset").index(next_fs))
          .addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate(
          { opacity: 0 },
          {
            step: function (now) {
              // for making fielset appear animation
              opacity = 1 - now;

              current_fs.css({
                display: "none",
                position: "relative",
              });
              next_fs.css({ opacity: opacity });
            },
            duration: 500,
          }
        );
        setProgressBar(++current);
      }
    });
  });

  //ON TRIGGER PREVIOUS BUTTON EVENT..............................................................................
  $(".previous").click(function () {
    showLoader();
    current_fs = $(this).parent();
    previous_fs = $(this).parent().prev();

    //Remove class active
    $("#progressbar li")
      .eq($("fieldset").index(current_fs))
      .removeClass("active");

    //show the previous fieldset
    previous_fs.show();

    //hide the current fieldset with style
    current_fs.animate(
      { opacity: 0 },
      {
        step: function (now) {
          // for making fielset appear animation
          opacity = 1 - now;

          current_fs.css({
            display: "none",
            position: "relative",
          });
          previous_fs.css({ opacity: opacity });
        },
        duration: 500,
      }
    );
    setProgressBar(--current);
    hideLoader();
  });

  //INSTALLATION PROGRESS BAR COUNTER..............................................................................
  function setProgressBar(curStep) {
    var percent = parseFloat(100 / steps) * curStep;
    percent = percent.toFixed();
    $(".progress-bar").css("width", percent + "%");
  }

  //INSTALLATION STAGE PROGRESSION COUNTER..............................................................................
  function installationStage(curStep, callback) {
    switch (curStep) {
      case 1: //LANGUAGE.....................................................................
        callback(true);
        hideLoader();
        break;
      case 2: //REQUIREMENTS.................................................................
        result = document.getElementById("requirement_field").value;
        var online = navigator.onLine;
        if (result == 1) {
          if (online) {
            callback(true);
            hideLoader();
          } else {
            alert("Your server does not meet recommended Requirements");
            hideLoader();
            callback(false);
          }
        } else {
          alert("Your server does not meet recommended Requirements");
          hideLoader();
          callback(false);
        }
        break;
      case 3: //LICENSE.......................................................................
        var result = document.getElementById("license_field").checked;

        // Check mode for api url
        if (mode == "online") {
          api_url = checkit_url;
        } else {
          api_url = url;
        }

        if (result == true) {
          let envatoPurchaseCode = document.getElementById(
            "envato_purchase_code"
          ).value;
          if (envatoPurchaseCode == "") {
            alert("Please fill all form fields");
            hideLoader();
            callback(false);
            return;
          }
          showLoader();
          doAjax(
            url + "installer/proxy_server",
            {
              envatoPurchaseCode: envatoPurchaseCode,
              url: api_url + "installer",
              method: "POST",
            },
            function (callbackAjax) {
              if (callbackAjax == true || callbackAjax == "true") {
                callback(true);
                hideLoader();
              } else {
                alert("Wrong Envato Purchase Code!");
                hideLoader();
                callback(false);
              }
            }
          );
        } else {
          alert("Agree to the License Agreement");
          hideLoader();
          callback(false);
        }
        break;
      case 4: //DATABASE............................................................................
        let dbName = document.getElementById("dbname").value;
        let dbHost = document.getElementById("dbhost").value;
        let dbUser = document.getElementById("dbuser").value;
        let dbPass = document.getElementById("dbpass").value;
        if (dbName == "" || dbHost == "" || dbUser == "" || dbPass == "") {
          // if (dbName == "" || dbHost == "" || dbUser == "") {
          alert("Please fill all form fields");
          hideLoader();
          callback(false);
          return;
        }
        doAjax(
          url + "installer/create_db",
          { dbName: dbName, dbHost: dbHost, dbUser: dbUser, dbPass: dbPass },
          function (callbackAjax) {
            if (callbackAjax == true || callbackAjax == "true") {
              callback(true);
              hideLoader();
            } else {
              alert("Cannot Connect with Database Credentials");
              hideLoader();
              callback(false);
            }
          }
        );
        break;
      case 5: //INSTALL...............................................................................
        doAjax(url + "installer/create_tbl", {}, function (callbackAjax) {
          if (callbackAjax == true || callbackAjax == "true") {
            callback(true);
            hideLoader();
          } else {
            alert("Unable to create database tables");
            hideLoader();
            callback(false);
          }
        });
        break;
      case 6: //ACCOUNTS................................................................................
        let username = document.getElementById("username").value;
        let email = document.getElementById("email").value;
        let password = document.getElementById("password").value;
        let confirm_pass = document.getElementById("confirm_pass").value;
        if (email == "" || password == "" || confirm_pass == "") {
          alert("Please fill all form fields");
          hideLoader();
          callback(false);
          return;
        }
        if (password != confirm_pass) {
          alert("Passwords are not equal!");
          hideLoader();
          callback(false);
          return;
        }
        doAjax(
          url + "installer/create_act",
          { username: username, email: email, password: password },
          function (callbackAjax) {
            if (callbackAjax == true || callbackAjax == "true") {
              callback(true);
              hideLoader();
            } else {
              alert("Unable to create user account");
              hideLoader();
              callback(false);
            }
          }
        );
        break;

      default:
        break;
    }
  }

  //FINISH..............................................................................................
  $("#finish").click(function () {
    doAjax(url + "installer/finish", {}, function (callbackAjax) {
      if (callbackAjax == true || callbackAjax == "true") {
        window.location.replace(encodeURI(url));
      } else {
        alert("Unable to finalize installation");
        hideLoader();
        callback(false);
      }
    });
  });

  //SHOW PRELOADER IMAGE WITH BG CS CONTROLLER SCRIPT--------------------------------------------------------------
  function showLoader() {
    $("#preLoader").fadeIn();
  }

  //HIDE PRELOADER IMAGE CS CONTROLLER SCRIPT----------------------------------------------------------------------
  function hideLoader() {
    $("#preLoader").fadeOut();
  }

  //PERFORM AJAX FUNCTION SCRIPT------------------------------------------------------------------------------------
  function doAjax(ajaxurl, args, callback) {
    $.ajax({
      url: ajaxurl,
      type: "POST",
      cache: false,
      data: args,
      success: function (response) {
        callback(response);
      },
    });
  }
});
