@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link rel="stylesheet" href="{{asset('css/jquery-ui.css')}}"/>
<link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css"/>
<style>
    .small-btn{
        width: 20px !important;
        height: 20px !important;
        padding: 0 !important;
    }
    .small-btn i{font-size: 10px !important;}
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
                    <a href="{{ route('purchase') }}" class="btn btn-warning btn-sm font-weight-bolder">
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
                    <form action="" id="purchase_store_form" method="post" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="purchase_id">
                        <div class="row">
                            <div class="form-group col-md-4 required">
                                <label for="chalan_no">{{__('file.Memo No.')}}</label>
                                <input type="text" class="form-control" name="memo_no" id="memo_no" value="{{ isset($purchase_data) ? $purchase_data['purchase']['memo_no'] : '' }}" />
                            </div>
                            <x-form.textbox labelName="{{__('file.Purchase Date')}}" name="purchase_date" value="{{ isset($purchase_data) ? $purchase_data['purchase']['purchase_date'] : date('Y-m-d') }}" required="required" class="date" col="col-md-4"/>
                            <x-form.selectbox labelName="{{__('file.Warehouse')}}" name="warehouse_id" required="required" col="col-md-4" class="selectpicker">
                                @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $warehouse)
                                    <option value="{{ $warehouse->id }}"  @if(isset($purchase_data)) {{ ($purchase_data['purchase']['warehouse_id'] == $warehouse->id) ? 'selected' : ''}} @endif>{{ $warehouse->name }}</option>
                                @endforeach
                                @endif
                            </x-form.selectbox>
                            <div class="form-group col-md-3">
                                <label for="supplier_id" style="width: 100%;margin-bottom: 0.1rem;">
                                    <span class="float-left">{{__('file.Supplier')}}<b class="text-danger">*</b></span> 
                                    @if(permission('supplier-add'))<span class="float-right text-primary" style="cursor: pointer;"
                                    onclick="showNewFormModal('Add New Supplier','Save')"><i class="fas fa-plus text-primary"></i> {{ __('file.New') }}</span>
                                    @endif
                                </label>
                                <select class="form-control selectpicker" name="supplier_id" id="supplier_id" data-live-search="true" ></select>          
                            </div>


                            <div class="form-group col-md-4">
                                <label for="document">{{__('file.Attach Document')}}</label>
                                <input type="file" class="form-control" name="document" id="document">
                            </div>

                            <div class="col-md-12">
                                <table class="table table-bordered" id="material_table">
                                    <thead class="bg-primary">
                                        <th class="text-center">{{__('file.Name')}}</th>
                                        <th class="text-center">{{__('file.Vehicle No')}}</th>
                                        <th class="text-center">{{__('file.Challan No')}}</th>
                                        <th class="text-center">{{__('file.Quantity')}}</th>
                                        <th class="text-right">{{__('file.Net Unit Cost')}}</th>
                                        <th class="text-right">{{__('file.Subtotal')}}</th>
                                        <th></th>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                    <tfoot class="bg-primary">
                                        <th colspan="3" class="font-weight-bolder">{{__('file.Total')}}</th>
                                        <th id="total-qty" class="text-center font-weight-bolder">{{ isset($purchase_data) ? $purchase_data['purchase']['total_qty']: '0' }}</th>
                                        <th></th>
                                        <th id="total" class="text-right font-weight-bolder">{{ isset($purchase_data) ? $purchase_data['purchase']['total_cost']: '0.00' }}</th>
                                        <th></th>
                                    </tfoot>
                                </table>
                            </div>

                            <x-form.selectbox labelName="{{__('file.Order Tax')}}" name="order_tax_rate" col="col-md-3" class="selectpicker">
                                <option value="0" selected>{{__('file.No Tax')}}</option>
                                @if (!$taxes->isEmpty())
                                    @foreach ($taxes as $tax)
                                        <option value="{{ $tax->rate }}" @if(isset($purchase_data)) {{ ($purchase_data['purchase']['order_tax_rate'] == $tax->rate) ? 'selected' : ''}} @endif>{{ $tax->name }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>

                            <div class="form-group col-md-3">
                                <label for="order_discount order-discount">{{__('file.Order Discount')}}</label>
                                <input type="text" class="form-control tag-text-change" name="order_discount" id="order_discount" value="{{ isset($purchase_data) ? $purchase_data['purchase']['order_discount'] : '' }}">
                            </div>
                            <div class="form-group col-md-3">
                                <label for="shipping_cost">{{__('file.Shipping Cost')}}</label>
                                <input type="text" class="form-control tag-text-change" name="shipping_cost" id="shipping_cost" value="{{ isset($purchase_data) ? $purchase_data['purchase']['shipping_cost'] : '' }}">
                            </div>
                            <x-form.selectbox labelName="{{__('file.Payment Status')}}" name="payment_status" required="required"  col="col-md-3" class="selectpicker">
                                @foreach (PAYMENT_STATUS as $key => $value)
                                <option value="{{ $key }}" @if(isset($purchase_data)) {{ ($purchase_data['purchase']['payment_status'] == $key) ? 'selected' : ''}} @endif>{{ $value }}</option>
                                @endforeach
                            </x-form.selectbox>
                            <div class="payment col-md-12 @if(isset($purchase_data)) {{ ($purchase_data['purchase']['payment_status'] == 3) ? 'd-none' : '' }} @else {{ 'd-none' }} @endif">
                                <div class="row">
                                    <div class="form-group col-md-3 required">
                                        <label for="paid_amount">{{__('file.Paid Amount')}}</label>
                                        <input type="text" class="form-control" name="paid_amount" id="paid_amount"  value="{{ isset($purchase_data) ? $purchase_data['purchase']['paid_amount']: '' }}">
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="due_amount">{{__('file.Due Amount')}}</label>
                                        <input type="text" class="form-control" id="due_amount"  value="{{ isset($purchase_data) ? $purchase_data['purchase']['due_amount']: '' }}" readonly>
                                    </div>
                                    <x-form.selectbox labelName="{{__('file.Payment Method')}}" name="payment_method" onchange="account_list(this.value)" required="required"  col="col-md-3" class="selectpicker">
                                        @foreach (PAYMENT_METHOD as $key => $value)
                                        <option value="{{ $key }}"  @if(isset($purchase_data)) {{ ($purchase_data['purchase']['payment_method'] == $key) ? 'selected' : '' }} @endif>{{ $value }}</option>
                                        @endforeach
                                    </x-form.selectbox>
                                    <x-form.selectbox labelName="{{__('file.Account')}}" name="account_id" required="required"  col="col-md-3" class="selectpicker"/>
                                    <div class="form-group col-md-3 @if(isset($purchase_data)) {{ ($purchase_data['purchase']['payment_status'] != 2) ? 'd-none' : '' }} @else {{ 'd-none' }} @endif cheque_number required">
                                        <label for="cheque_number">{{__('file.Cheque No.')}}</label>
                                        <input type="text" class="form-control" name="cheque_number" id="cheque_number"  value="{{ isset($purchase_data) ? $purchase_data['purchase']['cheque_no']: '' }}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="shipping_cost">{{__('file.Note')}}</label>
                                <textarea  class="form-control" name="note" id="note" cols="30" rows="3">{{ isset($purchase_data) ? $purchase_data['purchase']['note'] : '' }}</textarea>
                            </div>
                            <div class="col-md-12">
                                <table class="table table-bordered">
                                    <thead class="bg-primary">
                                        <th><strong>{{__('file.Items')}}</strong><span class="float-right" id="item">{{ isset($purchase_data) ? $purchase_data['purchase']['item'].'('.$purchase_data['purchase']['total_qty'].')': '0.00' }}</span></th>
                                        <th><strong>{{__('file.Total')}}</strong><span class="float-right" id="subtotal">{{ isset($purchase_data) ? $purchase_data['purchase']['total_cost']: '0.00' }}</span></th>
                                        <th><strong>{{__('file.Order Tax')}}</strong><span class="float-right" id="order_total_tax">{{ isset($purchase_data) ? $purchase_data['purchase']['order_tax']: '0.00' }}</span></th>
                                        <th><strong>{{__('file.Order Discount')}}</strong><span class="float-right" id="order_total_discount">{{ isset($purchase_data) ? $purchase_data['purchase']['total_discount']: '0.00' }}</span></th>
                                        <th><strong>{{__('file.Shipping Cost')}}</strong><span class="float-right" id="shipping_total_cost">{{ isset($purchase_data) ? $purchase_data['purchase']['shipping_cost']: '0.00' }}</span></th>
                                        <th><strong>{{__('file.Grand Total')}}</strong><span class="float-right" id="grand_total">{{ isset($purchase_data) ? $purchase_data['purchase']['grand_total']: '0.00' }}</span></th>
                                    </thead>
                                </table>
                            </div>

                            <div class="col-md-12">
                                <input type="hidden" name="total_qty" value="{{ isset($purchase_data) ? $purchase_data['purchase']['total_qty']: '' }}">
                                <input type="hidden" name="total_discount" value="{{ isset($purchase_data) ? $purchase_data['purchase']['total_discount']: '' }}">
                                <input type="hidden" name="total_tax" value="{{ isset($purchase_data) ? $purchase_data['purchase']['total_tax']: '' }}">
                                <input type="hidden" name="total_labor_cost" value="{{ isset($purchase_data) ? $purchase_data['purchase']['total_labor_cost']: '' }}">
                                <input type="hidden" name="total_cost" value="{{ isset($purchase_data) ? $purchase_data['purchase']['total_cost']: '' }}">
                                <input type="hidden" name="item" value="{{ isset($purchase_data) ? $purchase_data['purchase']['item']: '' }}">
                                <input type="hidden" name="order_tax" value="{{ isset($purchase_data) ? $purchase_data['purchase']['order_tax']: '' }}">
                                <input type="hidden" name="grand_total" value="{{ isset($purchase_data) ? $purchase_data['purchase']['grand_total']: '' }}">
                            </div>
                            <div class="form-grou col-md-12 text-center pt-5">
                                <button type="button" class="btn btn-danger btn-sm mr-3"><i class="fas fa-sync-alt"></i>{{__('file.Reset')}}</button>
                                <button type="button" class="btn btn-primary btn-sm mr-3" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i>{{__('file.Save')}}</button>
                                <button type="button" class="btn btn-warning btn-sm mr-3" id="hold-btn" onclick="hold_data()"><i class="far fa-hand-rock"></i>{{__('file.Hold')}}</button>
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
@include('supplier::modal')
@endsection

@push('scripts')
<script src="{{asset('js/jquery-ui.js')}}"></script>
<script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
<script>
    function _(x){
        return document.getElementById(x);
    }
    $(document).on('input','.tag-text-change',function(){
        let id = $(this).attr('id');
        console.log(id);
        if(id == 'shipping_cost'){
            _('shipping_total_cost').innerText = $(this).val();
        }else if(id == 'order_discount'){
            _('order_total_discount').innerText = $(this).val();
        }
    })
$(document).ready(function () {
    $('.date').datetimepicker({format: 'YYYY-MM-DD'});

    //array data depend on warehouse
    var material_array = [];
    var material_code  = [];
    var material_name  = [];
    var material_qty   = [];

    // array data with selection
    var material_cost        = [];
    var material_labor_cost  = [];
    var material_discount    = [];
    var tax_rate             = [];
    var tax_name             = [];
    var tax_method           = [];
    var unit_name            = [];
    var unit_operator        = [];
    var unit_operation_value = [];

    //temporary array
    var temp_unit_name            = [];
    var temp_unit_operator        = [];
    var temp_unit_operation_value = [];

    var rowindex;
    var row_material_cost;

    @if (isset($purchase_data))
        @if (!empty($purchase_data['materials']) && (count($purchase_data['materials']) > 0))
    var rownumber = $('#material_table tbody tr:last').index();
    for (rowindex = 0; rowindex <= rownumber; rowindex++) {
        material_cost.push(parseFloat($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.material-cost').val()));
        var total_discount = parseFloat($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('td:nth-child(7)').text())
        var quantity = parseFloat($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.qty').val())
        material_discount.push((total_discount/quantity).toFixed(2));
        tax_rate.push(parseFloat($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-rate').val()));
        tax_name.push($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-name').val());
        tax_method.push($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.tax-method').val());
        temp_unit_name = $('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.purchase-unit').val().split(',');
        unit_name.push($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.purchase-unit').val());
        unit_operator.push($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.purchase-unit-operator').val());
        unit_operation_value.push($('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.purchase-unit-operation-value').val());
        $('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.purchase-unit').val(temp_unit_name[0]);
        $('#material_table tbody tr:nth-child('+ (rowindex + 1) +')').find('.unit-name').text(temp_unit_name[0]);
    }
    @endif
    @endif
    $('#material_code_name').autocomplete({
        source: "{{url('material-autocomplete-search')}}",
        source: function( request, response ) {
          // Fetch data
          $.ajax({
            url:"{{url('material-autocomplete-search')}}",
            type: 'post',
            dataType: "json",
            data: {
               _token: _token,
               search: request.term
            },
            success: function( data ) {
               response( data );
            }
          });
        },
        minLength: 3,
        response: function(event, ui) {
            if (ui.content.length == 1) {
                var data = ui.content[0].value;
                $(this).autocomplete( "close" );
                materialSearch(data);
            };
        },
        select: function (event, ui) {
            // $('.material_search').val(ui.item.value);
            // $('.material_id').val(ui.item.id);
            var data = ui.item.value;
            materialSearch(data);
        },
    }).data('ui-autocomplete')._renderItem = function (ul, item) {
        return $("<li class='ui-autocomplete-row'></li>")
            .data("item.autocomplete", item)
            .append(item.label)
            .appendTo(ul);
    };

     //Edit Product
     $('#material_table').on('click','.edit-material', function(){
        rowindex = $(this).closest('tr').index();
        var row_material_name = $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(1)').text();
        var row_material_code = $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(2)').text();
        $('#model-title').text(row_material_name+'('+row_material_code+')');

        var qty = $(this).closest('tr').find('.qty').val();
        $('#edit_qty').val(qty);
        $('#edit_discount').val(parseFloat(material_discount[rowindex]).toFixed(2));

        unitConversion();
        $('#edit_unit_cost').val(row_material_cost.toFixed(2));

        var tax_name_all = <?php echo json_encode($tax_name_all); ?>;
        var pos = tax_name_all.indexOf(tax_name[rowindex]);
        $('#edit_tax_rate').val(pos);

        temp_unit_name = (unit_name[rowindex]).split(',');
        temp_unit_name.pop();
        temp_unit_operator = (unit_operator[rowindex]).split(',');
        temp_unit_operator.pop();
        temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
        temp_unit_operation_value.pop();

        $('#edit_unit').empty();

        $.each(temp_unit_name, function(key,value){
            $('#edit_unit').append('<option value="'+key+'">'+value+'</option>');
        });
        $('.selectpicker').selectpicker('refresh');
    });

    //Update Edit Product Data
    $('#update-btn').on('click',function(){
        var edit_discount  = $('#edit_discount').val();
        var edit_qty       = $('#edit_qty').val();
        var edit_unit_cost = $('#edit_unit_cost').val();

        if(parseFloat(edit_discount) > parseFloat(edit_unit_cost))
        {
            let error = '{{__('file.Invalid discount input')}}'
            notification('error',error);
            return;
        }

        if(edit_qty < 1)
        {
            $('#edit_qty').val(1);
            edit_qty = 1;
            let error = '{{__('file.Quantity can\'t be less than 1')}}'
            notification('error',error);
        }

        var row_unit_operator = unit_operator[rowindex].slice(0,unit_operator[rowindex].indexOf(','));
        var row_unit_operation_value = unit_operation_value[rowindex].slice(0,unit_operation_value[rowindex].indexOf(','));
        row_unit_operation_value = parseFloat(row_unit_operation_value);
        var tax_rate_all = <?php echo json_encode($tax_rate_all); ?>;

        tax_rate[rowindex] = parseFloat(tax_rate_all[$('#edit_tax_rate option:selected').val()]);
        tax_name[rowindex] = $('#edit_tax_rate option:selected').text();

        if(row_unit_operator == '*')
        {
            material_cost[rowindex] = $('#edit_unit_cost').val() / row_unit_operation_value;
        }else{
            material_cost[rowindex] = $('#edit_unit_cost').val() * row_unit_operation_value;
        }

        material_discount[rowindex] = $('#edit_discount').val();
        var position = $('#edit_unit').val();
        var temp_operator = temp_unit_operator[position];
        var temp_operation_value = temp_unit_operation_value[position];
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.purchase-unit').val(temp_unit_name[position]);
        temp_unit_name.splice(position,1);
        temp_unit_operator.splice(position,1);
        temp_unit_operation_value.splice(position,1);

        temp_unit_name.unshift($('#edit_unit option:selected').text());
        temp_unit_operator.unshift(temp_operator);
        temp_unit_operation_value.unshift(temp_operation_value);

        unit_name[rowindex] = temp_unit_name.toString() + ',';
        unit_operator[rowindex] = temp_unit_operator.toString() + ',';
        unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
        checkQuantity(edit_qty,false);
    });

    $('#material_table').on('keyup','.qty',function(){
        rowindex = $(this).closest('tr').index();
        if($(this).val() < 1 && $(this).val() != ''){
            $('#material_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val(1);
            let error = '{{__('file.Quantity can\'t be less than 1')}}'
            notification('error',error);
        }

        checkQuantity($(this).val(),true,input=2);
    });
    $('#material_table').on('keyup','.net_unit_cost',function(){
        rowindex = $(this).closest('tr').index();
        if($(this).val() < 1 && $(this).val() != ''){
            $('#material_table tbody tr:nth-child('+(rowindex + 1)+') .net_unit_cost').val(1);
            let error = '{{__('file.Net unit price can\'t be less than 1')}}'
            notification('error',error);
        }else{
            material_cost[rowindex] = $('#material_table tbody tr:nth-child('+(rowindex + 1)+') .net_unit_cost').val();
        }
        var qty = $('#material_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val();
        if(qty > 0){
            checkQuantity(qty,true,input=1);
        }

    });

    $('#material_table').on('click','.remove-material',function(){
        rowindex = $(this).closest('tr').index();
        material_cost.splice(rowindex,1);
        material_discount.splice(rowindex,1);
        tax_rate.splice(rowindex,1);
        tax_name.splice(rowindex,1);
        tax_method.splice(rowindex,1);
        unit_name.splice(rowindex,1);
        unit_operator.splice(rowindex,1);
        unit_operation_value.splice(rowindex,1);
        $(this).closest('tr').remove();
        calculateTotal();
    });
    @if (isset($purchase_data) && (count($purchase_data['materials']) > 0))
    var count = "{{ count($purchase_data['materials']) }}";
    @else
    var count = 1;
    @endif

    function materialSearch(data) {
        $.ajax({
            url: '{{ route("material.search") }}',
            type: 'POST',
            data: {
                data: data,_token:_token
            },
            success: function(data) {
                var flag = 1;
                $('.material-code').each(function(i){
                    if($(this).val() == data.code){
                        rowindex = i;
                        var qty = parseFloat($('#material_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val()) + 1;
                        $('#material_table tbody tr:nth-child('+(rowindex + 1)+') .qty').val(qty);
                        calculateProductData(qty,input=2);
                        flag = 0;
                    }
                });
                $('#material_code_name').val('');
                if(flag)
                {
                    temp_unit_name = data.unit_name.split(',');
                    var newRow = $('<tr>');
                    var cols = '';
                    cols += `<td>`+data.name+`</td>`;

                    cols += `<td class="text-center">`+data.code+`</td>`;
                    cols += `<td class="unit-name text-center"></td>`;
                    cols += `<td><input type="text" class="form-control qty text-center" name="materials[`+count+`][qty]"
                        id="materials_`+count+`_qty" value="1"></td>`;

                    if($('#purchase_status option:selected').val() == 1)
                    {
                        cols += `<td class="received-material-qty d-none"><input type="text" class="form-control received text-center"
                            name="materials[`+count+`][received]" value="1"></td>`;

                    }else if($('#purchase_status option:selected').val() == 2){

                        cols += `<td class="received-material-qty"><input type="text" class="form-control received text-center"
                            name="materials[`+count+`][received]" value="1"></td>`;
                    }else{
                        cols += `<td class="received-material-qty d-none"><input type="text" class="form-control received text-center"
                            name="materials[`+count+`][received]" value="0"></td>`;
                    }

                    cols += `<td><input type="text" class="net_unit_cost form-control text-right" id="materials_${count}_net_unit_cost" name="materials[`+count+`][net_unit_cost]"></td>`;
                    cols += `<td class="discount text-right"></td>`;
                    cols += `<td class="tax text-right"></td>`;
                    cols += `<td class="sub-total text-right"></td>`;
                    cols += `<td class="text-center"><button type="button" class="edit-material btn btn-sm btn-primary mr-2 small-btn" data-toggle="modal"
                        data-target="#editModal"><i class="fas fa-edit"></i></button>
                        <button type="button" class="btn btn-danger btn-sm remove-material small-btn"><i class="fas fa-trash"></i></button></td>`;
                    cols += `<input type="hidden" class="material-id" name="materials[`+count+`][id]"  value="`+data.id+`">`;
                    cols += `<input type="hidden"  name="materials[`+count+`][name]" value="`+data.name+`">`;
                    cols += `<input type="hidden" class="material-code" name="materials[`+count+`][code]" value="`+data.code+`">`;
                    cols += `<input type="hidden" class="material-unit" name="materials[`+count+`][unit]" value="`+temp_unit_name[0]+`">`;
                    cols += `<input type="hidden" class="discount-value" name="materials[`+count+`][discount]">`;
                    cols += `<input type="hidden" class="tax-rate" name="materials[`+count+`][tax_rate]" value="`+data.tax_rate+`">`;
                    cols += `<input type="hidden" class="tax-value" name="materials[`+count+`][tax]">`;
                    cols += `<input type="hidden" class="subtotal-value" name="materials[`+count+`][subtotal]">`;

                    newRow.append(cols);
                    $('#material_table tbody').append(newRow);

                    material_cost.push(parseFloat(data.cost));
                    material_discount.push('0.00');
                    tax_rate.push(parseFloat(data.tax_rate));
                    tax_name.push(data.tax_name);
                    tax_method.push(data.tax_method);
                    unit_name.push(data.unit_name);
                    unit_operator.push(data.unit_operator);
                    unit_operation_value.push(data.unit_operation_value);
                    rowindex = newRow.index();
                    calculateProductData(1,input=2);
                    count++;
                }

            }
        });
    }

    function checkQuantity(purchase_qty,flag,input=2)
    {
        var row_material_code = $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(2)').text();
        var pos = material_code.indexOf(row_material_code);
        var operator = unit_operator[rowindex].split(',');
        var operation_value = unit_operation_value[rowindex].split(',');

        if(operator[0] == '*')
        {
            total_qty = purchase_qty * operation_value[0];
        }else if(operator[0] == '/'){
            total_qty = purchase_qty / operation_value[0];
        }

        $('#editModal').modal('hide');
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.qty').val(purchase_qty);
        var status = $('#purchase_status option:selected').val();
        if(status == '1' || status == '2'){
            $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.received').val(purchase_qty);
        }
        calculateProductData(purchase_qty,input);

    }

    function calculateProductData(quantity,input=2){
        unitConversion();

        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(7)').text((material_discount[rowindex] * quantity).toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.discount-value').val((material_discount[rowindex] * quantity).toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.unit-name').text(unit_name[rowindex].slice(0,unit_name[rowindex].indexOf(",")));

        if(tax_method[rowindex] == 1)
        {
            var net_unit_cost = row_material_cost - material_discount[rowindex];
            var tax = net_unit_cost * quantity * (tax_rate[rowindex]/100);
            var sub_total = (net_unit_cost * quantity) + tax;

        }else{
            var sub_total_unit = row_material_cost - material_discount[rowindex];
            var net_unit_cost = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
            var tax = (sub_total_unit - net_unit_cost) * quantity;
            var sub_total = (sub_total_unit * quantity);
        }

        // $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(6)').text(net_unit_cost.toFixed(2));
        if(input == 2){
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.net_unit_cost').val(net_unit_cost.toFixed(2));
        }
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(8)').text(tax.toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.tax-value').val(tax.toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('td:nth-child(9)').text(sub_total.toFixed(2));
        $('#material_table tbody tr:nth-child('+(rowindex + 1)+')').find('.subtotal-value').val(sub_total.toFixed(2));

        calculateTotal();
    }

    function unitConversion()
    {
        var row_unit_operator = unit_operator[rowindex].slice(0,unit_operator[rowindex].indexOf(','));
        var row_unit_operation_value = unit_operation_value[rowindex].slice(0,unit_operation_value[rowindex].indexOf(','));
        row_unit_operation_value = parseFloat(row_unit_operation_value);
        if(row_unit_operator == '*')
        {
            row_material_cost = material_cost[rowindex] * row_unit_operation_value;
        }else{
            row_material_cost = material_cost[rowindex] / row_unit_operation_value;
        }
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

        //sum of discount
        var total_discount = 0;
        $('.discount').each(function() {
            total_discount += parseFloat($(this).text());
        });
        $('#total-discount').text(total_discount.toFixed(2));
        $('input[name="total_discount"]').val(total_discount.toFixed(2));

        //sum of tax
        var total_tax = 0;
        $('.tax').each(function() {
            total_tax += parseFloat($(this).text());
        });
        $('#total-tax').text(total_tax.toFixed(2));
        $('input[name="total_tax"]').val(total_tax.toFixed(2));

        //sum of subtotal
        var total = 0;
        $('.sub-total').each(function() {
            total += parseFloat($(this).text());
        });
        $('#total').text(total.toFixed(2));
        $('input[name="total_cost"]').val(total.toFixed(2));

        calculateGrandTotal();
    }

    function calculateGrandTotal()
    {
        var item = $('#material_table tbody tr:last').index();
        var total_qty = parseFloat($('#total-qty').text());
        var subtotal = parseFloat($('#total').text());
        var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
        var order_discount = parseFloat($('#order_discount').val());
        var shipping_cost = parseFloat($('#shipping_cost').val());
        // var labor_cost = parseFloat($('input[name="total_labor_cost"]').val());
        if(!order_discount){
            order_discount = 0.00;
        }
        if(!shipping_cost){
            shipping_cost = 0.00;
        }
        item = ++item + '(' + total_qty + ')';
        order_tax = (subtotal - order_discount) * (order_tax / 100);
        var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;
        $('#item').text(item);
        $('input[name="item"]').val($('#material_table tbody tr:last').index() + 1);
        $('#subtotal').text(subtotal.toFixed(2));
        $('#order_total_tax').text(order_tax.toFixed(2));
        // $('input[name="order_tax"]').val(order_tax.toFixed(2));
        // $('#order_total_discount').text(order_discount.toFixed(2));
        $('#shipping_total_cost').text(shipping_cost.toFixed(2));
        $('#grand_total').text(grand_total.toFixed(2));
        $('input[name="grand_total"]').val(grand_total.toFixed(2));
        if($('#payment_status option:selected').val() == 1)
        {
            $('#paid_amount').val(grand_total.toFixed(2));
        }else if($('#payment_status option:selected').val() == 2){
            var paid_amount = $('#paid_amount').val();
            $('#due_amount').val(parseFloat(grand_total-paid_amount).toFixed(2));
        }
    }

    $('input[name="order_discount"]').on('input',function(){
        calculateGrandTotal();
    });
    $('input[name="shipping_cost"]').on('input',function(){
        calculateGrandTotal();
    });
    $('select[name="order_tax_rate"]').on('change',function(){
        calculateGrandTotal();
    });

    /** Start :: Payment Code **/
    $('#payment_status').on('change',function(){
        if($(this).val() != 3){
            $('.payment').removeClass('d-none');
            $('#paid_amount').val($('input[name="grand_total"]').val());
            $('#due_amount').val(parseFloat(0).toFixed(2));
        }else{
            $('#paid_amount').val(0);
            $('.payment').addClass('d-none');
        }
    });

    // $(document).on('change', '#payment_method', function () {
    //     if($('#payment_method option:selected').val() == 2)
    //     {
    //         $('.cheque_number').removeClass('d-none');
    //     }else{
    //         $('.cheque_number').addClass('d-none');
    //     }
    //     $.ajax({
    //         url: "{{route('account.list')}}",
    //         type: "POST",
    //         data: { payment_method: $('#payment_method option:selected').val(),_token: _token},
    //         success: function (data) {
    //             $('#purchase_store_form #account_id').html('');
    //             $('#purchase_store_form #account_id').html(data);
    //             $('#purchase_store_form #account_id.selectpicker').selectpicker('refresh');
    //         },
    //         error: function (xhr, ajaxOption, thrownError) {
    //             console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
    //         }
    //     });
    // });

    $('#paid_amount').on('input',function(){
        var payable_amount = parseFloat($('input[name="grand_total"]').val());
        var paid_amount = parseFloat($(this).val());

        if(paid_amount > payable_amount){
            $('#paid_amount').val(payable_amount.toFixed(2));
            let error = '{{__('file.Paid amount cannot be bigger than grand total amount')}}'
            notification('error',error);
        }
        $('#due_amount').val((payable_amount - parseFloat($('#paid_amount').val())).toFixed(2));

    });
    /** End :: Payment Code **/

     //Customer Form Data Save Code
     $(document).on('click', '#save-btn', function() {
        let form = document.getElementById('store_or_update_form');
        let formData = new FormData(form);
        $.ajax({
            url: "{{route('supplier.store.or.update')}}",
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
                        supplier_list(data.id);
                    }
                }

            },
            error: function(xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    });

});
supplier_list();
function supplier_list(supplier_id = '') {
    $.ajax({
        url: "{{route('supplier.list')}}",
        type: "POST",
        data: { _token: _token},
        success: function(data) {
            $('#purchase_store_form #supplier_id').empty().html(data);
            $('#purchase_store_form #supplier_id.selectpicker').selectpicker('refresh');
            if(supplier_id)
            {
                $('#purchase_store_form #supplier_id').val(supplier_id);
                $('#purchase_store_form #supplier_id.selectpicker').selectpicker('refresh');
                
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
@if(isset($purchase_data))
@if(!empty($purchase_data['purchase']['payment_method']))
account_list("{{ $purchase_data['purchase']['payment_method'] }}","{{ $purchase_data['purchase']['account_id'] }}");
@endif
@endif
function account_list(payment_method,account_id='')
{
    $.ajax({
        url: "{{route('account.list')}}",
        type: "POST",
        data: { payment_method: payment_method,_token: _token},
        success: function (data) {
            $('#purchase_store_form #account_id').html('');
            $('#purchase_store_form #account_id').html(data);
            $('#purchase_store_form #account_id.selectpicker').selectpicker('refresh');
            if(account_id)
            {
                $('#purchase_store_form #account_id').val(account_id);
                $('#purchase_store_form #account_id.selectpicker').selectpicker('refresh');
            }
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
@if(isset($purchase_data))
@if(!empty($purchase_data['purchase']['purchase_status']))
received_qty("{{ $purchase_data['purchase']['purchase_status'] }}");
@endif
@endif
function received_qty(purchase_status)
{
    if(purchase_status == 2){
        $(".recieved-material-qty").removeClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table#material_table tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });

    }
    else if((purchase_status == 3) || (purchase_status == 4)){
        $(".recieved-material-qty").addClass("d-none");
        $(".recieved").each(function() {
            $(this).val(0);
        });
    }
    else {
        $(".recieved-material-qty").addClass("d-none");
        $(".qty").each(function() {
            rowindex = $(this).closest('tr').index();
            $('table#material_table tbody tr:nth-child(' + (rowindex + 1) + ')').find('.recieved').val($(this).val());
        });
    }
}


function store_data(){
    var rownumber = $('table#material_table tbody tr:last').index();
    if (rownumber < 0) {
        let error = '{{__('file.Please insert material to order table!')}}'
        notification("error",error)
    }else{
        let form = document.getElementById('purchase_store_form');
        let formData = new FormData(form);
        let url = "{{route('purchase.store')}}";
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function(){
                $('#save-btn').addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#save-btn').removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                $('#purchase_store_form').find('.is-invalid').removeClass('is-invalid');
                $('#purchase_store_form').find('.error').remove();
                if (data.status == false) {
                    $.each(data.errors, function (key, value) {
                        var key = key.split('.').join('_');
                        console.log(key);
                        $('#purchase_store_form input#' + key).addClass('is-invalid');
                        $('#purchase_store_form textarea#' + key).addClass('is-invalid');
                        $('#purchase_store_form select#' + key).parent().addClass('is-invalid');
                        $('#purchase_store_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');
                    });
                } else {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        window.location.replace("{{ route('purchase') }}");

                    }
                }

            },
            error: function (xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }

}
function hold_data(){
    var rownumber = $('table#material_table tbody tr:last').index();
    if (rownumber < 0) {
        let error = '{{__('file.Please insert material to order table!')}}'
        notification("error",error)
    }else{
        let form = document.getElementById('purchase_store_form');
        let formData = new FormData(form);
        let url = "{{route('purchase.hold')}}";
        $.ajax({
            url: url,
            type: "POST",
            data: formData,
            dataType: "JSON",
            contentType: false,
            processData: false,
            cache: false,
            beforeSend: function(){
                $('#hold-btn').addClass('spinner spinner-white spinner-right');
            },
            complete: function(){
                $('#hold-btn').removeClass('spinner spinner-white spinner-right');
            },
            success: function (data) {
                $('#purchase_store_form').find('.is-invalid').removeClass('is-invalid');
                $('#purchase_store_form').find('.error').remove();
                notification(data.status, data.message);
            },
            error: function (xhr, ajaxOption, thrownError) {
                console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
            }
        });
    }

}
</script>
@endpush
