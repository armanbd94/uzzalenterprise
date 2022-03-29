@extends('layouts.app')

@section('title', $page_title)


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
                    <a href="{{ route('product') }}" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i>{{__('file.Back')}}</a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom" style="padding-bottom: 100px !important;">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-borderless table-hover">
                            <tr><td width="25%"><b>{{__('file.Name')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ $product->name }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Code')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ $product->code }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Category')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ $product->category->name }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Stock Unit')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ $product->unit->unit_name }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Cost')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ number_format($product->cost,2) }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Price')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ number_format($product->price,2) }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Stock Quantity')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ number_format($product->qty,2) }}</td></tr>
                            <tr><td width="25%"><b>{{__('file.Alert Quantity')}}</b></td> <td  width="2%" class="text-center"><b>:</b></td> <td>{{ $product->alert_quantity }}</td></tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@endsection
