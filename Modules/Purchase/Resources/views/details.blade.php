@extends('layouts.app')

@section('title', $page_title)

@push('styles')
<style>
</style>
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
                    <!--begin::Button-->
                    <button type="button" class="btn btn-primary btn-sm mr-3" id="print-invoice"> <i class="fas fa-print"></i>{{__('file.Print')}}</button>

                    <a href="{{ route('purchase') }}" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i>{{__('file.Back')}}</a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom" style="padding-bottom: 100px !important;">
            <div class="card-body" style="padding-bottom: 100px !important;">
                <div class="col-md-12 col-lg-12"  style="width: 100%;">
                    <div id="invoice">
                        <x-base.invoice-style />
                        <div class="invoice overflow-auto">
                            <div>
                                <table width="100%" style="margin:0;padding:0;">
                                    <tr>
                                        <td width="100%" class="text-center">
                                            <h3 style="margin:0;">{{ config('settings.title') ? config('settings.title') : env('APP_NAME') }}</h3>
                                            @if(config('settings.address'))<p style="font-weight: normal;margin:0;"><b>{{ config('settings.address') }}</b></p>@endif
                                            @if(config('settings.contact_no'))<p style="font-weight: normal;margin:0;"><b>Contact: </b>{{ config('settings.contact_no') }}
                                                 @if(config('settings.email'))<b>, Email: </b>{{ config('settings.email') }}@endif</p>@endif
                                                 <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                                                            font-weight: bold;background: black;
                                                            border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;}">Purchase Memo</p>
                                           
                                        </td>
                                    </tr>
                                </table>
                                <div style="width: 100%;height:3px;border-top:1px solid #036;border-bottom:1px solid #036;"></div>
                                <table id="info_table" style="margin-top: 10px;">
                                    <tr>
                                        <td width="30%">
                                            <table>
                                                <tr><td><b>From</b></td></tr>
                                                <tr><td>{{ $purchase->warehouse->name }}</td></tr>
                                                <tr><td>{{ $purchase->warehouse->phone }}</td></tr>
                                                @if($purchase->warehouse->address)
                                                <tr><td>{{ $purchase->warehouse->address }}</td></tr>
                                                @endif
                                            </table>
                                        </td>
                                        <td width="40%">
                                            <table>
                                                <tr><td><b>To</b></td></tr>
                                                <tr><td>{{ $purchase->supplier->name }}</td></tr>
                                                <tr><td>{{ $purchase->supplier->company_name }}</td></tr>
                                                <tr><td>{{ $purchase->supplier->mobile }}</td></tr>
                                                @if($purchase->supplier->address)
                                                <tr><td>{{ $purchase->supplier->address }}</td></tr>
                                                @endif
                                            </table>
                                        </td>
                                        <td width="30%">
                                            <table>
                                                <tr><td></td></tr>
                                                <tr><td class="text-right"><b>Memo No.</b></td><td><b>: </b>{{ $purchase->memo_no }}</td></tr>
                                                <tr><td class="text-right"><b>Date</b></td><td><b>: </b>{{ date('d-M-Y',strtotime($purchase->purchase_date)) }}</td></tr>
                                                <tr><td class="text-right"><b>Payment Status</b></td><td><b>: </b>{{ PAYMENT_STATUS[$purchase->payment_status] }}</td></tr>
                                                @if($purchase->payment_method)
                                                <tr><td class="text-right">
                                                    <b>Payment Method</b></td><td><b>: </b>{{ PAYMENT_METHOD[$purchase->payment_method] }}</td>
                                                </tr>
                                                @endif
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <table  id='product_table'>
                                    <tbody>
                                        <tr>
                                            <td class="text-center"><b>SL.</b></td>
                                            <td class="text-left"><b>PRODUCT</b></td>
                                            <td class="text-center"><b>VEHICLE NO.</b></td>
                                            <td class="text-center"><b>CHALLAN NO.</b></td>
                                            <td class="text-center"><b>QUANTITY</b></td>
                                            <td class="text-right"><b>COST</b></td>
                                            <td class="text-right"><b>SUBTOTAL</b></td>
                                        </tr>
                                        @if (!$purchase->hasManyProducts->isEmpty())
                                            @foreach ($purchase->hasManyProducts as $key => $item)
                                                <tr>
                                                    <td class="text-center">{{ $key+1 }}</td>
                                                    <td class="text-left">{!! $item->product->name.' ('.$item->product->code.')' !!}</td>
                                                    <td class="text-center">{{ $item->vehicle_no }}</td>
                                                    <td class="text-center">{{ $item->challan_no }}</td>
                                                    <td class="text-center">{{ $item->qty }}</td>
                                                    <td class="text-right">{{ number_format($item->net_unit_cost,2,'.',',') }}</td>
                                                    <td class="text-right"> {{ number_format($item->total,2,'.',',') }} </td>
                                                </tr>
                                            @endforeach
                                            <tr>
                                                <td colspan="6"  class="text-right">TOTAL</td>
                                                <td class="text-right">{{ number_format($purchase->total_cost,2,'.',',') }}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"  class="text-right">SHIPPING COST</td>
                                                <td class="text-right"> {{ number_format($purchase->shipping_cost,2,'.',',') }}</td>
                                            </tr>
    
                                            <tr>
                                                <td colspan="6"  class="text-right">GRAND TOTAL</td>
                                                <td class="text-right">{{ number_format($purchase->grand_total,2,'.',',') }} </td>
                                            </tr>
    
                                            <tr>
                                                <td colspan="6"  class="text-right">PAID AMOUNT</td>
                                                <td class="text-right"> {{ number_format($purchase->paid_amount,2,'.',',') }}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"  class="text-right">DUE AMOUNT</td>
                                                <td class="text-right"> {{ number_format($purchase->due_amount,2,'.',',') }}</td>
                                            </tr>
                                        @else
                                            <tr><td Class="text-center" style="color:red;" colspan="7">No Data Found</td></tr>
                                        @endif
                                        
                                    </tbody>
                                </table>
                                @if($purchase->note)
                                <table>
                                    <tr>
                                        <td>
                                            <div class="notices">
                                                <div><b>Note:</b></div>
                                                <div class="notice">{{ $purchase->note }}</div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                @endif
                                <table style="width: 100%;">
                                    <tr>
                                        <td class="text-center">
                                            <div class="font-size-10" style="width:250px;float:left;">
                                                <p style="margin:0;padding:0;"><b class="text-uppercase">{{ $purchase->creator->name }}</b>
                                                    <br> {{ date('d-M-Y h:i:s A',strtotime($purchase->created_at)) }}</p>
                                                <p class="dashed-border"></p>
                                                <p style="margin:0;padding:0;">Created By</p>
                                            </div>
                                        </td>

                                        <td class="text-center">
                                            <div class="font-size-10" style="width:250px;float:right;">
                                                <p style="margin:0;padding:0;"><b class="text-uppercase">{{ $purchase->received_by }}</b></p>
                                                <p class="dashed-border"></p>
                                                <p style="margin:0;padding:0;">Received By</p>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@endsection

@push('scripts')
<script src="{{asset('js/jquery.printarea.js')}}"></script>
<script>
$(document).ready(function () {
    //QR Code Print
    $(document).on('click','#print-invoice',function(){
        var mode = 'iframe'; // popup
        var close = mode == "popup";
        var options = {
            mode: mode,
            popClose: close
        };
        $("#invoice").printArea(options);
    });
});

</script>
@endpush
