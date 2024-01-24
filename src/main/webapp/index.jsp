<%@ page import="itmo.project.bean.Entry" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="entries" class="itmo.project.bean.EntriesBean" scope="session"/>
<head>
    <link rel="stylesheet" href="style.css"/>
    <meta charset="UTF-8"/>
    <title></title>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<div class="header">
    <span>A</span>
    <span>Danil Emelin</span>
    <span>Group-P3208</span>
    <span>Variant-1804</span>
</div>
<div class="centered-container">
    <div class="main-container">
        <div class="left-side">
            <div class="x">
                <div class="header_x" style="width: 120px">
                    <p>X</p>
                </div>
                <div class="choices-x">
                    <div class="">
                        <input type="checkbox" id="n_three" name="num" value="-3"/>
                        <label for="n_three">-3</label>
                    </div>
                    <div>
                        <input type="checkbox" id="n_two" name="num" value="-2"/>
                        <label for="n_two">-2</label>
                    </div>
                    <div>
                        <input type="checkbox" id="n_one" name="num" value="-1"/>
                        <label for="n_one">-1</label>
                    </div>
                    <div>
                        <input type="checkbox" id="zero" name="num" value="0"/>
                        <label for="zero">0</label>
                    </div>
                    <div>
                        <input type="checkbox" id="p_one" name="num" value="1"/>
                        <label for="p_one">1</label>
                    </div>
                    <div>
                        <input type="checkbox" id="p_two" name="num" value="2"/>
                        <label for="p_two">2</label>
                    </div>
                    <div>
                        <input type="checkbox" id="p_three" name="num" value="3"/>
                        <label for="p_three">3</label>
                    </div>
                    <div>
                        <input type="checkbox" id="p_four" name="num" value="4"/>
                        <label for="p_four">4</label>
                    </div>
                    <div>
                        <input type="checkbox" id="p_five" name="num" value="5"/>
                        <label for="p_five">5</label>
                    </div>
                </div>
            </div>
            <div class="y">
                <div class="header_y">
                    <p>Y</p>
                </div>
                <div class="input-y">
                    <input
                            title="Write value between -5 and 3"
                            type="text"
                            inputmode="numeric"
                            pattern="(\+\d\.\d+)|(\+\d+)|(-\d+)|(\d*)|(\d*\.\d+)|(-\d+.\d+)"
                            id="name"
                            name="input-y"
                            placeholder="Enter y value [-5; 3]"
                            maxlength="10"
                            style="width: 152px"
                    />
                </div>
            </div>

            <div class="r">
                <div class="header_r">
                    <p>R</p>
                </div>
                <div class="buttons">
                    <button type="button" class="b" value="1">1</button>
                    <button type="button" class="b" value="1.5">1.5</button>
                    <button type="button" class="b" value="2">2</button>
                    <button type="button" class="b" value="2.5">2.5</button>
                    <button type="button" class="b" value="3">3</button>
                </div>
            </div>
            <button type="button" id="button-send" name="send">send</button>
            <button type="button" id="clearing" onclick="removeAllElements()">clear</button>
        </div>
        <div class="photo right_side">
            <canvas id="graph" width="300" height="300"></canvas>
        </div>
    </div>

    <div class="ass">
        <div class="table_result">
            <table id="results" style="max-height: 1px ; overflow: auto;">
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Request Time</th>
                    <th>Response Time</th>
                    <th>In range</th>
                    <th>Execution time</th>
                </tr>
                <%
                    for (int i = 0; i < entries.getEntryList().size(); i++) {
                        Entry row =  entries.getEntryList().get(i);
                %>
                <tr>
                    <td><%= row.getX()%></td>
                    <td><%= row.getY()%></td>
                    <td><%= row.getR()%></td>
                    <td><%= row.getRequestTime()%></td>
                    <td><%= row.getResponseTime()%></td>
                    <td><%= row.isInRange()%>
                    <td><%= row.getExecutionTime()%>
                    </td>
                </tr>
                <% }%>
            </table>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/script.js"></script>
<script src="js/graphElement.js"></script>
<script src="js/drawing.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</body>
