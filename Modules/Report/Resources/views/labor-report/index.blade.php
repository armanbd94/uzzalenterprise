@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link href="css/daterangepicker.min.css" rel="stylesheet" type="text/css" />
@endpush
@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Notice-->
        <div class="card card-custom gutter-b">
            <div class="card-header flex-wrap py-5">
                <div class="card-title">
                    <h3 class="card-label"><i class="{{ $page_icon }} text-primary"></i> {{ $sub_title }}</h3>
                </div>
                <div class="card-toolbar">
                    <button type="button" id="print-report" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-print"></i> {{__('file.Print')}}</button>
                </div>
            </div>

        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div id="report" class="col-md-12">
                        <style>
                            body,html {
                                background: #fff !important;
                                -webkit-print-color-adjust: exact !important;
                            }

                            .report-invoice {
                                /* position: relative; */
                                background: #fff !important;
                                /* min-height: 680px; */
                            }

                            .report-invoice header {
                                padding: 10px 0;
                                margin-bottom: 20px;
                                border-bottom: 1px solid #036;
                            }

                            .report-invoice .company-details {
                                text-align: right
                            }

                            .report-invoice .company-details .name {
                                margin-top: 0;
                                margin-bottom: 0;
                            }

                            .report-invoice .contacts {
                                margin-bottom: 20px;
                            }

                            .report-invoice .report-invoice-to {
                                text-align: left;
                            }

                            .report-invoice .report-invoice-to .to {
                                margin-top: 0;
                                margin-bottom: 0;
                            }

                            .report-invoice .report-invoice-details {
                                text-align: right;
                            }

                            .report-invoice .report-invoice-details .report-invoice-id {
                                margin-top: 0;
                                color: #036;
                            }

                            .report-invoice main {
                                padding-bottom: 50px
                            }

                            .report-invoice main .thanks {
                                margin-top: -100px;
                                font-size: 2em;
                                margin-bottom: 50px;
                            }

                            .report-invoice main .notices {
                                padding-left: 6px;
                                border-left: 6px solid #036;
                            }

                            .report-invoice table {
                                width: 100%;
                                border-collapse: collapse;
                                border-spacing: 0;
                                margin-bottom: 20px;
                            }

                            .report-invoice table th {
                                background: #036;
                                color: #fff;
                                padding: 15px;
                                border-bottom: 1px solid #fff
                            }

                            .report-invoice table td {
                                padding: 10px;
                                border-bottom: 1px solid #EBEDF3;
                            }

                            .report-invoice table th {
                                white-space: nowrap;
                            }

                            .report-invoice table td h3 {
                                margin: 0;
                                color: #036;
                            }

                            .report-invoice table .qty {
                                text-align: center;
                            }

                            .report-invoice table .price,
                            .report-invoice table .discount,
                            .report-invoice table .tax,
                            .report-invoice table .total {
                                text-align: right;
                            }

                            .report-invoice table .no {
                                color: #fff;
                                background: #036
                            }

                            .report-invoice table .total {
                                background: #036;
                                color: #fff
                            }

                            /* .report-invoice table tbody tr:last-child td {
                                border: none
                            } */

                            .report-invoice table tfoot td {
                                background: 0 0;
                                border-bottom: none;
                                white-space: nowrap;
                                text-align: right;
                                padding: 10px 20px;
                                border: 1px solid #aaa;
                                font-weight: bold;
                            }

                            .report-invoice table tfoot tr:first-child td {
                                border-top: none
                            }

                            .no-bottom-border tr td{
                                border-bottom: 0 !important;
                            }

                            /* .report-invoice table tfoot tr:last-child td {
                                color: #036;
                                border-top: 1px solid #036
                            } */

                            .report-invoice table tfoot tr td:first-child {
                                border: none
                            }

                            .report-invoice footer {
                                width: 100%;
                                text-align: center;
                                color: #777;
                                border-top: 1px solid #aaa;
                                padding: 8px 0
                            }

                            .report-invoice a {
                                content: none !important;
                                text-decoration: none !important;
                                color: #036 !important;
                            }

                            .page-header,
                            .page-header-space {
                                height: 100px;
                            }

                            .page-footer,
                            .page-footer-space {
                                height: 20px;

                            }

                            .page-footer {
                                position: fixed;
                                bottom: 0;
                                width: 100%;
                                text-align: center;
                                color: #777;
                                border-top: 1px solid #aaa;
                                padding: 8px 0
                            }

                            .page-header {
                                position: fixed;
                                top: 0mm;
                                width: 100%;
                                border-bottom: 1px solid black;
                            }

                            .page {
                                page-break-after: always;
                            }
                            .dashed-border{
                                width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
                            }

                            @media screen {
                                .no_screen {display: none;}
                                .no_print {display: block;}
                                thead {display: table-header-group;}
                                tfoot {display: table-footer-group;}
                                button {display: none;}
                                body {margin: 0;}
                            }

                            @media print {

                                body,
                                html {
                                    /* background: #fff !important; */
                                    -webkit-print-color-adjust: exact !important;
                                    font-family: sans-serif;
                                    /* font-size: 12px !important; */
                                    margin-bottom: 100px !important;
                                }

                                .m-0 {
                                    margin: 0 !important;
                                }

                                h1,
                                h2,
                                h3,
                                h4,
                                h5,
                                h6 {
                                    margin: 0 !important;
                                }

                                .no_screen {
                                    display: block !important;
                                }

                                .no_print {
                                    display: none;
                                }

                                a {
                                    content: none !important;
                                    text-decoration: none !important;
                                    color: #036 !important;
                                }

                                .text-center {
                                    text-align: center !important;
                                }

                                .text-left {
                                    text-align: left !important;
                                }

                                .text-right {
                                    text-align: right !important;
                                }

                                .float-left {
                                    float: left !important;
                                }

                                .float-right {
                                    float: right !important;
                                }

                                .text-bold {
                                    font-weight: bold !important;
                                }

                                .report-invoice {
                                    /* font-size: 11px!important; */
                                    overflow: hidden !important;
                                    background: #fff !important;
                                    margin-bottom: 100px !important;
                                }

                                .report-invoice footer {
                                    position: absolute;
                                    bottom: 0;
                                    left: 0;
                                    /* page-break-after: always */
                                }

                                /* .report-invoice>div:last-child {
                                    page-break-before: always
                                } */
                                .hidden-print {
                                    display: none !important;
                                }
                                .dashed-border{
                                    width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
                                }
                            }

                            @page {
                                /* size: auto; */
                                margin: 5mm 5mm;

                            }
                        </style>
                        <div class="report-invoice overflow-auto">
                            <table>
                                <tr>
                                    <td class="text-center">
                                        <h2 class="name m-0" style="text-transform: uppercase;"><b>{{ config('settings.title') ? config('settings.title') : env('APP_NAME') }}</b></h2>
                                        @if(config('settings.contact_no'))<p style="font-weight: normal;margin:0;"><b>{{__('file.Contact No')}}.: </b>{{ config('settings.contact_no') }}, @if(config('settings.email'))<b>{{__('file.Email')}}: </b>{{ config('settings.email') }}@endif</p>@endif
                                        @if(config('settings.address'))<p style="font-weight: normal;margin:0;">{{ config('settings.address') }}</p>@endif
                                        <p style="font-weight: normal;margin:0;"><b>{{__('file.Date')}}: </b>{{ date('d-M-Y') }}</p>
                                        <div style="width: 150px;background:#036;color:white;font-weight:bolder;margin:5px auto 0 auto;padding: 5px 0;
                                        border-radius: 15px;text-align:center;">{{__('file.Labor Bill')}}</div>
                                    </td>
                                </tr>
                            </table>
                            <table class="table table-bordered" style="margin-top: 20px;">
                                <thead class="bg-primary">
                                    <th width="5%">{{__('file.SL')}}.</th>
                                    <th width="35%">{{__('file.Description')}}</th>
                                    <th width="20%" class="text-center">{{__('file.Bag Weight/Kg')}}</th>
                                    <th width="10%" class="text-right">{{__('file.Per Bag Rate')}}</th>
                                    <th width="10%" class="text-center">{{__('file.Quantity')}}</th>
                                    <th width="20%" class="text-right">{{__('file.Amount')}}</th>
                                </thead>
                                <tbody>
                                    @if (!empty($labor_bills) && count($labor_bills) > 0)
                                        @foreach ($labor_bills as $key => $bill)
                                            <tr>
                                                <td>{{ $key+1 }}</td>
                                                <td>{{ $bill['bill_name'] }}</td>
                                                <td class="text-center">{{ $bill['bag_size'] }}</td>
                                                <td class="text-right">{{ $bill['rate'] }}</td>
                                                <td class="text-center">{{ $bill['qty'] }}</td>
                                                <td class="text-right">{{ $bill['total'] }}</td>
                                            </tr>
                                        @endforeach
                                    @endif
                                </tbody>
                                <tfoot>
                                    <thead class="bg-primary">
                                        <th colspan="5" class="text-right">{{__('file.Total')}}</th>
                                        <th class="text-right total-product-cost" > {{ $total_amount }}{{__('file.Tk')}}</th>
                                    </thead>
                                </tfoot>
                            </table>
                            <table style="margin:50px 0;"  class="no-bottom-border">
                                <tr>
                                    <td class="text-center">
                                        <div class="font-size-10">
                                            <p style="margin:0;padding:0;">{{ Auth::user()->name }}</p>
                                            <p class="dashed-border"></p>
                                            <p style="margin:0;padding:0;">{{__('file.Generated By')}}</p>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="font-size-10">
                                            <p style="margin:0;padding:0;"></p>
                                            <p class="dashed-border"></p>
                                            <p style="margin:0;padding:0;">{{__('file.Labor Head Sign')}}</p>
                                        </div>
                                    </td>
                                    <td class="text-center">
                                        <div class="font-size-10">
                                            <p style="margin:0;padding:0;"></p>
                                            <p class="dashed-border"></p>
                                            <p style="margin:0;padding:0;">{{__('file.Authorizer Sign')}}</p>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>

@endsection

@push('scripts')
<script src="js/jquery.printarea.js"></script>
<script src="js/knockout-3.4.2.js"></script>
<script src="js/daterangepicker.min.js"></script>
<script>

$(document).on('click','#print-report',function(){
    var mode = 'iframe'; // popup
    var close = mode == "popup";
    var options = {
        mode: mode,
        popClose: close
    };
    $("#report").printArea(options);
});

</script>
@endpush
