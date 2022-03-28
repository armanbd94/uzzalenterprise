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
                    <!--begin::Button-->
                    @if (permission('customer-advance-add'))
                    <a href="javascript:void(0);" onclick="showAdvanceFormModal('{{__('file.Add New Customer Advance')}}','{{__('file.Save')}}')" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-plus-circle"></i>{{__('file.Add New')}}</a>
                    @endif
                    <!--end::Button-->
                </div>
            </div>
        </div>
        <!--end::Notice-->
        <!--begin::Card-->
        <div class="card card-custom">
            <div class="card-header flex-wrap py-5">
                <form method="POST" id="form-filter" class="col-md-12 px-0">
                    <div class="row">
                        <x-form.selectbox labelName="{{__('file.Customer')}}" name="customer_id" col="col-md-4" class="selectpicker">
                            @if (!$customers->isEmpty())
                            @foreach ($customers as $customer)
                                <option value="{{ $customer->id }}" data-coaid="{{ $customer->coa->id }}" data-name="{{ $customer->name }}">{{ $customer->name.' - '.$customer->mobile.' ('.$customer->shop_name.')' }}</option>
                            @endforeach
                            @endif
                        </x-form.selectbox>

                        <div class="form-group col-md-4">
                            <label for="name">{{__('file.Choose Your Date')}}</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="start_date" name="start_date" >
                                <input type="hidden" id="end_date" name="end_date" >
                            </div>
                        </div>

                        <x-form.selectbox labelName="{{__('file.Advance Type')}}" name="type" col="col-md-4" class="selectpicker">
                            <option value="debit">{{__('file.Payment')}}</option>
                            <option value="credit">{{__('file.Receive')}}</option>
                        </x-form.selectbox>
                        <div class="col-md-12">
                            <div>
                                <div>
                                    <button id="btn-reset" class="btn btn-danger btn-sm btn-elevate btn-icon float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="{{__('file.Reset')}}">
                                    <i class="fas fa-undo-alt"></i></button>

                                    <button id="btn-filter" class="btn btn-primary btn-sm btn-elevate btn-icon mr-2 float-right" type="button"
                                    data-toggle="tooltip" data-theme="dark" title="{{__('file.Search')}}">
                                    <i class="fas fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-body">
                <!--begin: Datatable-->
                <div id="kt_datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        @if (permission('customer-advance-bulk-delete'))
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        @endif
                                        <th>{{__('file.SL')}}</th>
                                        <th>{{__('file.Name')}}</th>
                                        <th>{{__('file.Address')}}</th>
                                        <th>{{__('file.City')}}</th>
                                        <th>{{__('file.Advance Type')}}</th>
                                        <th>{{__('file.Amount')}}</th>
                                        <th>{{__('file.Approval Status')}}</th>
                                        <th>{{__('file.Date')}}</th>
                                        <th>{{__('file.Action')}}</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
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
@include('customer::advance.modal')
@include('customer::advance.status-modal')
@endsection

