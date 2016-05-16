<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
    <style>
        .ui-page {
            background:#595959;
        }
        .myButtonStyle
        {
            border-radius: 25px;
            padding :20px;

        }
        .textNegative
        {
            color:white;
            text-shadow:0 2px 0 #000000;
        }
        .textNormal
        {
            color:black;
            text-shadow:0 2px 0 #ffffff;
        }
        [data-role=footer]{bottom:0; position:absolute !important; top: auto !important; width:100%;}
    </style>
    <script type="text/javascript">


        function clearWhatToDoTextArea()
        {
            document.getElementById("itemText").value = "";
            document.getElementById("itemTitle").value = "";
        }

        function clearAllAddAreas()
        {
            document.getElementById("itemText").value = "";
            document.getElementById("itemTitle").value = "";
            document.getElementById("ItemFinalDate").value = "";
        }

        toDoListItem = function (title, whatToDo, creationDate, deadLine) {
            this.Title = title;
            this.WhatToDo = whatToDo;
            this.DeadLine = deadLine;
            this.CreationDate = creationDate;

        }



        var toDoListItemList = [new toDoListItem("Buy Milk","buy 3% milk from the supermarket","18/04/2016","20/04/2016"),new toDoListItem("Pick up Sister","Pick up my sister from school, Ashdod Ha-Yarden st. 38","18/04/2016","22/04/2016")];

        function ShowItems()
        {
            var place = document.getElementById("listPlace");
            place.innerHTML = "";
            for(var i=0; i < toDoListItemList.length; i++)
            {

                var newhtml = "";
                newhtml += "<div id='itemDiv_"+i+"' style='width:100%;background-color:#ffffff;border-radius:20px'>";
                newhtml += "<div style='width:100%;background-color:#1a1a1a;border-top-right-radius:20px;'>";
                newhtml += "<p class='textNegative' id='itemDate_"+i+"' style='margin-left:10px;padding-top:10px;'>" + toDoListItemList[i].DeadLine + "</p>";
                newhtml += "<h3 id='itemTitle_"+i+"' class='textNegative' style='margin-left:10px;'>" + toDoListItemList[i].Title + "</h3>";
                newhtml += "</div>";
                newhtml += "<div style='width:100%;border-bottom-left-radius:20px;'>";
                newhtml += "<p class='textNormal' id='itemText_"+i+"' style='margin-left:10px'>" + toDoListItemList[i].WhatToDo + "</p>";
                newhtml += "</div>";
                newhtml += "<div style='width:100%;border-bottom-left-radius:20px;background-color:white'>";
                newhtml += "<p class='textNormal' style='margin-left:10px'><b>Created on: " + toDoListItemList[i].CreationDate + "</b></p></div>";
                newhtml += "<a href='#editMemo' style='border-radius:20px;margin-left:10px;margin-right:10px;background-color:#404040' class='ui-btn' onclick='OpenEditItem("+i+")' data-transition='slide'>Edit</a>";
                newhtml += "<a style='border-radius:20px;margin-left:10px;margin-right:10px;background-color:#800000' class='ui-btn' onclick='DeleteItem("+i+")'>Delete</a>";
                newhtml += "<br></div>"
                place.innerHTML += newhtml;
            }
            place.innerHTML += "<br><br>";
        }

        function DeleteItem(index)
        {
            if (index > -1) {
                toDoListItemList.splice(index, 1);
            }
            ShowItems();
        }

        function OpenEditItem(index)
        {
            document.getElementById("itemTitleEdit").value = document.getElementById("itemTitle_"+index).innerHTML;
            document.getElementById("itemTextEdit").value = document.getElementById("itemText_"+index).innerHTML;

            var Unformattedline = document.getElementById("itemDate_"+index).innerHTML;
            var deadlineDD = Unformattedline.slice(0,2);
            var deadlineMM = Unformattedline.slice(3,5);
            var deadlineYYYY = Unformattedline.slice(6,10);

            document.getElementById("ItemFinalDateEdit").value = deadlineYYYY + "-" + deadlineMM + "-" + deadlineDD;
        }

        function AddItemToList()
        {

            var newItem = new toDoListItem();
            newItem.Title = document.getElementById("itemTitle").value;
            newItem.WhatToDo = document.getElementById("itemText").value;

            var Unfixeddeadline = document.getElementById("ItemFinalDate").value;
            var deadlineDD = Unfixeddeadline.slice(8,10);
            var deadlineMM = Unfixeddeadline.slice(5,7);
            var deadlineYYYY = Unfixeddeadline.slice(0,4);

            newItem.DeadLine = deadlineDD + "/" + deadlineMM + "/" + deadlineYYYY;

            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth()+1; //January is 0!
            var yyyy = today.getFullYear();

            if(dd<10) {
                dd='0'+dd
            }

            if(mm<10) {
                mm='0'+mm
            }

            today = mm+'/'+dd+'/'+yyyy;
            newItem.CreationDate = today;


            toDoListItemList.push(newItem);
            ShowItems();
            clearAllAddAreas();
        }

    </script>

