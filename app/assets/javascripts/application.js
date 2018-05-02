// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery-ui-1.10.3.custom
//= require jquery-ui-timepicker-addon.js
//= require select2
//= require jquery.observe_field
//= require bootstrap-modalmanager.js
//= require bootstrap-modal.js
//= require bootstrap-multiselect.js
//= require jquery.remotipart
//= require jquery.textcomplete.min.js


function check_selected_scheme_type(value){
  console.log(value);
  if(value == "yeshaswini"){
    $(".claim-card-no").show();
    $(".claim-urn-no").hide();
    $(".claim-reg-no").show();
    $(".plan-of-treatment").show();
    $(".relation").hide();
    $(".designation").hide();
    $(".kgid").hide();

  }else if(value == "rsby"){
    $(".claim-card-no").hide();
    $(".claim-urn-no").show();
    $(".claim-reg-no").show();
    $(".plan-of-treatment").show();
    $(".relation").hide();
    $(".designation").hide();
    $(".kgid").hide();
  }else if(value == "aby"){
    $(".claim-card-no").hide();
    $(".claim-urn-no").hide();
    $(".claim-reg-no").show();
    $(".relation").show();
    $(".designation").show();
    $(".kgid").show();
    $(".plan-of-treatment").hide();

  }else{
    $(".claim-card-no").show();
    $(".claim-urn-no").show();
    $(".claim-reg-no").show();
    $(".relation").hide();
    $(".designation").hide();
    $(".kgid").hide();
  }
}

function check_status_type(value){
  console.log(value);
  if(value == "denied"){
    $(".claim-reason-for-rejection").show();
  }else{
    $(".claim-reason-for-rejection").hide();
  }
}

$(function (){
  $('#cluster_schedule_from').datepicker();
});


$(function (){
  $('#cluster_schedule_to').datepicker();
});


function pass(device_id){
    console.log("comess here "+device_id)
    text_content = $('.msg').val();
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_shutdown(device_id){
    console.log("comess here "+device_id)
    text_content = "shutdown"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_reboot(device_id){
    console.log("comess here "+device_id)
    text_content = "reboot"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_lock(device_id){
    console.log("comess here "+device_id)
    text_content = "lock"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_unlock(device_id){
    console.log("comess here "+device_id)
    text_content = "unlock"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_datawipe(device_id){
    console.log("comess here "+device_id)
    text_content = "datawipe"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_systemwipe(device_id){
    console.log("comess here "+device_id)
    text_content = "systemwipe"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function pass_test(device_id){
    console.log("comess here "+device_id)
    text_content = "test"
    alert(text_content)
    $.ajax({
      url: "/devices/"+device_id+"/post_text",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};

function push_ad(cluster_id){
    console.log("comess here "+cluster_id)
    text_content = "testing vedio and image push"
    alert(cluster_id)
    $.ajax({
      url: "/clusters/"+cluster_id+"/push_ad",
      type: "GET",
      data: {msg: text_content},
      dataType:'script'
    });

};


