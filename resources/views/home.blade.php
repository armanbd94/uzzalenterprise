@extends('layouts.app')
@section('title','Dashboard')
@push('styles')
<link rel="stylesheet" href="{{asset('css/chart.min.css')}}">
<style>
    .today-btn{
        border-radius: 5px 0 0 5px !important;
    }
    .week-btn,.month-btn{
        border-radius: 0 !important;
    }
    .year-btn{
        border-radius: 0 5px 5px 0 !important;
    }
    .icon{
        width: 40px;
        height: 40px;
    }
</style>
@endpush
@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4">
                <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img src="{{asset('images/purchase.svg')}}" alt="purchase" class="icon">
                    </span>
                    <h6 id="purchase" class="m-0">{{ number_format($purchase,2) }}{{__('file.TK')}}</h6>
                    <a href="{{ route('purchase') }}" class="font-weight-bold font-size-h7 mt-2">{{__('file.Purchase')}}</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img src="{{asset('images/sale.svg')}}" alt="sale" class="icon">
                    </span>
                    <h6 id="sale" class="m-0">{{ number_format($sale,2) }}{{__('file.TK')}}</h6>
                    <a href="{{ route('sale') }}" class="font-weight-bold font-size-h7 mt-2">{{__('file.Sale')}}</a>
                </div>
            </div>

            <div class="col-md-4">
                <div class="bg-white text-center py-3  rounded-xl">
                    <span class="svg-icon svg-icon-3x svg-icon-danger d-block my-3">
                        <img src="{{asset('images/expense.svg')}}" alt="expense" class="icon">
                    </span>
                    <h6 id="expense" class="m-0">{{ number_format($total_expense_amount,2) }}{{__('file.TK')}}</h6>
                    <a href="{{ route('purchase') }}" class="font-weight-bold font-size-h7 mt-2">{{__('file.Expense')}}</a>
                </div>
            </div>
        </div>
        <!-- Start :: Bar Chart-->
        <div class="row py-5">
            <div class="col-md-12">
            <div class="card bar-chart">
                <div class="card-header d-flex align-items-center">
                <h4>{{__('file.Yearly Report')}}</h4>
                </div>
                <div class="card-body">
                <canvas id="yearlyReportChart"  data-sale_chart_value="{{ json_encode( $yearly_sale_amount) }}"
                data-purchase_chart_value="{{ json_encode($yearly_purchase_amount) }}"  data-label1="{{__('file.Purchase Amount')}}" data-label2="{{__('file.Sale Amount')}}"></canvas>

                </div>
            </div>
            </div>
        </div>
        <!-- End :: Bar Chart-->
    </div>
</div>
@endsection
@push('scripts')
<script src="{{asset('js/chart.min.js')}}"></script>
<script>
$(document).ready(function(){
    $('.data-btn').on('click',function(){
        $('.data-btn').removeClass('active');
        $(this).addClass('active');
        var start_date = $(this).data('start_date');
        var end_date = $(this).data('end_date');
        $.get("{{ url('dashboard-data') }}/"+start_date+'/'+end_date, function(data){
            $('#sale').text((data.sale).toFixed(2)+'Tk');
            $('#purchase').text((data.purchase).toFixed(2)+'Tk');
            $('#expense').text((data.expense).toFixed(2)+'Tk');
        });
    });

    //Yearly Report Chart

    var YEARLYREPORTCHART = $('#yearlyReportChart');

    if(YEARLYREPORTCHART.length > 0)
    {
        var yearly_sale_amount = YEARLYREPORTCHART.data('sale_chart_value');
        var yearly_purchase_amount = YEARLYREPORTCHART.data('purchase_chart_value');
        var label1 = YEARLYREPORTCHART.data('label1');
        var label2 = YEARLYREPORTCHART.data('label2');
        var yearly_report_chart = new Chart(YEARLYREPORTCHART, {
            type:'bar',
            data:{
            labels:["{{__('file.January')}}","{{__('file.February')}}","{{__('file.March')}}","{{__('file.April')}}","{{__('file.May')}}","{{__('file.June')}}","{{__('file.July')}}","{{__('file.August')}}","{{__('file.September')}}","{{__('file.October')}}","{{__('file.November')}}","{{__('file.December')}}"],
            datasets:[
                {
                label:label1,
                backgroundColor:[
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                    'rgba(245, 34, 45, 1)',
                ],
                borderColor:[
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                    '#f5222d',
                ],
                borderWidth:1,
                data:[
                    yearly_purchase_amount[0],yearly_purchase_amount[1],yearly_purchase_amount[2],yearly_purchase_amount[3],
                    yearly_purchase_amount[4],yearly_purchase_amount[5],yearly_purchase_amount[6],yearly_purchase_amount[7],
                    yearly_purchase_amount[8],yearly_purchase_amount[9],yearly_purchase_amount[10],yearly_purchase_amount[11], 0
                    ],
                },
                {
                label:label2,
                backgroundColor:[
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                    'rgba(3, 77, 151, 1)',
                ],
                borderColor:[
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                    '#034d97',
                ],
                borderWidth:1,
                data:[
                    yearly_sale_amount[0],yearly_sale_amount[1],yearly_sale_amount[2],yearly_sale_amount[3],
                    yearly_sale_amount[4],yearly_sale_amount[5],yearly_sale_amount[6],yearly_sale_amount[7],
                    yearly_sale_amount[8],yearly_sale_amount[9],yearly_sale_amount[10],yearly_sale_amount[11], 0
                    ],
                },
            ]
            }
        });
    }
});
</script>
@endpush
