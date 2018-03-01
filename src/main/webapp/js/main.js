$(function () {
    Highcharts.setOptions({
        lang: {
            thousandsSep: ','
        }
    });

    var FORMATTER = {
        cluster_formatter: function (value) {
            if (DEFAULT.CLUSTER_TEXT_MAPPING[value]) {
                return DEFAULT.CLUSTER_TEXT_MAPPING[value].text;
            }
            return value;
        },
        sd_formatter: function (value) {
            if (!isNaN(value)) {
                return value.toFixed(6);
            }
            return value;
        }
    };

    var DEFAULT = {
        KEY_TEXT_MAPPING: {
            storeType: {text: '店铺大小', selected: true, importance: 0.0167726246150384},
            tradeZone: {text: '店铺商圈', selected: true},
            price: {text: '价格高低', selected: true},
            gndrGroupNm: {text: '性别', selected: true, importance: 0.0249064393149744},
            ctgyPtfm: {text: '商品类别', selected: true, importance: 0.0416377300381609},
            colorMain: {text: '颜色', selected: true, importance: 0.0280285175699519},
            salesAreaNames: {text: '地区', selected: false},
            storeRecordType: {text: '店铺类型', selected: false},
            storeEnvironmentDescription: {text: '店铺环境', selected: false},
            storeLeadCategory: {text: '店铺概念属性', selected: false},
            storeCityTierNumber: {text: '店铺城市级别', selected: false, importance: 0.18949699093112},
            subTerritory: {text: '店铺子领域', selected: false},
            clcStatus: {text: 'CLC状态', selected: false}
        },
        CLUSTER_TEXT_MAPPING: {
            'Cluster A': {text: '平稳型(A)', color: '#3956ca'},
            'Cluster B': {text: '少量波动型(B)', color: '#27b9fa'},
            'Cluster C': {text: '大量波动型(C)', color: '#fad218'},
            'Cluster D': {text: '不可预测型(D)', color: '#6e6e6e'}
        },
        DEFAULT_COLUMN: [
            {field: 'cluster', title: '波动归类', sortable: true, formatter: FORMATTER.cluster_formatter},
            {field: 'sd', title: '标准差', sortable: true, formatter: FORMATTER.sd_formatter},
            {field: 'sampSize', title: '样本数', sortable: true}
        ]
    };

    var $propertiesBox = $('#propertiesBox'),
        htmlStr = template('properties_checkbox', {properties: DEFAULT.KEY_TEXT_MAPPING});
    $propertiesBox.html(htmlStr);

    var $year = $('#year'), $season = $('#season'), $prodType = $('#prodType'), $department = $('#department'),
        $properties = $('input[name=dsiProperties]'), $selectedInfo = $('#selectedInfo'),
        $clearBtn = $('#clearBtn'), $queryBtn = $('#queryBtn'),
        $selectFilter = $('#selectFilter'),
        $checkedInfo = $('#checkedInfo');

    var POST_URL = ctxPath + '/data/result.json', clickTimer = null;


    var checked_template = '<button type="button" style="margin-right:1rem;margin-bottom:0.5rem;" class="btn btn-outline-primary btn-sm" data-key="{{key}}">{{text}}<span class="close" style="font-size:1rem;padding-left: 0.5rem;font-weight: normal;line-height: initial">x</span></button>';

    function addCheckedInfo($target) {
        var htmlStr = checked_template.replace('{{key}}', $target.attr('id')).replace("{{text}}", $target.next().text()),
            $htmlStr = $(htmlStr);
        $htmlStr.find('.close').one('click', function () {
            var $this = $(this), $button = $this.parent(), key = $button.data('key');
            $button.remove();
            $('#' + key).prop("checked", false);
        })
        $checkedInfo.append($htmlStr);
    }

    function addSelectedInfo($target) {
        var htmlStr = checked_template.replace('{{key}}', $target.attr('id')).replace("{{text}}", $target.next().text()),
            $htmlStr = $(htmlStr);
        $htmlStr.find('.close').one('click', function () {
            var $this = $(this), $button = $this.parent(), key = $button.data('key');
            $button.remove();
            $('#' + key).prop("checked", false);
        })
        $checkedInfo.append($htmlStr);
    }

    function drawChart1(data) {
        var chart = null;
        $('#chart1').highcharts({
            chart: {
                style: {fontFamily: 'Helvetica Neue,Roboto,Arial,Droid Sans,sans-serif'},
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            colors: ['#3956ca', '#77e8cf', '#0083a9', '#27b9fa', '#fa9218', '#fad318', '#041698', '#00bb94', '#a0569a', '#90ed7d', '#5bc0de', '#00bb94', '#049fd9'],
            credits: {
                enabled: false
            },
            legend: {
                enabled: true,
                align: 'right',
                verticalAlign: 'middle',
                layout: 'vertical',
                itemStyle: {fontWeight: 'nomarl', textTransform: 'capitalize'},
                itemMarginTop: 4
            },
            title: {
                floating: true,
                useHTML: true,
                style: {fontSize: '1rem', textAlign: 'center'},
                text: ''
            },
            tooltip: {
                pointFormat: '<b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    showInLegend: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false,
                        format: '{point.percentage:.1f} %',
                    },
                    point: {
                        events: {
                            select: function (e) {
                                chart.setTitle({
                                    text: '<b>' + e.target.name + '</br>' + Highcharts.numberFormat(e.target.percentage, 1, '.', ',') + '%</b>'
                                });
                            }
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                innerSize: '50%',
                data: data
            }]
        }, function (c) {
            var centerY = c.series[0].center[1],
                legendWidth = c.legend.legendWidth,
                titleHeight = parseInt(c.title.styles.fontSize) * 2;
            c.setTitle({
                y: centerY + titleHeight / 2,
                x: -legendWidth / 2 - 5
            });
            chart = c;
        });
    }

    function drawChart2(series) {
        $('#chart2').highcharts({
            chart: {
                style: {fontFamily: 'Helvetica Neue,Roboto,Arial,Droid Sans,sans-serif'},
                type: 'column'
            },
            credits: {
                enabled: false
            },
            title: {
                text: '',
                float: true
            },
            xAxis: {
                type: 'category',
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: ''
                }
            },
            legend: {
                enabled: true,
                align: 'center',
                verticalAlign: 'top',
                itemStyle: {fontWeight: 'nomarl', textTransform: 'capitalize'},
                itemMarginTop: 4
            },
            tooltip: {
                headerFormat: '<b style="font-size:1rem">{point.key}</b><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y}</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    borderWidth: 0,
                    dataLabels: {
                        enabled: true,
                        allowOverlap: true,
                        useHTML: true,
                        style: {fontWeight: 'nomarl', color: '#6c757d'}
                    }
                }
            },
            series: series
        });
    }

    function drawChart3(data, total) {
        $('#chart3').highcharts({
            chart: {
                style: {fontFamily: 'Helvetica Neue,Roboto,Arial,Droid Sans,sans-serif'},
                type: 'bar'
            },
            credits: {
                enabled: false
            },
            title: {
                float: true,
                text: ''
            },
            xAxis: {
                type: 'category',
                crosshair: true,
                title: {
                    text: null
                }
            },
            yAxis: {
                min: 0,
                title: {
                    text: '',
                    align: 'high'
                },
                labels: {
                    overflow: 'justify'
                }
            },
            tooltip: {
                enabled: false
            },
            plotOptions: {
                bar: {
                    dataLabels: {
                        enabled: true,
                        allowOverlap: true,
                        style: {fontWeight: 'nomarl', color: '#6c757d'},
                        useHTML: true,
                        formatter: function () {
                            return Highcharts.numberFormat(this.y, 0, '.', ',') + '<b style="padding-left: 0.5rem">' + Highcharts.numberFormat(this.y / total * 100, 2, '.', ',') + '%</b>'
                        }
                    }
                }
            },
            legend: {
                enabled: false
            },
            credits: {
                enabled: false
            },
            series: [{
                data: data
            }]
        });
    }

    function buildTable(columns, data) {
        $('#table').bootstrapTable({
            columns: columns,
            pagination: true,
            pageSize:20,
            pageList:[20],
            sortOrder: 'desc',
            data: data
        });
    }


    function Page() {

    }


    Page.prototype.init = function () {

        $properties.each(function () {
            var $this = $(this);
            if ($this.is(':checked')) {
                addCheckedInfo($this);
            }
        });

        $selectFilter.find('select').each(function () {
            var $this = $(this), id = $this.attr('id'), text = $this.find('option:selected').text();
            $selectedInfo.find('.' + id).text(text);
        });

        $queryBtn.click(function () {
            $('.wrapper').busyLoad("show", {
                text: "Loading ...",
                textPosition: "top"
            });
            if (clickTimer) {
                clearTimeout(clickTimer);
            }
            var $this = $(this),
                getSimpleData = function () {
                    $.ajax({
                        url: POST_URL,
                        data: {},
                        type: 'post',
                        dataType: 'json'
                    }).done(function (data) {
                        $('.wrapper').busyLoad("hide");
                        var propIncidenceObj = data.propIncidenceMapJson[0],
                            sampleDisOutputArray = data.sampleDisOutputListJson,
                            tableData = data.rows,
                            columns = data.columns[0],
                            propertiesDisObj = data.propertiesDisMapJson[0],
                            chart1Data = [],
                            bootstrapColumns = [],
                            chart2DataMap = {},
                            chart3Data = [], total = 0, clusterC = 0;

                        if (propIncidenceObj) {
                            for (var key in propIncidenceObj) {
                                var text = DEFAULT.KEY_TEXT_MAPPING[key].text, value = propIncidenceObj[key];
                                chart1Data.push({name: text, y: value});
                            }
                        }

                        if (propertiesDisObj) {
                            for (var property in propertiesDisObj) {
                                var propertiesObj = propertiesDisObj[property], tempMap = {};
                                chart2DataMap[property] = [];
                                for (var type in propertiesObj) {
                                    var typeDataObj = propertiesObj[type][0];
                                    for (var cluster in typeDataObj) {
                                        if (tempMap[cluster] && tempMap[cluster][type]) {
                                            tempMap[cluster][type] = typeDataObj[cluster];
                                        } else {
                                            if (!tempMap[cluster]) {
                                                tempMap[cluster] = {};
                                            }
                                            tempMap[cluster][type] = typeDataObj[cluster];
                                        }
                                    }
                                }
                                for (var key in tempMap) {
                                    var item = tempMap[key], dataArray = [];
                                    for (var s in item) {
                                        dataArray.push({name: s, y: item[s]});
                                    }
                                    chart2DataMap[property].push({
                                        name: DEFAULT.CLUSTER_TEXT_MAPPING[key].text,
                                        data: dataArray,
                                        color: DEFAULT.CLUSTER_TEXT_MAPPING[key].color
                                    });
                                }
                            }
                        }


                        if (sampleDisOutputArray) {
                            for (var i = 0; i < sampleDisOutputArray.length; i++) {
                                var sampleDisOutputObj = sampleDisOutputArray[i];
                                for (var cluster in sampleDisOutputObj) {
                                    total += sampleDisOutputObj[cluster];
                                    chart3Data.push({
                                        name: DEFAULT.CLUSTER_TEXT_MAPPING[cluster].text,
                                        y: sampleDisOutputObj[cluster],
                                        color: DEFAULT.CLUSTER_TEXT_MAPPING[cluster].color
                                    });

                                    if (cluster === 'Cluster C') {
                                        clusterC = sampleDisOutputObj[cluster];
                                    }
                                }
                            }
                        }

                        var selectProperties = [];
                        for (var property in chart2DataMap) {
                            selectProperties.push({key: property, text: DEFAULT.KEY_TEXT_MAPPING[property].text});
                        }

                        var chartBoxHtml = template('chart_box_content', {
                            percentage: (data.default2s / clusterC * 100).toFixed(2),
                            default2c: data.default2c,
                            default2s: data.default2s,
                            properties: selectProperties,
                            clusterC: clusterC
                        });
                        var detailBoxHtml = template('detail_box_content');

                        $('#chartBox').html(chartBoxHtml);
                        $('#detailBox').html(detailBoxHtml);
                        
                        $('#showDetail').click(function () {
                            $('.collapse').collapse('show');
                        })
                        
                        $('#myCollapsible').click(function () {
                            $('.collapse').collapse('toggle');
                        })
                        
                        $('.collapse').on('hidden.bs.collapse', function () {
                            $('#myCollapsible').text('展开表单');
                        })

                        $('.collapse').on('show.bs.collapse', function () {
                            $('#myCollapsible').text('收起表单');
                        })




                        $('#propertiesSelect').change(function () {
                            drawChart2(chart2DataMap[$(this).val()]);
                        })

                        drawChart1(chart1Data);
                        drawChart2(chart2DataMap[$('#propertiesSelect').val()]);
                        drawChart3(chart3Data, total);

                        for (var k = 0; k < columns.length; k++) {
                            var column = columns[k];
                            bootstrapColumns.push({field: column.field, title: column.title, sortable: true});
                        }

                        buildTable(bootstrapColumns.concat(DEFAULT.DEFAULT_COLUMN), tableData);

                        $this.button('reset');
                    });
                };
            $this.button('loading');
            clickTimer = setTimeout(getSimpleData, 2000);
        });

        $clearBtn.click(function () {
            $checkedInfo.find('button').each(function () {
                $(this).find('.close').trigger('click');
            })
        });

        $properties.change(function () {
            var $this = $(this);
            if ($this.is(':checked')) {
                addCheckedInfo($this);
            } else {
                $checkedInfo.find('button[data-key=' + $this.attr('id') + ']').remove();
            }
        });

        $selectFilter.find('select').change(function () {
            var $this = $(this), id = $this.attr('id'), text = $this.find('option:selected').text();
            $selectedInfo.find('.' + id).text(text);
        });
    }


    var page = new Page();
    page.init();

});