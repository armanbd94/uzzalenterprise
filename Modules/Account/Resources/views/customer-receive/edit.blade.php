@extends('layouts.app')

@section('title', $page_title)

@push('styles')
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
@endpush

@section('content')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <form id="receive-payment-form" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group col-md-6 required">
                                    <label for="voucher_no">{{__('file.Voucher No')}}</label>
                                    <input type="text" class="form-control" name="voucher_no" id="voucher_no" value="{{ $voucher_data[0]->voucher_no }}"  />
                                    <input type="hidden" class="form-control" name="update_voucher_no" id="update_voucher_no" value="{{ $voucher_data[0]->voucher_no }}"  />
                                </div>
                                <div class="form-group col-md-6 required">
                                    <label for="voucher_date">{{__('file.Date')}}</label>
                                    <input type="text" class="form-control date" name="voucher_date" id="voucher_date" value="{{ $voucher_data[0]->voucher_date }}" readonly />
                                </div>

                                <x-form.selectbox labelName="{{__('file.Customer')}}" name="customer_id"  onchange="dueAmount(this.value)" required="required"  col="col-md-6" class="selectpicker">
                                    @if (!$customers->isEmpty())
                                        @foreach ($customers as $customer)
                                            <option value="{{ $customer->id }}" {{ $voucher_data[0]->chart_of_account_id == $customer->coa->id ? 'selected' : '' }}>{{ $customer->name.' - '.$customer->mobile }}</option>
                                        @endforeach
                                    @endif
                                </x-form.selectbox>
                                <div class="form-group col-md-6">
                                    <label for="due_amount">{{__('file.Due Amount')}}</label>
                                    <input type="text" class="form-control"  id="due_amount" value="{{ number_format($due_amount,2,'.','') }}" readonly />
                                </div>
                                <x-form.selectbox labelName="{{__('file.Payment Type')}}" name="payment_type" required="required"  col="col-md-6" class="selectpicker">
                                    @foreach (PAYMENT_METHOD as $key => $value)
                                    <option value="{{ $key }}" {{ $key == $payment_method ? 'selected' : '' }}>{{ $value }}</option>
                                    @endforeach
                                </x-form.selectbox>
                                <x-form.selectbox labelName="{{__('file.Account')}}" name="account_id" required="required"  col="col-md-6" class="selectpicker">
                                    {!! $account_list !!}
                                </x-form.selectbox>

                                <x-form.textbox labelName="{{__('file.Amount')}}" name="amount" required="required" col="col-md-6" value="{{ $voucher_data[0]->credit }}" />

                                <x-form.textarea labelName="{{__('file.Remarks')}}" name="remarks" col="col-md-6" value="{{ $voucher_data[0]->description }}" />
                                <div class="form-group col-md-6 pt-5">
                                    <button type="button" class="btn btn-danger btn-sm mr-3 custom-btn"><i class="fas fa-sync-alt"></i> Reset</button>
                                    <button type="button" class="btn btn-primary btn-sm mr-3 custom-btn" id="save-btn" onclick="store_data()"><i class="fas fa-save"></i> Update</button>
                                </div>
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

@endsection

@push('scripts')
<script src="js/moment.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script>
$('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
$(document).on('change', '#payment_type', function () {
    $.ajax({
        url: "{{route('account.list')}}",
        type: "POST",
        data: { payment_method: $('#payment_type option:selected').val(),_token: _token},
        success: function (data) {
            $('#receive-payment-form #account_id').html('');
            $('#receive-payment-form #account_id').html(data);
            $('#receive-payment-form #account_id.selectpicker').selectpicker('refresh');
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
});
function dueAmount(vendor_id)
{
    $.ajax({
        url: "{{url('customer/previous-balance')}}/"+vendor_id,
        type: "GET",
        dataType: "JSON",
        success: function (data) {
            data ? $('#due_amount').val(parseFloat(data).toFixed(2)) : $('#due_amount').val('0.00');
        },
        error: function (xhr, ajaxOption, thrownError) {
            console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
        }
    });
}
function store_data(){
    let form = document.getElementById('receive-payment-form');
    let formData = new FormData(form);
    let url = "{{url('customer-receive/update')}}";
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
            $('#receive-payment-form').find('.is-invalid').removeClass('is-invalid');
            $('#receive-payment-form').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value) {
                    var key = key.split('.').join('_');
                    $('#receive-payment-form input#' + key).addClass('is-invalid');
                    $('#receive-payment-form textarea#' + key).addClass('is-invalid');
                    $('#receive-payment-form select#' + key).parent().addClass('is-invalid');
                    $('#receive-payment-form #' + key).parent().append(
                        '<small class="error text-danger">' + value + '</small>');
                });
            } else {
                notification(data.status, data.message);
                if (data.status == 'success' && data.vendor_transaction != '') {

                    window.location.replace("{{ url('customer-receive') }}");
                    
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