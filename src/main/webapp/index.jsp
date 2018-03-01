<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="${pageContext.request.contextPath}/bower_components/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bower_components/font-awesome/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <title>Nike</title>
</head>
<body>
<div class="wrapper">
    <nav class="navbar sticky-top navbar-expand-lg navbar-light justify-content-between" style=" background: -webkit-linear-gradient(left, #3956ca , #fff);
  background: -o-linear-gradient(right,  #3956ca , #fff);
  background: -moz-linear-gradient(right,  #3956ca , #fff);
  background: linear-gradient(to right,  #3956ca , #fff);">
        <a class="navbar-brand" href="#">
            <img src="${pageContext.request.contextPath}/images/logo.svg" width="54" height="20"
                 class="d-inline-block align-top" alt="nike logo">
            <span class="logo-text">JUST DO IT.</span>
        </a>
        <form class="form-inline">
            <img src="${pageContext.request.contextPath}/images/user.svg" width="20" height="20"
                 class="d-inline-block align-top">
            <span style="padding:0 0.5rem 0 0.5rem">王某某</span>
            <i class="fa fa-angle-down" aria-hidden="true" style="cursor:pointer;"></i>
            <img src="${pageContext.request.contextPath}/images/dividing-line.svg" width="1" height="20"
                 class="d-inline-block align-top"
                 style="margin: 0 1rem 0 1rem">
            <label>语言</label>
            <div class="btn-group btn-group-sm" role="group" style="margin-left:1rem;border-radius:1rem">
                <button type="button" class="btn btn-secondary">中文</button>
                <button type="button" class="btn btn-outline-secondary">En</button>
            </div>
        </form>
    </nav>

    <div class="row" style="margin-top: 9px;">
        <div class="col-sm-12">
            <div class="card" style="min-height:20rem">
                <div class="card-body">
                    <h4 class="card-title" style="letter-spacing: 0.1px;font-weight: bold">筛选条件</h4>
                    <form style="padding-top: 1.25rem">
                        <div class="form-group row" id="selectFilter">
                            <label class="col-form-label" for="year"
                                   style="font-size:1.2rem;min-width: 5rem">预测年份</label>
                            <div style="margin-left: 1rem">
                                <select class="form-control" style="width: 12rem" id="year" name="year">
                                    <option value="18">2018</option>
                                    <option selected value="17">2017</option>
                                </select>
                            </div>
                            <label style="padding-left: 3rem;font-size:1.2rem;min-width: 5rem" class="col-form-label"
                                   for="season">预测季度</label>
                            <div style="margin-left: 1rem">
                                <select class="form-control" style="width: 12rem" id="season" name="season">
                                    <option selected value="SP">春季</option>
                                    <option value="SU">夏季</option>
                                    <option value="FA">秋季</option>
                                    <option value="HO">冬季</option>
                                </select>
                            </div>
                            <label style="padding-left: 3rem;font-size:1.2rem;min-width: 5rem" class="col-form-label"
                                   for="prodType">商品类型</label>
                            <div style="margin-left: 1rem">
                                <select class="form-control" style="width: 12rem" name="prodType" id="prodType">
                                    <option value="FTW" selected>鞋</option>
                                    <option value="APP">衣服</option>
                                </select>
                            </div>
                            <label style="padding-left: 3rem;font-size:1.2rem;min-width: 5rem" class="col-form-label"
                                   for="department">部门选择</label>
                            <div style="margin-left: 1rem">
                                <select class="form-control" style="width: 12rem" id="department" name="department">
                                    <option selected value="">普通</option>
                                    <option value="goodbaby">GoodBaby</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row" style="padding-top: 2rem">
                            <div class="col-sm-1" style="padding: 0px;max-width: 5rem">
                                <span style="font-size:1.2rem;">属性设置</span>
                            </div>
                            <div class="col-sm-11" id="propertiesBox">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="card-footer text-muted">
                    <div class="form-group row" style="margin: 0px">
                        <div class="col col-auto" id="selectedInfo" style="padding: 0.5rem 0 0 0;max-width: 14rem">
                            <span class="year"></span>年· <span class="season"></span>· <span class="prodType"></span>·
                            <span class="department"></span>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/dividing-line.svg" width="1" height="24"
                             class="d-inline-block align-top"
                             style="margin: 0 1rem 0 1rem;padding-top: 0.5rem">
                        <div class="col" id="checkedInfo" style="padding: 0.3rem 0 0 0">
                        </div>
                        <div class="col" style="max-width: 15rem;text-align: right">
                            <button type="button" class="btn btn-link" id="clearBtn">重置</button>
                            <button type="button" class="btn btn-primary" id="queryBtn">提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 9px;" id="chartBox">
    </div>
    <div class="row" style="margin-top: 9px" id="detailBox">
    </div>

</div>

<script id="detail_box_content" type="text/html">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col" style="padding-top: 0.25rem">
                        <h4 class="card-title " style="letter-spacing: 0.1px;font-weight: bold;margin:0px">结果详情</h4>
                    </div>
                    <div class="col col-auto" style="text-align: right">
                        <button type="button" class="btn btn-link" id="myCollapsible">展开表单</button>
                        <button type="button" class="btn btn-outline-primary">导出</button>
                    </div>
                </div>
                <div class="collapse">
                    <table id="table" class="table table-sm table-striped"></table>
                </div>
            </div>
        </div>
    </div>
</script>
<script id="chart_box_content" type="text/html">
    <div class="col-lg-3 col-md-12">
        <div class="card">
            <div style="width:30%;height:4px;background-color:#fab818"></div>
            <div class="card-body" style="min-height:20rem;padding-bottom:0.5rem">
                <h4 class="card-title" style="letter-spacing: 0.1px;font-weight: bold">属性影响度</h4>
                <div id="chart1" style="height:18rem"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-5 col-md-12">
        <div class="card">
            <div style="width:30%;height:4px;background-color:#041698"></div>
            <div class="card-body" style="min-height:20rem;padding-bottom:0.5rem">
                <div class="form-group row" style="margin-top: -0.5rem">
                    <div class="col" style="padding:0.1rem 0.5rem 0 0;max-width:8rem">
                        <select class="form-control form-control-sm" id="propertiesSelect">
                            {{if properties}}
                            {{each properties item index}}
                            <option value="{{item.key}}" {{if index==0}}selected{{/if}}>{{item.text}}</option>
                            {{/each}}
                            {{/if}}
                        </select>
                    </div>
                    <label class="card-title form-check-label"
                           style="letter-spacing: 0.1px;font-weight: bold;font-size: 1.5rem">属性波动范围分布</label>
                    <div class="col" style="text-align: right">
                        <button type="button" class="btn btn-link" id="showDetail">结果详情<i style="font-size: 1rem;padding-left: 0.5rem"
                                                                          class="fa fa-angle-right"
                                                                          aria-hidden="true"></i></button>
                    </div>
                </div>
                <div id="chart2" style="height:18rem"></div>
            </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-12">
        <div class="card">
            <div style="width:30%;height:4px;background-color:#6983ea"></div>
            <div class="card-body" style="min-height:15rem;padding-bottom:0.5rem">
                <h4 class="card-title" style="letter-spacing: 0.1px;font-weight: bold">样本分布</h4>
                <div id="chart3" style="height:13rem"></div>
            </div>
            <div class="card-footer text-muted"
                 style="min-height:5rem;border-top:1px dashed rgba(0,0,0,.125);background-color: #fff;margin: 0px 1rem 0px 1rem">
                有<b>{{default2c}}</b>个组合<b>{{percentage}}%</b>样本<b>({{default2s}}/{{clusterC}})</b>因样本数少于300而被默认归
                到Cluster C(大量波动型)中。
            </div>
        </div>
    </div>
</script>

<script id="properties_checkbox" type="text/html">
    {{if properties}}
    {{each properties val key}}
    <div class="custom-control custom-checkbox custom-control-inline">
        <input type="checkbox" class="custom-control-input" id="{{key}}" value="{{key}}" name="dsiProperties"
               {{if val.selected}}checked{{/if}}/>
        <label class="custom-control-label" for="{{key}}">{{val.text}}</label>
    </div>
    {{/each}}
    {{/if}}
</script>


<script type="text/javascript">
    var ctxPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/bower_components/jquery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/artTemplate.js"></script>
<script src="${pageContext.request.contextPath}/bower_components/bootstrap/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/busy-load/dist/app.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>


