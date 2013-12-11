$(document).ready(function(){
  
  $('.bxslider').bxSlider();
  $('#cou').change(function() {
    var cid = $(this).val();
    $.get( "/malls/show_state",{ id: cid}, function( data ) {
    $('#sta').html(data);
    });
  });

 $('#sta').change(function() {
    var sid = $(this).val();
    $.get( "/malls/show_city",{ id: sid}, function( data ) {
    $('#cit').html(data);
    });
  });

  $('#cous').change(function() {
    var cid = $(this).val();
    $.get( "/malls/show_state",{ id: cid}, function( data ) {
      $('#stas').html(data);
    });
  });

  $('#stas').change(function() {
    var sid = $(this).val();
    $.get( "/malls/show_city",{ id: sid}, function( data ) {
      $('#cits').html(data);
    });
  });


  $('#cits').change(function() {
    var cid = $(this).val();
    $.get( "/shops/show_mall",{ id: cid}, function( data ) {
      $('#mals').html(data);
    });
  });
  
  total_amount();
  });


function change_subtotal(price,id)
{
  var val= $("#num_field-"+id).val();
  $("#subtotal-"+id).text(val*price);
  total_amount(id);
}

function total_amount()
{
  var rows = $("#table td:nth-child(5)");
  amt = 0;
  for(var i = 0; i < rows.length; i++)
    {
      amt = amt + parseInt(rows[i].textContent);
    }
  $("#payble_amount").text("Total payable amount :" + amt);
}

function validateFormcategory()
{
  var x = $("#name").val();
  if(x=="")
  {
  alert("category can't be empty");
  return false;
  }
}

function validateFormmall()
{
  var temp=true;
  var cou = $("#cou").val();
  var sta = $("#sta").val();
  var cit = $("#cit").val();
  var name = $("#name").val();
  if(cou=="" || sta=="" || cit=="" || name=="")
  {
    $("#show_msg").text("Fill all necessary(*) fields");
    temp=false;
  }
  return temp;
}


function validateFormoffer()
{
  var temp=true; 
  var sdate = $("#sdate").val();
  var category = $("#category").val();
  var message = $("#message").val();
  if(sdate == "" || category == "" || message == "")
  {
    $("#show_msg").text("Fill all necessary (*) fields");
    temp=false;
  }
  return temp;
}

  
function validateFormproduct()
{
  
  var temp=true;
  
  var name = $("#name").val();
  var cate = $("#cate").val();
  var pric = $("#pric").val();
  var imag = $("#imag").val();
  if(name=="" || cate=="" || pric=="" || imag=="")
  {
    $("#show_msg").text("Fill all necessary(*) fields");
    temp=false;
  }
  return temp;
}

  
function validateFormshop()
{
  var temp=true;
  var cou = $("#cous").val();
  var sta = $("#stas").val();
  var cit = $("#cits").val();
  var mal = $("#mals").val();
  var name = $("#names").val();
  
  if(cou == "" || sta == "" || cit == "" || mal == "" || name == "")
  {
    $("#show_msg").text("Fill all necessary (*) fields");
    temp=false;
  }
  return temp;
}


function validateFormuser()
{
  var temp=true;
  var fname = $("#fname").val();
  var lname = $("#lname").val();
  var dob = $("#dob").val();  
  if(fname=="" || lname=="" || dob=="")
  {
    temp=false;
    $("#msg").text("Fill all necessary (*) fields");
  }
  return temp;
}

function add(pid)
{
  var url = "/carts/" + pid +"/add_to_cart"
  $.get( url, function( data ) {
  $('#ch').html(data);
  });
}

