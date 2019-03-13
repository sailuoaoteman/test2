<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/themes/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>
    <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <script type="text/javascript" src="https://www.echartsjs.com/gallery/vendors/echarts/map/js/china.js?_v_=1548453451319"></script>

<script type="text/javascript">

    $(function() {

        $('#tab').treegrid({
            title:"专辑",
            fit : true,// 适应父容器
            fitColumns : true, // 自动计算列宽
            url :'${pageContext.request.contextPath }/works /showAll.do',
            idField:'id',
            treeField:'title',
            remoteSort:false,
            singleSelect:true,
            nowrap:false,
            columns:[[
                {field :'id',width:280,},
                {field :'title',width:280,title:'专辑名称'},
                {field :'url',width:280,title:'下载路径'},

            ]],
            toolbar:[

                {
                    text : '添加音频',
                    iconCls : 'icon-add',
                    handler : function() {
                        $("#fom3").form({
                            url:'${pageContext.request.contextPath }/works/add',
                            onSubmit:function(){
                                return $('#fom3').form('validate');
                            },
                            success:function(){
                                $("#div3").dialog("close");
                                $("#tab").datagrid("reload");
                            },
                            ajax:true,
                        });

                        $('#div3').dialog({
                            title:'添加章节',
                            width:400,
                            height:230,
                            modal:true,
                            buttons:[{
                                text:"提交",
                                iconCls:'icon-ok',
                                handler:function(){
                                    $("#fom3").submit();
                                    alert("添加成功，请刷新页面");
                                    $("#tab").datagrid("reload");
                                },
                            }],

                        });
                    }
                },



                {
                    text:'下载章节',
                    iconCls: 'icon-help',
                    handler: function(){
                        var obj = $("#tab").treegrid("getSelected");
                        if(obj == null||obj.size == null){
                            alert("请选择章节！");
                        }else{
                            location.href="${pageContext.request.contextPath}/works/download?title="+obj.title
                        }

                    }
                }
            ],

            /*pagination : true,
            pagePosition : 'bottom', // 设置分页工具栏的位置 top bottom both
            pageNumber : 1, // 默认展示的是第几页
            pageSize : 25,// pageSize的值 ， 必须是pageList中的一个选项
            pageList : [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,25],// 定义每页展示条数的选项*/

        });

    });

</script>

</head>
<body class="easyui-layout">
<table id="tab" > </table>

<div id="div3" style="display:none;">

    <form method="POST" id="fom3" enctype="multipart/form-data">
        <div><h3>名字：</h3></div>
        <input class="easyui-textbox" name="title" id="title1" style="width:80%;height:30px"/><br />

        <div><h3>文件：</h3></div>
        <input  type="file" name="addFile" id="url" style="width:80%;height:30px"/><br />

    </form>

</div>
</body>
</html>




