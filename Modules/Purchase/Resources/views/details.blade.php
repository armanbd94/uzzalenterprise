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
                                        <td width="15%">
                                            @if (config('settings.logo'))
                                                <img src="{{ asset('storage/'.LOGO_PATH.config('settings.logo'))}}" style="max-width: 100px;" alt="Logo" />
                                            @endif
                                        </td>
                                        <td width="70%" class="text-center">
                                            <h1 style="margin:0;" class="site_title"><b>{{ config('settings.title') ? config('settings.title') : env('APP_NAME') }}</b></h1>
                                            @if(config('settings.address'))<p style="font-weight: normal;margin:0;"><b>{{ config('settings.address') }}</b></p>@endif
                                            @if(config('settings.contact_no'))<p style="font-weight: normal;margin:0;"><b>{{ __('file.Contact') }}: </b>{{ translate(config('settings.contact_no'),App::getLocale()) }}
                                                 @if(config('settings.email'))<b>, {{ __('file.Email') }}: </b>{{ config('settings.email') }}@endif</p>@endif
                                                 <p style="font-weight: normal;font-weight:bold;    margin: 10px auto 5px auto;
                                                            font-weight: bold;background: black;
                                                            border-radius: 10px;width: 250px;color: white;text-align: center;padding:5px 0;">{{ __('file.Purchase Memo') }}</p>
                                           
                                        </td>
                                        <td width="15%"></td>
                                    </tr>
                                </table>
                                <div style="width: 100%;height:3px;border-top:2px dashed #000;"></div>
                                <table id="info_table" style="margin-top: 10px;">
                                    <tr>
                                        <td width="30%">
                                            <table>
                                                <tr><td><b>{{ __('file.From') }}</b></td></tr>
                                                <tr><td>{{ $purchase->warehouse->name }}</td></tr>
                                                <tr><td>{{ $purchase->warehouse->phone }}</td></tr>
                                                @if($purchase->warehouse->address)
                                                <tr><td>{{ $purchase->warehouse->address }}</td></tr>
                                                @endif
                                            </table>
                                        </td>
                                        <td width="40%">
                                            <table>
                                                <tr><td><b>{{ __('file.To') }}</b></td></tr>
                                                <tr><td>{{ $purchase->supplier->name }}</td></tr>
                                                <tr><td>{{ $purchase->supplier->company_name }}</td></tr>
                                                <tr><td>{{ translate($purchase->supplier->mobile,App::getLocale()) }}</td></tr>
                                                @if($purchase->supplier->address)
                                                <tr><td>{{ $purchase->supplier->address }}</td></tr>
                                                @endif
                                            </table>
                                        </td>
                                        <td width="30%">
                                            <table>
                                                <tr><td></td></tr>
                                                <tr><td class="text-right"><b>{{ __('file.Memo No.') }}</b></td><td><b>: </b>{{ translate($purchase->memo_no,App::getLocale()) }}</td></tr>
                                                <tr><td class="text-right"><b>{{ __('file.Date') }}</b></td><td><b>: </b>{{ translate(date('d-m-Y',strtotime($purchase->purchase_date)),App::getLocale()) }}</td></tr>
                                                <tr><td class="text-right"><b>{{ __('file.Payment Status') }}</b></td><td><b>: </b>{{ __('file.'.PAYMENT_STATUS[$purchase->payment_status]) }}</td></tr>
                                                @if($purchase->payment_method)
                                                <tr><td class="text-right">
                                                    <b>{{ __('file.Payment Method') }}</b></td><td><b>: </b>{{ __('file.'.PAYMENT_METHOD[$purchase->payment_method]) }}</td>
                                                </tr>
                                                @endif
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <table  id='product_table'>
                                    <tbody>
                                        <tr>
                                            <td class="text-center"><b>{{ __('file.SL') }}</b></td>
                                            <td class="text-left"><b>{{ __('file.Product') }}</b></td>
                                            <td class="text-center"><b>{{ __('file.Vehicle No.') }}</b></td>
                                            <td class="text-center"><b>{{ __('file.Challan No') }}</b></td>
                                            <td class="text-center"><b>{{ __('file.Quantity') }}</b></td>
                                            <td class="text-right"><b>{{ __('file.Cost') }}</b></td>
                                            <td class="text-right"><b>{{ __('file.Subtotal') }}</b></td>
                                        </tr>
                                        @if (!$purchase->hasManyProducts->isEmpty())
                                            @foreach ($purchase->hasManyProducts as $key => $item)
                                                <tr>
                                                    <td class="text-center">{{ translate($key+1,App::getLocale()) }}</td>
                                                    <td class="text-left">{!! $item->product->name.' ('.$item->product->code.')' !!}</td>
                                                    <td class="text-center">{{ $item->vehicle_no }}</td>
                                                    <td class="text-center">{{ $item->challan_no }}</td>
                                                    <td class="text-center">{{ translate($item->qty,App::getLocale()) }}</td>
                                                    <td class="text-right">{{ translate(number_format($item->net_unit_cost,2,'.',','),App::getLocale()) }}</td>
                                                    <td class="text-right"> {{ translate(number_format($item->total,2,'.',','),App::getLocale()) }} </td>
                                                </tr>
                                            @endforeach
                                            <tr>
                                                <td colspan="6"  class="text-right">{{ __('file.Total') }}</td>
                                                <td class="text-right">{{ translate(number_format($purchase->total_cost,2,'.',','),App::getLocale()) }}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"  class="text-right">{{ __('file.Shipping Cost') }}</td>
                                                <td class="text-right"> {{ translate(number_format($purchase->shipping_cost,2,'.',','),App::getLocale()) }}</td>
                                            </tr>
    
                                            <tr>
                                                <td colspan="6"  class="text-right">{{ __('file.Grand Total') }}</td>
                                                <td class="text-right">{{ translate(number_format($purchase->grand_total,2,'.',','),App::getLocale()) }} </td>
                                            </tr>
    
                                            <tr>
                                                <td colspan="6"  class="text-right">{{ __('file.Paid Amount') }}</td>
                                                <td class="text-right"> {{ translate(number_format($purchase->paid_amount,2,'.',','),App::getLocale()) }}</td>
                                            </tr>
                                            <tr>
                                                <td colspan="6"  class="text-right">{{ __('file.Due Amount') }}</td>
                                                <td class="text-right"> {{ translate(number_format($purchase->due_amount,2,'.',','),App::getLocale()) }}</td>
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
                                                <div><b>{{ __('file.Note') }}:</b></div>
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
                                                    <br> {{ translate(date('d-m-Y H:i:s',strtotime($purchase->created_at)),App::getLocale()) }}</p>
                                                <p class="dashed-border"></p>
                                                <p style="margin:0;padding:0;">{{ __('file.Created By') }}</p>
                                            </div>
                                        </td>

                                        <td class="text-center">
                                            <div class="font-size-10" style="width:250px;float:right;">
                                                <p style="margin:0;padding:0;"><b class="text-uppercase"></b></p>
                                                <p class="dashed-border"></p>
                                                <p style="margin:0;padding:0;">{{ __('file.Received By') }}</p>
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
