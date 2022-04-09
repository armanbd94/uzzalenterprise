@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link rel="stylesheet" href="{{asset('css/jquery-ui.css')}}"/>
<link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css"/>
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
                    <a href="{{ route('sale') }}" class="btn btn-warning btn-sm font-weight-bolder">
                        <i class="fas fa-arrow-left"></i>{{__('file.Back')}}</a>
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <form action="" id="sale_store_form" method="post" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="sale_id">
                        <div class="row">
                            <div class="form-group col-md-3 required">
                                <label for="invoice_no">{{__('file.Invoice No.')}}</label>
                                <input type="text" class="form-control" name="invoice_no" id="invoice_no" value="{{ $invoice_no }}" readonly />
                            </div>
                            <x-form.textbox labelName="{{__('file.Sale Date')}}" name="sale_date" value="{{ date('Y-m-d') }}" required="required" class="date" col="col-md-3"/>
                            <x-form.selectbox labelName="{{__('file.Warehouse')}}" name="warehouse_id" required="required" col="col-md-3" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $key => $warehouse)
                                    <option value="{{ $warehouse->id }}"   {{ $key == 0 ? 'selected' : '' }}>{{ $warehouse->name }}</option>
                                @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="form-group col-md-3">
                                <label for="customer_id" style="width: 100%;margin-bottom: 0.1rem;">
                                    <span class="float-left">{{__('file.Customer')}}<b class="text-danger">*</b></span> 
                                    @if(permission('customer-add'))<span class="float-right text-primary" style="cursor: pointer;"
                                    onclick="showNewFormModal('{{ __('file.Add New Customer') }}','{{ __('file.Save') }}')"><i class="fas fa-plus text-primary"></i> {{ __('file.Add New') }}</span>
                                    @endif
                                </label>
                                <select class="form-control selectpicker" name="customer_id" id="customer_id" data-live-search="true" ></select>          
                            </div>


                            <div class="col-md-12">
                                <table class="table table-bordered" id="product_table">
                                    <thead class="bg-primary">
                                        <th class="text-center">{{__('file.Name')}}</th>
                                        <th class="text-center">{{__('file.Vehicle No')}}</th>
                                        <th class="text-center">{{__('file.Challan No')}}</th>
                                        <th class="text-center">{{__('file.Quantity')}}</th>
                                        <th class="text-right">{{__('file.Price')}}</th>
                                        <th class="text-right">{{__('file.Subtotal')}}</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>                                                  
                                                <select name="products[1][id]" id="products_1_id" onchange="setProductData(1)" class="fcs col-md-12 product_data form-control selectpicker"  data-live-search="true" data-row="1">                                            
                                                    @if (!$products->isEmpty())
                                                        <option value="0">Please Select</option>
                                                    @foreach ($products as $product)
                                                        <option value="{{ $product->id }}" data-price="{{ $product->price }}" data-cost="{{ $product->cost ?? 0 }}">{{ $product->name.' ('.$product->code.')' }}</option>
                                                    @endforeach
                                                    @endif
                                                </select> 
                                            </td>                                        
                                            <td><input type="text" class="form-control product_data vehicle_no text-left" name="products[1][vehicle_no]" id="products_1_vehicle_no"  data-row="1"></td>
                                            <td><input type="text" class="form-control product_data text-left" name="products[1][challan_no]" id="products_1_challan_no"  data-row="1"></td>
                                            <td><input type="text" class="form-control qty  product_data text-center" onkeyup="calculateRowTotal(1)" name="products[1][qty]" id="products_1_qty"  data-row="1"></td>
                                            <td><input type="text" class="text-right form-control  product_data price" onkeyup="calculateRowTotal(1)" name="products[1][price]" id="products_1_price" data-row="1"></td>
                                            <td class="subtotal_1  product_data text-right" data-row="1"></td>
                                            <td></td>
                                            <input type="hidden" class="text-right  product_data form-control net_unit_cost" name="products[1][net_unit_cost]" id="products_1_net_unit_cost" data-row="1">
                                            <input type="hidden" class="subtotal  product_data" id="products_1_subtotal" name="products[1][subtotal]" data-row="1">
                                            <input type="hidden" class="subtotal_cost  product_data" id="products_1_subtotal_cost" name="products[1][subtotal_cost]" data-row="1">
                                       </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3" class="font-weight-bolder">{{ __('file.Total') }}</td>
                                            <td id="total-qty" class="text-center font-weight-bolder">0</td>
                                            <td></td>
                                            <td id="total" class="text-right font-weight-bolder">0.00</td>
                                            <td class="text-center">
                                                <button type="button" class="btn btn-success btn-sm add-product"><i class="fas fa-plus"></i></button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right font-weight-bolder" colspan="5">{{ __('file.Shipping Cost') }}</td>
                                            <td><input type="text" class="fcs form-control payment_data text-right" name="shipping_cost" id="shipping_cost" onkeyup="calculateNetTotal()" placeholder="0.00"></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="row">
                                                    <x-form.selectbox labelName="{{ __('file.Payment Status') }}" name="payment_status" required="required"  col="col-md-6 mb-0" class="fcs selectpicker" data-live-search="true">
                                                        @foreach (PAYMENT_STATUS as $key => $value)
                                                        <option value="{{ $key }}">{{ $value }}</option>
                                                        @endforeach
                                                    </x-form.selectbox>
                                                    <x-form.selectbox labelName="{{ __('file.Payment Method') }}" name="payment_method" onchange="account_list(this.value)" required="required"  col="col-md-6 payment_row d-none" class="selectpicker" data-live-search="true">
                                                        @foreach (SALE_PAYMENT_METHOD as $key => $value)
                                                        <option value="{{ $key }}">{{ $value }}</option>
                                                        @endforeach
                                                    </x-form.selectbox>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-bolder">{{ __('file.Grand Total') }}</td>
                                            <td><input type="text" class="fcs form-control payment_data text-right bg-secondary" name="grand_total" id="grand_total" placeholder="0.00" readonly></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <div class="row payment_row d-none">
                                                    <x-form.selectbox labelName="Account" name="account_id" required="required"  col="col-md-6" class="fcs selectpicker"/>
                                                    <div class="form-group col-md-6 d-none reference_no">
                                                        <label for="reference_no">{{ __('file.Reference No.') }}</label>
                                                        <input type="text" class="fcs form-control" name="reference_no" id="reference_no">
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-right font-weight-bolder">{{ __('file.Paid Amount') }}</td>
                                            <td>
                                                <div class="form-group mb-0">
                                                <input type="text" class="fcs form-control payment_data text-right" name="paid_amount" id="paid_amount" onkeyup="calculateNetTotal()" placeholder="0.00">
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="text-right font-weight-bolder" colspan="5">{{ __('file.Due Amount') }}</td>
                                            <td><input type="text" class="fcs form-control payment_data bg-secondary text-right" name="due_amount" id="due_amount" placeholder="0.00" readonly></td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>


                            <div class="form-group col-md-12">
                                <label for="note">{{__('file.Note')}}</label>
                                <textarea  class="form-control product_data" name="note" id="note" cols="30" rows="3"></textarea>
                            </div>



                            <div class="col-md-12">
                                <input type="hidden" name="total_qty" class="product_data">
                                <input type="hidden" name="total_cost" id="total_cost"  class="product_data">
                                <input type="hidden" name="total_price" id="total_price"  class="product_data">
                                <input type="hidden" name="item"  class="product_data">
                            </div>
                            <div class="form-grou col-md-12 text-center pt-5">
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="sale-save-btn1" onclick="store_data(1)"><i class="fas fa-save"></i>{{__('file.Save')}}</button>
                                <button type="button" class="btn btn-success btn-sm mr-3" id="sale-save-btn2" onclick="store_data(2)"><i class="fas fa-save"></i>{{__('file.Save & Add New')}}</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@include('customer::customer-form-modal')