</head>
<body>
<div data-role="page" data-theme="b" id="LoginPage">
    <div data-role="header">
        <h1>To Do List App:</h1>
    </div>

    <div data-role="main" class="ui-content">
        <form name="logInForm">
            <input type="text" data-clear-btn="true" placeholder="Username" >
            <input type="password" data-clear-btn="true" placeholder="Password" >
            <a href="#MainPage" class="ui-btn" data-transition="slide">Log In</a>
        </form>
    </div>

    <div data-role="footer">
        <h1>All Rights Reserved to J&R Inc.</h1>
    </div>
</div>

<div data-role="page" data-theme="b" id="MainPage">
    <div data-role="header">
        <h1>Welcome User</h1>
    </div>

    <div data-role="main" class="ui-content">
        <div data-role="controlgroup" data-type="horizontal" >
            <a href="#addMemo" class="ui-btn ui-icon-check ui-btn-icon-left ui-shadow ui-corner-all" style="background-color:#808080;color:white;text-shadow:0 2px 0 #000000" data-transition="slide">Add</a>
            <a href="#LoginPage" class="ui-btn ui-icon-delete ui-btn-icon-left" style="background-color:#4d0000;color:white;text-shadow:0 2px 0 #000000" data-transition="slide" data-direction="reverse">Log Out</a>
        </div>

        <input type="search" id="searchBar" name="searchBar" id="search-basic" value="" placeholder="Search Memo's" />

        <div id="listPlace" style="width:100%;margin:auto;border-radius: 20px;">

        </div>

    </div>


    <br>

    <div data-role="footer">
        <h1>All Rights Reserved to J&R Inc.</h1>
    </div>
</div>


<div data-role="page" data-theme="b" id="addMemo">
    <div data-role="header">
        <h1><b>Add</b></h1>
    </div>

    <div data-role="main" class="ui-content">

        <div data-role="controlgroup" data-type="horizontal" >
            <a href="#MainPage" class="ui-btn ui-icon-back ui-btn-icon-left" style="background-color:#808080;color:white;text-shadow:0 2px 0 #000000" data-transition="slide" data-direction="reverse">Return</a>
            <a href="#LoginPage" class="ui-btn ui-icon-delete ui-btn-icon-left" style="background-color:#4d0000;color:white;text-shadow:0 2px 0 #000000" data-transition="slide" data-direction="reverse">Log Out</a>
        </div>

        <form>
            <input name="itemTitle" id="itemTitle" type="text" data-clear-btn="true" placeholder="Title" >
            <textarea data-clear-btn="true" placeholder="What to do..." name="itemText" id="itemText"></textarea>
            <input type="button" style="background-color:white" value="Clear" onclick="clearWhatToDoTextArea()" >
            <label for="itemFinalDate">Select Deadline Date:</label>
            <input type="date" name="itemFinalDate" id="ItemFinalDate">
            <a href="#MainPage" class="ui-btn ui-icon-check ui-btn-icon-left ui-shadow ui-corner-all" style="background-color:#001a00" data-transition="slide" data-direction="reverse" onclick="AddItemToList()">Add</a>

        </form>

    </div>

    <div data-role="footer">
        <h1>All Rights Reserved to J&R Inc.</h1>
    </div>
</div>

<div data-role="page" data-theme="b" id="editMemo">
    <div data-role="header">
        <h1><b>Edit</b></h1>
    </div>

    <div data-role="main" class="ui-content">

        <div data-role="controlgroup" data-type="horizontal" >
            <a href="#MainPage" class="ui-btn ui-icon-back ui-btn-icon-left" style="background-color:#808080;color:white;text-shadow:0 2px 0 #000000" data-transition="slide" data-direction="reverse">Return</a>
            <a href="#LoginPage" class="ui-btn ui-icon-delete ui-btn-icon-left" style="background-color:#4d0000;color:white;text-shadow:0 2px 0 #000000" data-transition="slide" data-direction="reverse">Log Out</a>
        </div>

        <form>
            <input name="itemTitleEdit" id="itemTitleEdit" type="text" data-clear-btn="true" placeholder="Title" >
            <textarea data-clear-btn="true" placeholder="What to do..." name="itemTextEdit" id="itemTextEdit"></textarea>
            <input type="button" style="background-color:white" value="Clear" onclick="clearWhatToDoTextArea()" >
            <label for="ItemFinalDateEdit">Select Deadline Date:</label>
            <input type="date" name="itemFinalDate" id="ItemFinalDateEdit">
            <a href="#MainPage" class="ui-btn ui-icon-check ui-btn-icon-left ui-shadow ui-corner-all" style="background-color:#001a00" data-transition="slide" data-direction="reverse" onclick="">Edit</a>

        </form>

        <script>

        </script>

    </div>

    <div data-role="footer">
        <h1>All Rights Reserved to J&R Inc.</h1>
    </div>
</div>
<script>
    ShowItems();
</script>
</body>
</html>