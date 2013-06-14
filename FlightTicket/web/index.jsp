<%-- 
    Document   : index
    Created on : Jun 10, 2013, 9:05:50 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Flight Ticket</title>
        <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
        <!--[if IE]>
        <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
        <![endif]-->

        <!--  jquery core -->
        <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

        <!--  checkbox styling script -->
        <script src="js/jquery/ui.core.js" type="text/javascript"></script>
        <script src="js/jquery/ui.checkbox.js" type="text/javascript"></script>
        <script src="js/jquery/jquery.bind.js" type="text/javascript"></script>
        

        <![if !IE 7]>

        <!--  styled select box script version 1 -->
        <script src="js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect').selectbox({ inputClass: "selectbox_styled" });
            });
        </script>


        <![endif]>


        <!--  styled select box script version 2 --> 
        <script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect_form_1').selectbox({ inputClass: "styledselect_form_1" });
                $('.styledselect_form_2').selectbox({ inputClass: "styledselect_form_2" });
            });
        </script>

        <!--  styled select box script version 3 --> 
        <script src="js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('.styledselect_pages').selectbox({ inputClass: "styledselect_pages" });
            });
        </script>

        <!--  styled file upload script --> 
        <script src="js/jquery/jquery.filestyle.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            $(function() {
                $("input.file_1").filestyle({ 
                    image: "images/forms/upload_file.gif",
                    imageheight : 29,
                    imagewidth : 78,
                    width : 300
                });
            });
        </script>

        <!-- Custom jquery scripts -->
        <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

        <!-- Tooltips -->
        <script src="js/jquery/jquery.tooltip.js" type="text/javascript"></script>
        <script src="js/jquery/jquery.dimensions.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $('a.info-tooltip ').tooltip({
                    track: true,
                    delay: 0,
                    fixPNG: true, 
                    showURL: false,
                    showBody: " - ",
                    top: -35,
                    left: 5
                });
            });
        </script> 

        <!--  date picker script -->
        <link rel="stylesheet" href="css/datePicker.css" type="text/css" />
        <script src="js/jquery/date.js" type="text/javascript"></script>
        <script src="js/jquery/jquery.datePicker.js" type="text/javascript"></script>
        <script type="text/javascript" charset="utf-8">
            $(function()
            {

                // initialise the "Select date" link
                $('#date-pick')
                .datePicker(
                // associate the link with a date picker
                {
                    createButton:false,
                    startDate:'01/01/2005',
                    endDate:'31/12/2020'
                }
            ).bind(
                // when the link is clicked display the date picker
                'click',
                function()
                {
                    updateSelects($(this).dpGetSelected()[0]);
                    $(this).dpDisplay();
                    return false;
                }
            ).bind(
                // when a date is selected update the SELECTs
                'dateSelected',
                function(e, selectedDate, $td, state)
                {
                    updateSelects(selectedDate);
                }
            ).bind(
                'dpClosed',
                function(e, selected)
                {
                    updateSelects(selected[0]);
                }
            );
	
                var updateSelects = function (selectedDate)
                {
                    var selectedDate = new Date(selectedDate);
                    $('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
                    $('#m option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
                    $('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
                }
                // listen for when the selects are changed and update the picker
                $('#d, #m, #y')
                .bind(
                'change',
                function()
                {
                    var d = new Date(
                    $('#y').val(),
                    $('#m').val()-1,
                    $('#d').val()
                );
                    $('#date-pick').dpSetSelected(d.asString());
                }
            );

                // default the position of the selects to today
                var today = new Date();
                updateSelects(today.getTime());

                // and update the datePicker to reflect it...
                $('#d').trigger('change');
            });
        </script>

        <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
        <script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $(document).pngFix( );
            });
        </script>

        <script>
            $(function() {
                $('nav a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('active');
            });
        </script>
    </head>
    <body>
        <!-- start content-outer -->
        <div>
            <!-- start content -->
            <div>


                <div id="page-heading"><h1>Ticket Order</h1></div>


                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <th rowspan="3" class="sized"><img src="images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
                        <th class="topleft"></th>
                        <td id="tbl-border-top">&nbsp;</td>
                        <th class="topright"></th>
                        <th rowspan="3" class="sized"><img src="images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
                    </tr>
                    <tr>
                        <td id="tbl-border-left"></td>
                        <td>
                            <!--  start content-table-inner -->
                            <div id="content-table-inner">

                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr valign="top">
                                        <td>
                                            <form name="form1" method="post" action="Search" onsubmit="return validate();">
                                                <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
                                                    <th valign="top">Search Tickets</th>
                                                    <tr>
                                                        <td><input name="isReturn" value="true" checked="checked" id="isReturn" type="radio" ><b>One Way</b></td>
                                                        <td><input name="isReturn" value="false"  id="isReturn"  type="radio" ><b>Return</b></td>

                                                    </tr>
                                                    <tr>
                                                        <th valign="top">From</th>
                                                        <td>	
                                                            <select  class="styledselect_form_1" id="selectOrigin" name="from">
                                                                <option value="">Origin</option>
                                                                <option value="">---------------------------</option>
                                                                <option value="AMQ" >Ambon (AMQ)</option>
                                                                <option value="BPN" >Balikpapan (BPN)</option>
                                                                <option value="BTJ" >Banda Aceh (BTJ)</option>
                                                                <option value="BDO" >Bandung (BDO)</option>
                                                                <option value="BDJ" >Banjarmasin (BDJ)</option>
                                                                <option value="BTH" >Batam (BTH)</option>
                                                                <option value="BKS" >Bengkulu (BKS)</option>
                                                                <option value="BEJ" >Berau (BEJ)</option>
                                                                <option value="BIK" >Biak (BIK)</option>
                                                                <option value="DPS" >Denpasar (DPS)</option>
                                                                <option value="DIL" >Dili (DIL)</option>
                                                                <option value="GTO" >Gorontalo (GTO)</option>
                                                                <option value="CGK" >Jakarta (CGK)</option>
                                                                <option value="DJB" >Jambi (DJB)</option>
                                                                <option value="DJJ" >Jayapura (DJJ)</option>
                                                                <option value="KDI" >Kendari (KDI)</option>
                                                                <option value="KOE" >Kupang (KOE)</option>
                                                                <option value="TKG" >Lampung (TKG)</option>
                                                                <option value="LUW" >Luwuk (LUW)</option>
                                                                <option value="MLG" >Malang (MLG)</option>
                                                                <option value="MJU" >Mamuju (MJU)</option>
                                                                <option value="MDC" >Manado (MDC)</option>
                                                                <option value="MKW" >Manokwari (MKW)</option>
                                                                <option value="MES" >Medan (MES)</option>
                                                                <option value="PDG" >Padang (PDG)</option>
                                                                <option value="PKY" >Palangkaraya (PKY)</option>
                                                                <option value="PLM" >Palembang (PLM)</option>
                                                                <option value="PLW" >Palu (PLW)</option>
                                                                <option value="PGK" >Pangkalpinang (PGK)</option>
                                                                <option value="PKU" >Pekanbaru (PKU)</option>
                                                                <option value="PEN" >Penang (PEN)</option>
                                                                <option value="PNK" >Pontianak (PNK)</option>
                                                                <option value="SRG" >Semarang (SRG)</option>
                                                                <option value="SIN" >Singapore (SIN)</option>
                                                                <option value="SOC" >Solo (SOC)</option>
                                                                <option value="SOQ" >Sorong (SOQ)</option>
                                                                <option value="SUB" >Surabaya (SUB)</option>
                                                                <option value="TJQ" >Tanjung Pandan (TJQ)</option>
                                                                <option value="TNJ" >Tanjung Pinang (TNJ)</option>
                                                                <option value="TRK" >Tarakan (TRK)</option>
                                                                <option value="TTE" >Ternate (TTE)</option>
                                                                <option value="UPG" >Ujung Pandang (UPG)</option>
                                                                <option value="JOG" >Yogyakarta (JOG)</option>
                                                            </select>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">To</th>
                                                        <td>	
                                                            <select  class="styledselect_form_1" id="selectOrigin" name="to">
                                                                <option value="">Destination</option>
                                                                <option value="">---------------------------</option>
                                                                <option value="AMQ" >Ambon (AMQ)</option>
                                                                <option value="BPN" >Balikpapan (BPN)</option>
                                                                <option value="BTJ" >Banda Aceh (BTJ)</option>
                                                                <option value="BDO" >Bandung (BDO)</option>
                                                                <option value="BDJ" >Banjarmasin (BDJ)</option>
                                                                <option value="BTH" >Batam (BTH)</option>
                                                                <option value="BKS" >Bengkulu (BKS)</option>
                                                                <option value="BEJ" >Berau (BEJ)</option>
                                                                <option value="BIK" >Biak (BIK)</option>
                                                                <option value="DPS" >Denpasar (DPS)</option>
                                                                <option value="DIL" >Dili (DIL)</option>
                                                                <option value="GTO" >Gorontalo (GTO)</option>
                                                                <option value="CGK" >Jakarta (CGK)</option>
                                                                <option value="DJB" >Jambi (DJB)</option>
                                                                <option value="DJJ" >Jayapura (DJJ)</option>
                                                                <option value="KDI" >Kendari (KDI)</option>
                                                                <option value="KOE" >Kupang (KOE)</option>
                                                                <option value="TKG" >Lampung (TKG)</option>
                                                                <option value="LUW" >Luwuk (LUW)</option>
                                                                <option value="MLG" >Malang (MLG)</option>
                                                                <option value="MJU" >Mamuju (MJU)</option>
                                                                <option value="MDC" >Manado (MDC)</option>
                                                                <option value="MKW" >Manokwari (MKW)</option>
                                                                <option value="MES" >Medan (MES)</option>
                                                                <option value="PDG" >Padang (PDG)</option>
                                                                <option value="PKY" >Palangkaraya (PKY)</option>
                                                                <option value="PLM" >Palembang (PLM)</option>
                                                                <option value="PLW" >Palu (PLW)</option>
                                                                <option value="PGK" >Pangkalpinang (PGK)</option>
                                                                <option value="PKU" >Pekanbaru (PKU)</option>
                                                                <option value="PEN" >Penang (PEN)</option>
                                                                <option value="PNK" >Pontianak (PNK)</option>
                                                                <option value="SRG" >Semarang (SRG)</option>
                                                                <option value="SIN" >Singapore (SIN)</option>
                                                                <option value="SOC" >Solo (SOC)</option>
                                                                <option value="SOQ" >Sorong (SOQ)</option>
                                                                <option value="SUB" >Surabaya (SUB)</option>
                                                                <option value="TJQ" >Tanjung Pandan (TJQ)</option>
                                                                <option value="TNJ" >Tanjung Pinang (TNJ)</option>
                                                                <option value="TRK" >Tarakan (TRK)</option>
                                                                <option value="TTE" >Ternate (TTE)</option>
                                                                <option value="UPG" >Ujung Pandang (UPG)</option>
                                                                <option value="JOG" >Yogyakarta (JOG)</option>
                                                            </select>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Depart</th>
                                                        <td class="noheight">

                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr  valign="top">
                                                                    <td>
                                                                        <form id="chooseDateForm" action="#">

                                                                            <select id="d" class="styledselect-day" name="departDate">
                                                                                <option value="">dd</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6" selected="selected">6</option>
                                                                                <option value="7">7</option>
                                                                                <option value="8">8</option>
                                                                                <option value="9">9</option>
                                                                                <option value="10">10</option>
                                                                                <option value="11">11</option>
                                                                                <option value="12">12</option>
                                                                                <option value="13">13</option>
                                                                                <option value="14">14</option>
                                                                                <option value="15">15</option>
                                                                                <option value="16">16</option>
                                                                                <option value="17">17</option>
                                                                                <option value="18">18</option>
                                                                                <option value="19">19</option>
                                                                                <option value="20">20</option>
                                                                                <option value="21">21</option>
                                                                                <option value="22">22</option>
                                                                                <option value="23">23</option>
                                                                                <option value="24">24</option>
                                                                                <option value="25">25</option>
                                                                                <option value="26">26</option>
                                                                                <option value="27">27</option>
                                                                                <option value="28">28</option>
                                                                                <option value="29">29</option>
                                                                                <option value="30">30</option>
                                                                                <option value="31">31</option>
                                                                            </select>
                                                                    </td>
                                                                    <td>
                                                                        <select id="m" class="styledselect-month" name="departMonth">
                                                                            <option value="">mmm</option>
                                                                            <option value="1">Jan</option>
                                                                            <option value="2">Feb</option>
                                                                            <option value="3">Mar</option>
                                                                            <option value="4">Apr</option>
                                                                            <option value="5" selected="selected">May</option>
                                                                            <option value="6">Jun</option>
                                                                            <option value="7">Jul</option>
                                                                            <option value="8">Aug</option>
                                                                            <option value="9">Sep</option>
                                                                            <option value="10">Oct</option>
                                                                            <option value="11">Nov</option>
                                                                            <option value="12">Dec</option>
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <select  id="y"  class="styledselect-year" name="departYear">
                                                                            <option value="">yyyy</option>
                                                                            <option value="2005">2005</option>
                                                                            <option value="2006">2006</option>
                                                                            <option value="2007">2007</option>
                                                                            <option value="2008">2008</option>
                                                                            <option value="2009">2009</option>
                                                                            <option value="2010">2010</option>
                                                                            <option value="2011">2011</option>
                                                                            <option value="2012">2012</option>
                                                                            <option value="2013" selected="selected">2013</option>
                                                                            <option value="2014">2014</option>
                                                                        </select>
                                                                    </td>
                                                                    <td><a href=""  id="date-pick"><img src="images/forms/icon_calendar.jpg"   alt="" /></a></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Return</th>
                                                        <td class="noheight">

                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr  valign="top">
                                                                    <td>
                                                                        <form id="chooseDateForm" action="#">

                                                                            <select id="d" class="styledselect-day" name="returnDate">
                                                                                <option value="">dd</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6" selected="selected">6</option>
                                                                                <option value="7">7</option>
                                                                                <option value="8">8</option>
                                                                                <option value="9">9</option>
                                                                                <option value="10">10</option>
                                                                                <option value="11">11</option>
                                                                                <option value="12">12</option>
                                                                                <option value="13">13</option>
                                                                                <option value="14">14</option>
                                                                                <option value="15">15</option>
                                                                                <option value="16">16</option>
                                                                                <option value="17">17</option>
                                                                                <option value="18">18</option>
                                                                                <option value="19">19</option>
                                                                                <option value="20">20</option>
                                                                                <option value="21">21</option>
                                                                                <option value="22">22</option>
                                                                                <option value="23">23</option>
                                                                                <option value="24">24</option>
                                                                                <option value="25">25</option>
                                                                                <option value="26">26</option>
                                                                                <option value="27">27</option>
                                                                                <option value="28">28</option>
                                                                                <option value="29">29</option>
                                                                                <option value="30">30</option>
                                                                                <option value="31">31</option>
                                                                            </select>
                                                                    </td>
                                                                    <td>
                                                                        <select id="m" class="styledselect-month" name="returnMonth">
                                                                            <option value="">mmm</option>
                                                                            <option value="1">Jan</option>
                                                                            <option value="2">Feb</option>
                                                                            <option value="3">Mar</option>
                                                                            <option value="4">Apr</option>
                                                                            <option value="5" selected="selected">May</option>
                                                                            <option value="6">Jun</option>
                                                                            <option value="7">Jul</option>
                                                                            <option value="8">Aug</option>
                                                                            <option value="9">Sep</option>
                                                                            <option value="10">Oct</option>
                                                                            <option value="11">Nov</option>
                                                                            <option value="12">Dec</option>
                                                                        </select>
                                                                    </td>
                                                                    <td>
                                                                        <select  id="y"  class="styledselect-year" name="returnYear">
                                                                            <option value="">yyyy</option>
                                                                            <option value="2005">2005</option>
                                                                            <option value="2006">2006</option>
                                                                            <option value="2007">2007</option>
                                                                            <option value="2008">2008</option>
                                                                            <option value="2009">2009</option>
                                                                            <option value="2010">2010</option>
                                                                            <option value="2011">2011</option>
                                                                            <option value="2012">2012</option>
                                                                            <option value="2013" selected="selected">2013</option>
                                                                            <option value="2014">2014</option>
                                                                        </select>
                                                                    </td>
                                                                    <td><a href=""  id="date-pick"><img src="images/forms/icon_calendar.jpg"   alt="" /></a></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <th valign="top">Number of Passenger</th>
                                                    <tr>
                                                        <th valign="top">Adult<span>(>12 years)</span></th>
                                                        <td class="noheight">

                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr  valign="top">
                                                                    <td>
                                                                        <form id="chooseDateForm" action="#">

                                                                            <select id="adult" name="adult" class="styledselect-day">
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6">6</option>
                                                                                <option value="7">7</option>
                                                                                <option value="8">8</option>
                                                                                <option value="9">9</option>
                                                                            </select>
                                                                    </td>
                                                                </tr>

                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Child<span>(2 - 12 years)</span></th>
                                                        <td class="noheight">

                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr  valign="top">
                                                                    <td>
                                                                        <form id="chooseDateForm" action="#">

                                                                            <select id="child" name="child" class="styledselect-day">
                                                                                <option value="0" selected="selected">0</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6">6</option>
                                                                                <option value="7">7</option>
                                                                                <option value="8">8</option>
                                                                                <option value="9">9</option>
                                                                            </select>
                                                                    </td>
                                                                </tr>

                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th valign="top">Infant<span>(3month - 2years)</span></th>
                                                        <td class="noheight">

                                                            <table border="0" cellpadding="0" cellspacing="0">
                                                                <tr  valign="top">
                                                                    <td>
                                                                        <form id="chooseDateForm" action="#">

                                                                            <select id="infant" name="infant" class="styledselect-day">
                                                                                <option value="0" selected="selected">0</option>
                                                                                <option value="1">1</option>
                                                                                <option value="2">2</option>
                                                                                <option value="3">3</option>
                                                                                <option value="4">4</option>
                                                                                <option value="5">5</option>
                                                                                <option value="6">6</option>
                                                                                <option value="7">7</option>
                                                                                <option value="8">8</option>
                                                                                <option value="9">9</option>
                                                                            </select>
                                                                    </td>
                                                                </tr>

                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th>&nbsp;</th>
                                                        <td valign="top">
                                                            <input type="submit" name="submit" class="form-submit"/>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                                <!-- end id-form  -->
                                            </form>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><img src="images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
                                        <td></td>
                                    </tr>
                                </table>




                                <div class="clear"></div>


                            </div>
                            <!--  end content-table-inner  -->
                        </td>
                        <td id="tbl-border-right"></td>
                    </tr>
                    <tr>
                        <th class="sized bottomleft"></th>
                        <td id="tbl-border-bottom">&nbsp;</td>
                        <th class="sized bottomright"></th>
                    </tr>
                </table>

                <div class="clear">&nbsp;</div>

            </div>
            <!--  end content -->
            <div class="clear">&nbsp;</div>
        </div>
        <!--  end content-outer -->

    </body>
</html>
