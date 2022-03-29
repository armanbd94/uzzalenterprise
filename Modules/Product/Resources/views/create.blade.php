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
                <form id="store_or_update_form" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <input type="hidden" name="has_opening_stock" id="has_opening_stock" value="2"/>

                        <x-form.textbox labelName="{{__('file.Product Name')}}" name="name" required="required" col="col-md-6" placeholder="{{__('file.Enter product name')}}"/>

                        <div class="col-md-6 form-group required">
                            <label for="code">{{__('file.Code')}}</label>
                            <div class="input-group" id="code_section">
                                <input type="text" class="form-control" name="code" id="code">
                                <div class="input-group-prepend">
                                    <span class="input-group-text bg-primary" id="generate-code"  data-toggle="tooltip" data-theme="dark" title="{{__('file.Generate Code')}}"
                                    style="border-top-right-radius: 0.42rem;border-bottom-right-radius: 0.42rem;border:0;cursor: pointer;">
                                        <i class="fas fa-retweet text-white"></i>
                                    </span>
                                </div>
                            </div>
                        </div>

                        <x-form.selectbox labelName="{{__('file.Category')}}" name="category_id" required="required" col="col-md-6" class="selectpicker">
                            @if (!$categories->isEmpty())
                                @foreach ($categories as $category)
                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>

                        <div class="form-group col-md-6 required">
                            <label for="code">{{__('file.Unit')}}</label>
                            <select name="unit_id" id="unit_id"  onchange="populate_unit(this.value)" class="form-control selectpicker" data-live-search="true"  data-live-search-placeholder="Search">
                                <option value="">{{__('file.Select Please')}}</option>
                                @if (!$units->isEmpty())
                                    @foreach ($units as $unit)
                                        @if ($unit->base_unit == null)
                                        <option value="{{ $unit->id }}">{{ $unit->unit_name.' ('.$unit->unit_code.')' }}</option>
                                        @endif
                                    @endforeach
                                @endif
                            </select>
                        </div>
                        
                        <x-form.textbox labelName="{{__('file.Product Price')}}" name="price" required="required" col="col-md-6" placeholder="{{__('file.Enter product price')}}"/>
                        <x-form.textbox labelName="{{__('file.Opening Cost')}}" name="opening_cost" required="required"  col="col-md-6 d-none product-cost" placeholder="0"/>
                        <x-form.textbox labelName="{{__('file.Opening Stock Quantity')}}" name="opening_stock_qty" required="required"  col="col-md-6 d-none product-qty" placeholder="0"/>
                        <x-form.selectbox labelName="{{__('file.Opening Stock Warehouse')}}" name="opening_warehouse_id" required="required"  col="col-md-6 opening-warehouse-id d-none" class="selectpicker" onchange="populate_unit(this.value)">
                            @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $warehouse)
                                    <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.textbox labelName="{{__('file.Alert Quantity')}}" name="alert_qty"  col="col-md-6" placeholder="{{__('file.Enter product alert qty')}}"/>
                        <div class="form-group col-md-6">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="opening_stock">
                                <label class="custom-control-label" for="opening_stock">{{__('file.This product has opening stock')}}</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-md-12 text-left px-0">
                            <button type="button" class="btn btn-danger btn-sm mr-3">{{__('file.Reset')}}</button>
                            <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data(1)">{{__('file.Save')}}</button>
                            <button type="button" class="btn btn-success btn-sm" id="add-another-btn" onclick="store_data(2)">{{__('file.Save And Add Another')}}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@endsection
@push('scripts')
<script>
$(document).ready(function () {

    //Generate Material Code
    $(document).on('click','#generate-code',function(){
        $.ajax({
            url: "{{ route('product.generate.code') }}",
            type: "GET",
            dataType: "JSON",
            beforeSend: function(){
                $('#generate-code').addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#generate-code').removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                data ? $('#store_or_update_form #code').val(data) : $('#store_or_update_form #code').val('');
            },
            error: function (xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    });

    $(document).on('change','#opening_stock', function(){
        if($(this).is(':checked')) {
            $('#has_opening_stock').val(1);
            $('.product-cost,.product-qty,.opening-warehouse-id').removeClass('d-none');
            $('#opening_cost,#opening_stock_qty,#opening_warehouse_id').val('');
            $('#store_or_update_form .selectpicker').selectpicker('refresh');
        }else{
            $('#has_opening_stock').val(2);
            $('#opening_cost,#opening_stock_qty,#opening_warehouse_id').val('');
            $('#store_or_update_form .selectpicker').selectpicker('refresh');
            $('.product-cost,.product-qty,.opening-warehouse-id').addClass('d-none');
        }
    });
});

function store_data(btn){
    let form = document.getElementById('store_or_update_form');
    let formData = new FormData(form);
    let url = "{{route('product.store.or.update')}}";
    let id = $('#update_id').val();
    let method;
    if (id) {
        method = 'update';
    } else {
        method = 'add';
    }
    $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: "JSON",
        contentType: false,
        processData: false,
        cache: false,
        beforeSend: function(){
            btn == 1 ? $('#save-btn').addClass('spinner spinner-white spinner-right') : $('#add-another-btn').addClass('spinner spinner-white spinner-right');
        },
        complete: function(){
            btn == 1 ? $('#save-btn').removeClass('spinner spinner-white spinner-right') : $('#add-another-btn').removeClass('spinner spinner-white spinner-right');
        },
        success: function (data) {
            $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
            $('#store_or_update_form').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value){
                    var key = key.split('.').join('_');
                    $('#store_or_update_form input#' + key).addClass('is-invalid');
                    $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                    $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                    if(key == 'code'){
                        $('#store_or_update_form #' + key).parents('.form-group').append(
                        '<small class="error text-danger">' + value + '</small>');
                    }else{
                        $('#store_or_update_form #' + key).parent().append(
                        '<small class="error text-danger">' + value + '</small>');
                    }
                });
            } else {
                notification(data.status, data.message);
                if (data.status == 'success') {
                    if(btn == 1){
                        window.location.replace("{{ route('product') }}");
                    }else{
                        window.location.replace("{{ route('product.add') }}");
                    }
                }
            }
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
</script>
@endpush
