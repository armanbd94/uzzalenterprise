@extends('layouts.app')

@section('title', $page_title)

@push('styles')
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
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
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">

                        <form id="bank_transaction_form" method="post">
                            @csrf
                            <x-form.textbox labelName="{{__('file.Date')}}" name="voucher_date" required="required" class="date" value="{{ date('Y-m-d') }}" col="col-md-6"/>
                            <x-form.selectbox labelName="{{__('file.Account Type')}}" name="account_type" required="required" col="col-md-6" class="selectpicker">
                                <option value="Debit(+)">Debit (+)</option>
                                <option value="Credit(-)">Credit (-)</option>
                            </x-form.selectbox>
                            <x-form.selectbox labelName="{{__('file.Mobile Bank Name')}}" name="bank_name" required="required" col="col-md-6" class="selectpicker">
                                @if (!$banks->isEmpty())
                                    @foreach ($banks as $bank)
                                        <option value="{{ $bank->bank_name }}">{{ $bank->bank_name.' - '. $bank->account_number }}</option>
                                    @endforeach
                                @endif
                            </x-form.selectbox>
                            <x-form.textbox labelName="{{__('file.Withdraw / Deposit ID')}}" name="voucher_no" required="required" col="col-md-6"/>
                            <x-form.textbox labelName="{{__('file.Amount')}}" name="amount" required="required" col="col-md-6"/>
                            <x-form.textarea labelName="{{__('file.Description')}}" name="description" col="col-md-6"/>
                            <div class="form-group col-md-6">
                                <button type="button" class="btn btn-danger btn-sm" onclick="refresh_selectpicker()">{{__('file.Reset')}}</button>
                                <button type="button" class="btn btn-primary btn-sm ml-2" id="save-btn" onclick="save_data()">{{__('file.Save')}}</button>
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
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script>
$(document).ready(function () {
    $('.date').datetimepicker({format: 'YYYY-MM-DD'});
});
function refresh_selectpicker()
{
    $('#bank_transaction_form')[0].reset();
    $('#bank_transaction_form .selectpicker').selectpicker('refresh');
    $('#bank_transaction_form').find('.is-invalid').removeClass('is-invalid');
    $('#bank_transaction_form').find('.error').remove();
}
function save_data() {
    let form = document.getElementById('bank_transaction_form');
    let formData = new FormData(form);

    $.ajax({
        url: "{{route('store.mobilebank.transaction')}}",
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
            $('#bank_transaction_form').find('.is-invalid').removeClass('is-invalid');
            $('#bank_transaction_form').find('.error').remove();
            if (data.status == false) {
                $.each(data.errors, function (key, value) {
                    $('#bank_transaction_form input#' + key).addClass('is-invalid');
                    $('#bank_transaction_form textarea#' + key).addClass('is-invalid');
                    $('#bank_transaction_form select#' + key).parent().addClass('is-invalid');
                    $('#bank_transaction_form #' + key).parent().append(
                    '<small class="error text-danger">' + value + '</small>');
                });
            } else {
                notification(data.status, data.message);
                if(data.status == 'success'){
                    window.location.replace("{{ route('mobilebank') }}");
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