@push('scripts')
<script src="{{asset('js/knockout-3.4.2.js')}}"></script>
<script src="{{asset('js/daterangepicker.min.js')}}"></script>
<script>
    $('.daterangepicker-filed').daterangepicker({
        callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date   = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('input[name="start_date"]').val(start_date);
            $('input[name="end_date"]').val(end_date);
        }
    });
    var table;
    $(document).ready(function(){

        table = $('#dataTable').DataTable({
            "processing": true, //Feature control the processing indicator
            "serverSide": true, //Feature control DataTable server side processing mode
            "order": [], //Initial no order
            "responsive": true, //Make table responsive in mobile device
            "bInfo": true, //TO show the total number of data
            "bFilter": false, //For datatable default search box show/hide
            "lengthMenu": [
                [5, 10, 15, 25, 50, 100, 1000, 10000, -1],
                [5, 10, 15, 25, 50, 100, 1000, 10000, "All"]
            ],
            "pageLength": 25, //number of data show per page
            "language": {
                processing: `<i class="fas fa-spinner fa-spin fa-3x fa-fw text-primary"></i> `,
                emptyTable: '<strong class="text-danger">{{__('file.No Data Found')}}</strong>',
                infoEmpty: '',
                zeroRecords: '<strong class="text-danger">{{__('file.No Data Found')}}</strong>'
            },
            "ajax": {
                "url": "{{route('customer.advance.datatable.data')}}",
                "type": "POST",
                "data": function (data) {
                    data.customer_id = $("#form-filter #customer_id option:selected").val();
                    data.type        = $("#form-filter #type").val();
                    data.start_date  = $("#form-filter #start_date").val();
                    data.end_date    = $("#form-filter #end_date").val();
                    data._token      = _token;
                }
            },
            "columnDefs": [{
                    @if (permission('customer-advance-bulk-delete'))
                    "targets": [0,9],
                    @else
                    "targets": [8],
                    @endif
                    "orderable": false,
                    "className": "text-center"
                },
                {
                    @if (permission('customer-advance-bulk-delete'))
                    "targets": [1,4,5,7,8],
                    @else
                    "targets": [0,3,4,6,7],
                    @endif
                    "className": "text-center"
                },
                {
                    @if (permission('customer-advance-bulk-delete'))
                    "targets": [6],
                    @else
                    "targets": [5],
                    @endif
                    "className": "text-right",
                    "orderable": false,
                },
            ],
            "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

            "buttons": [
                @if (permission('customer-advance-report'))
                {
                    'extend':'colvis','className':'btn btn-secondary btn-sm text-white','text':'Column','columns': ':gt(0)'
                },
                {
                    "extend": 'print',
                    'text':'{{__('file.Print')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "orientation": "portrait", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        @if (permission('customer-advance-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(9))'
                        @else
                        columns: ':visible:not(:eq(8))'
                        @endif
                    },
                    customize: function (win) {
                        $(win.document.body).addClass('bg-white');
                        $(win.document.body).find('table thead').css({'background':'#034d97'});
                        $(win.document.body).find('table tfoot tr').css({'background-color':'#034d97'});
                        $(win.document.body).find('h1').css('text-align', 'center');
                        $(win.document.body).find('h1').css('font-size', '15px');
                        $(win.document.body).find('table').css( 'font-size', 'inherit' );
                    },
                },
                {
                    "extend": 'csv',
                    'text':'{{__('file.CSV')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "exportOptions": {
                        @if (permission('customer-advance-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(9))'
                        @else
                        columns: ':visible:not(:eq(8))'
                        @endif
                    }
                },
                {
                    "extend": 'excel',
                    'text':'{{__('file.Excel')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "exportOptions": {
                        @if (permission('customer-advance-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(9))'
                        @else
                        columns: ':visible:not(:eq(8))'
                        @endif
                    }
                },
                {
                    "extend": 'pdf',
                    'text':'{{__('file.PDF')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "orientation": "portrait", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        @if (permission('customer-advance-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(9))'
                        @else
                        columns: ':visible:not(:eq(8))'
                        @endif
                    },
                    customize: function(doc) {
                    doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                    doc.styles.tableHeader.fontSize = 7;
                    doc.pageMargins = [5,5,5,5];
                }
                },
                @endif
                @if (permission('customer-advance-bulk-delete'))
                {
                    'className':'btn btn-danger btn-sm delete_btn d-none text-white',
                    'text':'{{__('file.Delete')}}',
                    action:function(e,dt,node,config){
                        multi_delete();
                    }
                }
                @endif
            ],
        });

        $('#btn-filter').click(function () {
            table.ajax.reload();
        });

        $('#btn-reset').click(function () {
            $('#form-filter')[0].reset();
            $('#form-filter .selectpicker').selectpicker('refresh');
            $('#form-filter #start_date').val('');
            $('#form-filter #end_date').val('');
            table.ajax.reload();
        });

        $(document).on('click', '#save-btn', function () {
            var customer       = $('#store_or_update_form #customer option:selected').val();
            var customer_coaid = $('#store_or_update_form #customer option:selected').data('coaid');
            var customer_name  = $('#store_or_update_form #customer option:selected').data('name');
            var type           = $('#store_or_update_form #type option:selected').val();
            var amount         = $('#store_or_update_form #amount').val();

            let url = "{{route('customer.advance.store.or.update')}}";
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
                data: {id:id,customer:customer,customer_coaid:customer_coaid,customer_name:customer_name,type:type,amount:amount,_token:_token},
                dataType: "JSON",
                beforeSend: function(){
                    $('#save-btn').addClass('spinner spinner-white spinner-right');
                },
                complete: function(){
                    $('#save-btn').removeClass('spinner spinner-white spinner-right');
                },
                success: function (data) {
                    $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
                    $('#store_or_update_form').find('.error').remove();
                    if (data.status == false) {
                        $.each(data.errors, function (key, value) {
                            $('#store_or_update_form input#' + key).addClass('is-invalid');
                            $('#store_or_update_form textarea#' + key).addClass('is-invalid');
                            $('#store_or_update_form select#' + key).parent().addClass('is-invalid');
                            $('#store_or_update_form #' + key).parent().append(
                            '<small class="error text-danger">' + value + '</small>');
                        });
                    } else {
                        notification(data.status, data.message);
                        if (data.status == 'success') {
                            if (method == 'update') {
                                table.ajax.reload(null, false);
                            } else {
                                table.ajax.reload();
                            }
                            $('#store_or_update_modal').modal('hide');
                        }
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });

        });

        $(document).on('click', '.edit_data', function () {
            let id = $(this).data('id');
            $('#store_or_update_form')[0].reset();
            $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
            $('#store_or_update_form').find('.error').remove();
            if (id) {
                $.ajax({
                    url: "{{route('customer.advance.edit')}}",
                    type: "POST",
                    data: { id: id,_token: _token},
                    dataType: "JSON",
                    success: function (data) {
                        if(data.status == 'error'){
                            notification(data.status,data.message)
                        }else{
                            $('#store_or_update_form #update_id').val(data.id);
                            $('#store_or_update_form #customer').val(data.customer_id);
                            $('#store_or_update_form #type').val(data.type);
                            $('#store_or_update_form #amount').val(data.amount);

                            $('#store_or_update_form select#customer').each(function(){
                                $('#store_or_update_form select#customer option').each(function() {
                                    if(!this.selected) {
                                        $(this).attr('disabled', true);
                                    }
                                });
                            });
                            $('#store_or_update_form .selectpicker').selectpicker('refresh');
                            $('#store_or_update_modal').modal({
                                keyboard: false,
                                backdrop: 'static',
                            });
                            $('#store_or_update_modal .modal-title').html(
                                '<i class="fas fa-edit text-white"></i> <span>Edit ' + data.name + '</span>');
                            $('#store_or_update_modal #save-btn').text('{{__('file.Update')}}');
                        }
                    },
                    error: function (xhr, ajaxOption, thrownError) {
                        console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                    }
                });
            }
        });

        $(document).on('click', '.delete_data', function () {
            let id    = $(this).data('id');
            let name  = $(this).data('name');
            let row   = table.row($(this).parent('tr'));
            let url   = "{{ route('customer.advance.delete') }}";
            delete_data(id, url, table, row, name);
        });

        function multi_delete(){
            let ids = [];
            let rows;
            $('.select_data:checked').each(function(){
                ids.push($(this).val());
                rows = table.rows($('.select_data:checked').parents('tr'));
            });
            if(ids.length == 0){
                Swal.fire({
                    type:'error',
                    title:'Error',
                    text:'{{__('file.Please checked at least one row of table!')}}',
                    icon: 'warning',
                });
            }else{
                let url = "{{route('customer.advance.bulk.delete')}}";
                bulk_delete(ids,url,table,rows);
            }
        }

         //Show Status Change Modal
    $(document).on('click','.change_status',function(){
        $('#approve_status_form #approve_id').val($(this).data('id'));
        $('#approve_status_form #approval_status').val($(this).data('status'));
        $('#approve_status_form #approval_status.selectpicker').selectpicker('refresh');
        $('#approve_status_modal').modal({
            keyboard: false,
            backdrop: 'static',
        });
        $('#approve_status_modal .modal-title').html('<span>{{__('file.Change Sale Status')}}</span>');
        $('#approve_status_modal #status-btn').text('{{__('file.Change Status')}}');

    });

    $(document).on('click','#status-btn',function(){
        var approve_id     = $('#approve_status_form #approve_id').val();
        var approval_status =  $('#approve_status_form #approval_status option:selected').val();
        if(approve_id && approval_status)
        {
            $.ajax({
                url: "{{route('customer.advance.change.approval.status')}}",
                type: "POST",
                data: {approve_id:approve_id,approval_status:approval_status,_token:_token},
                dataType: "JSON",
                beforeSend: function(){
                    $('#status-btn').addClass('kt-spinner kt-spinner--md kt-spinner--light');
                },
                complete: function(){
                    $('#status-btn').removeClass('kt-spinner kt-spinner--md kt-spinner--light');
                },
                success: function (data) {
                    notification(data.status, data.message);
                    if (data.status == 'success') {
                        $('#approve_status_modal').modal('hide');
                        table.ajax.reload(null, false);
                    }
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }
    });



    });
    function showAdvanceFormModal(modal_title, btn_text) {
        $('#store_or_update_form')[0].reset();
        $('#store_or_update_form #update_id').val('');
        $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
        $('#store_or_update_form').find('.error').remove();
        $('#store_or_update_form select#customer').each(function(){
            $('#store_or_update_form select#customer option').each(function() {
                $(this).attr('disabled', false);
            });
        });
        $('#store_or_update_form select#customer').val('');
        $('#store_or_update_form .selectpicker').selectpicker('refresh');
        $('#store_or_update_modal').modal({
            keyboard: false,
            backdrop: 'static',
        });
        $('#store_or_update_modal .modal-title').html('<i class="fas fa-plus-square text-white"></i> '+modal_title);
        $('#store_or_update_modal #save-btn').text(btn_text);
    }
    </script>
@endpush