@endsection

@push('scripts')
<script src="{{asset('js/jquery-ui.js')}}"></script>
<script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
<script>
$("#kt_body").addClass("aside-minimize");
$(document).ready(function () {
    $('.date').datetimepicker({format: 'YYYY-MM-DD'});
    $('#payment_status').on('change',function(){
        if($(this).val() != 3){
            $('.payment_row').removeClass('d-none');
            if($(this).val() == 1)
            {
                var grand_total   = $('#grand_total').val() ? parseFloat($('#grand_total').val()) : 0;
                $('#paid_amount').val(grand_total.toFixed(2));
                $('#paid_amount').prop('readonly', true).addClass('bg-secondary');
            }else{
                $('#paid_amount').prop('readonly', false).removeClass('bg-secondary');
            }
            
        }else{
            $('#paid_amount').val('0.00');
            $('#paid_amount').prop('readonly', true).addClass('bg-secondary');
            $('.payment_row').addClass('d-none');
        }
        calculateNetTotal();
    });

    $('#payment_method').on('change',function(){
        if($(this).val() != 1){
            $('.reference_no').removeClass('d-none');
        }else{
            $('.reference_no').addClass('d-none');
        }
    });


    $('#product_table').on('click','.remove-product',function(){
        $(this).closest('tr').remove();
        calculateTotal();
    });

    var count = 1;
    $('#product_table').on('click','.add-product',function(){
        count++;
        product_row_add(count);
    }); 
       
    

    $("#product_table").on('input', '.vehicle_no', function() {
        var input = $(this);
        row = $(this).data('row');
        $(input).autocomplete({
        source: function( request, response ) {
            $.ajax({
            url: '{{route('vehicle.search')}}',
            type: 'post',
            dataType: 'json',
            data: {
                search: request.term,_token:_token
            },
            success: function( data ) {
                response($.map(data, function (item) {
                    return {
                        label: item.name,
                        value: item.name,
                        qty: item.qty
                    };
                }));
            }
            });
        },
        minLength: 1,
        select: function(event, ui) {
            var data = ui.item;
            var qty = data.qty;
            $(`#products_${row}_qty`).val(qty);
            calculateRowTotal(row);
        }
        });
        var vehicle_no = input.val();
        $(this).val(vehicle_no);
    });
    //Customer Form Data Save Code
    $(document).on('click', '#save-btn', function() {
        let form = document.getElementById('store_or_update_form');
        let formData = new FormData(form);
        $.ajax({
            url: "{{route('customer.store.or.update')}}",
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function() {
                $('#save-btn').addClass('spinner spinner-white spinner-right');
            },
            complete: function() {
                $('#save-btn').removeClass('spinner spinner-white spinner-right');
            },
            success: function(data) {
                $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                $('#store_or_update_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function(key, value) {
                        var key = key.split('.').join('_');
                        $('#store_or_update_form input#' + key).addClass('is-invalid');
                        $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                        $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                        $('#store_or_update_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        $('#store_or_update_modal').modal('hide');
                        customer_list(data.id);
                    }
                }

            },
            error: function(xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    });

});

function product_row_add(count){
    var html = ` <tr>
                    <td>                                                  
                        <select name="products[${count}][id]" id="products_${count}_id" onchange="setProductData(${count})"  class="fcs col-md-12 form-control selectpicker" data-live-search="true" data-row="${count}">                                            
                            @if (!$products->isEmpty())
                                <option value="0">Please Select</option>
                            @foreach ($products as $product)
                                <option value="{{ $product->id }}" data-price="{{ $product->price }}" data-cost="{{ $product->cost ?? 0 }}">{{ $product->name.' ('.$product->code.')' }}</option>
                            @endforeach
                            @endif
                        </select> 
                    </td>                                        
                    <td><input type="text" class="form-control vehicle_no text-left" name="products[${count}][vehicle_no]" id="products_${count}_vehicle_no"  data-row="${count}"></td>
                    <td><input type="text" class="form-control text-left" name="products[${count}][challan_no]" id="products_${count}_challan_no"  data-row="${count}"></td>
                    <td><input type="text" class="form-control qty text-center" onkeyup="calculateRowTotal(${count})" name="products[${count}][qty]" id="products_${count}_qty"  data-row="${count}"></td>
                    <td><input type="text" class="text-right form-control price" onkeyup="calculateRowTotal(${count})" name="products[${count}][price]" id="products_${count}_price" data-row="${count}"></td>
                    <td class="subtotal_${count} text-right" data-row="${count}"></td>
                    <td><button type="button" class="btn btn-danger btn-sm remove-product"><i class="fas fa-trash"></i></button></td>
                    <input type="hidden" class="text-right form-control net_unit_cost" onkeyup="calculateRowTotal(${count})" name="products[${count}][net_unit_cost]" id="products_${count}_net_unit_cost" data-row="${count}">
                    <input type="hidden" class="subtotal" id="products_${count}_subtotal" name="products[${count}][subtotal]" data-row="${count}">
                    <input type="hidden" class="subtotal_cost" id="products_${count}_subtotal_cost" name="products[${count}][subtotal_cost]" data-row="${count}">
                </tr>`;
    $('#product_table tbody').append(html);
    $('#product_table .selectpicker').selectpicker();
} 

function setProductData(row)
{
    let cost = $(`#products_${row}_id option:selected`).data('cost');
    let price = $(`#products_${row}_id option:selected`).data('price');

    $(`#products_${row}_net_unit_cost`).val(parseFloat(cost ? cost : 0));
    $(`#products_${row}_price`).val(parseFloat(price ? price : 0));
    calculateRowTotal(row);
}

function calculateRowTotal(row)
{
    let cost = $(`#products_${row}_net_unit_cost`).val() ? parseFloat($(`#products_${row}_net_unit_cost`).val()) : 0;
    let price = $(`#products_${row}_price`).val() ? parseFloat($(`#products_${row}_price`).val()) : 0;
    let qty = $(`#products_${row}_qty`).val() ? parseFloat($(`#products_${row}_qty`).val()) : 0;
    if(qty < 0 && qty != ''){
        qty = 0;
        $(`#products_${row}_qty`).val('');
    }
    if(price < 0 && price != ''){
        price = 0;
        $(`#products_${row}_price`).val('');
    }

    if(cost < 0 && cost != ''){
        cost = 0;
        $(`#products_${row}_net_unit_cost`).val('');
    }

    $(`.subtotal_${row}`).text((qty * price).toFixed(2));
    $(`#products_${row}_subtotal`).val((qty * price).toFixed(2));
    $(`#products_${row}_subtotal_cost`).val(parseFloat(qty * cost));
    
    calculateTotal();
}

function calculateTotal()
{
    //sum of qty
    var total_qty = 0;
    $('.qty').each(function() {
        if($(this).val() == ''){
            total_qty += 0;
        }else{
            total_qty += parseFloat($(this).val());
        }
    });
    
    $('#total-qty').text(total_qty);
    $('input[name="total_qty"]').val(total_qty);

    //sum of subtotal
    var total_cost = 0;
    $('.subtotal_cost').each(function() {
        if($(this).val() == ''){
            total_cost += 0;
        }else{
            total_cost += parseFloat($(this).val());
        }
    });

    //sum of subtotal
    var total = 0;
    $('.subtotal').each(function() {
        if($(this).val() == ''){
            total += 0;
        }else{
            total += parseFloat($(this).val());
        }
    });

    $('#total').text(total.toFixed(2));
    $('input[name="total_cost"]').val(total_cost);
    $('input[name="total_price"]').val(total.toFixed(2));
    var item = $('#product_table tbody tr:last').index()+1;
    $('input[name="item"]').val(item);
    calculateNetTotal();
}
function calculateNetTotal()
{
    var total_price  = $('#total_price').val() ? parseFloat($('#total_price').val()) : 0;
    var shipping_cost = $('#shipping_cost').val() ? parseFloat($('#shipping_cost').val()) : 0;
    var grand_total = total_price + shipping_cost;
    var paid_amount = $('#paid_amount').val() ? parseFloat($('#paid_amount').val()) : 0;
    var due_amount = grand_total - paid_amount;
    $('#grand_total').val(grand_total.toFixed(2));
    $('#due_amount').val(due_amount.toFixed(2));
}
function account_list(payment_method)
{
    $.ajax({
        url: "{{route('account.list')}}",
        type: "POST",
        data: { payment_method: payment_method,_token: _token},
        success: function (data) {
            $('#sale_store_form #account_id').empty().html(data);
            $('#sale_store_form #account_id.selectpicker').selectpicker('refresh');
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}

customer_list();
function customer_list(customer_id = '') {
    $.ajax({
        url: "{{route('customer.list')}}",
        type: "POST",
        data: { _token: _token},
        success: function(data) {
            $('#sale_store_form #customer_id').empty().html(data);
            $('#sale_store_form #customer_id.selectpicker').selectpicker('refresh');
            if(customer_id)
            {
                $('#sale_store_form #customer_id').val(customer_id);
                $('#sale_store_form #customer_id.selectpicker').selectpicker('refresh');
                
            }
        },
        error: function(xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
function showNewFormModal(modal_title, btn_text) {
    $('#store_or_update_form')[0].reset();
    $('#store_or_update_form #update_id').val('');
    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
    $('#store_or_update_form').find('.error').remove();
    $('#store_or_update_form .selectpicker').selectpicker('refresh');
    $('#store_or_update_form .pbalance').removeClass('d-none');

    $('#store_or_update_modal').modal({
        keyboard: false,
        backdrop: 'static',
    });
    $('#store_or_update_modal .modal-title').html('<i class="fas fa-plus-square text-white"></i> '+modal_title);
    $('#store_or_update_modal #save-btn').text(btn_text);
}



function store_data(type){
    var rownumber = $('table#product_table tbody tr:last').index();
    if (rownumber < 0) {
        let error = '{{__('file.Please insert product to order table!')}}'
        notification("error",error)
    }else{
        let form = document.getElementById('sale_store_form');
        let formData = new FormData(form);
        let url = "{{route('sale.store')}}";
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function(){
                $('#sale-save-btn'+type).addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#sale-save-btn'+type).removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                $('#sale_store_form').find('.is-invalid').removeClass('is-invalid');
                $('#sale_store_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        console.log(key);
                        $('#sale_store_form input#' + key).addClass('is-invalid');
                        $('#sale_store_form textarea#' + key).addClass('is-invalid');
                        $('#sale_store_form select#' + key).parent().addClass('is-invalid');
                        $('#sale_store_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        if(type == 1)
                        {
                            window.location.replace("{{ route('sale') }}");
                        }else{

                            $('#invoice_no').val(data.invoice_no);
                            $('#product_table tbody').find('tr').remove();

                            $('.product_data').val('');
                            $('.product_data').text('');
                            $('#total-qty').text('0');
                            $('#total').text('0.00');
                            $('.payment_data').val('');
                            $('#payment_status,#payment_method,#reference_no').val('');
                            $('#account_id').empty();
                            $('.payment_row').addClass('d-none');
                            $('.reference_no').addClass('d-none');
                            $('#payment_status.selectpicker,#payment_method.selectpicker,#account_id.selectpicker,#products_1_id.selectpicker').selectpicker('refresh');
                            count = 1;
                            product_row_add(count);
                        }

                    }
                }

            },
            error: function (xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }

}
</script>
@endpush
