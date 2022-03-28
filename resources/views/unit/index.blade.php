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
                    @if (permission('unit-add'))
                    <a href="javascript:void(0);" onclick="showFormModal('{{__('file.Add New Unit')}}','{{__('file.Save')}}')" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-plus-circle"></i> {{__('file.Add New')}}</a>
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
                        <x-form.textbox labelName="{{__('file.Unit Name')}}" name="unit_name" col="col-md-4" />
                        <div class="col-md-8">
                            <div style="margin-top:28px;">
                                <div style="margin-top:28px;">
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
                                        @if (permission('unit-bulk-delete'))
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        @endif
                                        <th>{{__('file.SL')}}</th>
                                        <th>{{__('file.Unit Name')}}</th>
                                        <th>{{__('file.Unit Code')}}</th>
                                        <th>{{__('file.Base Unit')}}</th>
                                        <th>{{__('file.Operator')}}</th>
                                        <th>{{__('file.Operation Value')}}</th>
                                        <th>{{__('file.Status')}}</th>
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
@include('unit.modal')
@endsection

@push('scripts')
<script>
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
                "url": "{{route('unit.datatable.data')}}",
                "type": "POST",
                "data": function (data) {
                    data.unit_name = $("#form-filter #unit_name").val();
                    data._token    = _token;
                }
            },
            "columnDefs": [{
                    @if (permission('unit-bulk-delete'))
                    "targets": [0,8],
                    @else
                    "targets": [7],
                    @endif
                    "orderable": false,
                    "className": "text-center"
                },
                {
                    @if (permission('unit-bulk-delete'))
                    "targets": [1,3,5,6,7],
                    @else
                    "targets": [0,2,4,5,6],
                    @endif
                    "className": "text-center"
                }
            ],
            "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

            "buttons": [
                @if (permission('unit-report'))
                {
                    'extend':'colvis','className':'btn btn-secondary btn-sm text-white','text':'{{__('file.Column')}}','columns': ':gt(0)'
                },
                {
                    "extend": 'print',
                    'text':'{{__('file.Print')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "orientation": "landscape", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        columns: function (index, data, node) {
                            return table.column(index).visible();
                        }
                    },
                    customize: function (win) {
                        $(win.document.body).addClass('bg-white');
                    },
                },
                {
                    "extend": 'csv',
                    'text':'{{__('file.CSV')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "exportOptions": {
                        columns: function (index, data, node) {
                            return table.column(index).visible();
                        }
                    }
                },
                {
                    "extend": 'excel',
                    'text':'{{__('file.Excel')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "exportOptions": {
                        columns: function (index, data, node) {
                            return table.column(index).visible();
                        }
                    }
                },
                {
                    "extend": 'pdf',
                    'text':'{{__('file.PDF')}}',
                    'className':'btn btn-secondary btn-sm text-white',
                    "title": "{{ $page_title }} List",
                    "filename": "{{ strtolower(str_replace(' ','-',$page_title)) }}-list",
                    "orientation": "landscape", //portrait
                    "pageSize": "A4", //A3,A5,A6,legal,letter
                    "exportOptions": {
                        columns: function (index, data, node) {
                            return table.column(index).visible();
                        }
                    },
                },
                @endif
                @if (permission('unit-bulk-delete'))
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
            table.ajax.reload();
        });

        $(document).on('click', '#save-btn', function () {
            let form = document.getElementById('store_or_update_form');
            let formData = new FormData(form);
            let url = "{{route('unit.store.or.update')}}";
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
                    $('#save-btn').addClass('kt-spinner kt-spinner--md kt-spinner--light');
                },
                complete: function(){
                    $('#save-btn').removeClass('kt-spinner kt-spinner--md kt-spinner--light');
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
                            base_unit();
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
                    url: "{{route('unit.edit')}}",
                    type: "POST",
                    data: { id: id,_token: _token},
                    dataType: "JSON",
                    success: function (data) {
                        $('#store_or_update_form #update_id').val(data.id);
                        $('#store_or_update_form #unit_name').val(data.unit_name);
                        $('#store_or_update_form #unit_code').val(data.unit_code);
                        $('#store_or_update_form #base_unit').val(data.base_unit);
                        $('#store_or_update_form #operator').val(data.operator);
                        $('#store_or_update_form #operation_value').val(data.operation_value);
                        $('#store_or_update_form .selectpicker').selectpicker('refresh');

                        $('#store_or_update_modal').modal({
                            keyboard: false,
                            backdrop: 'static',
                        });
                        $('#store_or_update_modal .modal-title').html(
                            '<i class="fas fa-edit"></i> <span>{{__('file.Edit')}} ' + data.unit_name + '</span>');
                        $('#store_or_update_modal #save-btn').text('{{__('file.Update')}}');

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
            let url   = "{{ route('unit.delete') }}";
            Swal.fire({
                title: '{{__('file.Are you sure to delete ')}}' + name + ' {{__('file.data?')}}',
                text: "{{__('file.You won\'t be able to revert this!')}}",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText:'{{__('file.Cancel')}}',
                confirmButtonText: '{{__('file.Yes, delete it!')}}'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: { id: id, _token: _token},
                        dataType: "JSON",
                    }).done(function (response) {
                        if (response.status == "success") {
                            Swal.fire("Deleted", response.message, "success").then(function () {
                                table.row(row).remove().draw(false);
                                base_unit();
                            });
                        }
                        if (response.status == "error") {
                            Swal.fire('Oops...', response.message, "error");
                        }
                    }).fail(function () {
                        Swal.fire('Oops...', "{{__('file.Something went wrong with ajax!')}}", "error");
                    });
                }
            });
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
                let url = "{{route('unit.bulk.delete')}}";
                Swal.fire({
                    title: '{{__('file.Are you sure to delete all checked data?')}}',
                    text: "{{__('file.You won\'t be able to revert this!')}}",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    cancelButtonText:'{{__('file.Cancel')}}',
                    confirmButtonText: '{{__('file.Yes, delete all!')}}'
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: url,
                            type: "POST",
                            data: {
                                ids: ids,
                                _token: _token
                            },
                            dataType: "JSON",
                        }).done(function (response) {

                            if(response.status == "success") {
                                Swal.fire("Deleted", response.message, "success").then(function () {

                                    table.rows(rows).remove().draw(false);
                                    $('#select_all').prop('checked',false);
                                    $('.delete_btn').addClass('d-none');
                                    base_unit();
                                });
                            }
                            if (response.status == "error") {
                                Swal.fire('Oops...', response.message, "error");
                            }
                        }).fail(function () {
                            Swal.fire('Oops...', "{{__('file.Something went wrong with ajax!')}}", "error");
                        });
                    }
                });
            }
        }

        $(document).on('click', '.change_status', function () {
            let id    = $(this).data('id');
            let status = $(this).data('status');
            let name  = $(this).data('name');
            let url   = "{{ route('unit.change.status') }}";
            Swal.fire({
                title: '{{__('file.Are you sure to change')}} ' + name + ' {{__('file.status?')}}',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText:'{{__('file.Cancel')}}',
                confirmButtonText: '{{__('file.Yes!')}}'
            }).then((result) => {
                if (result.value) {
                    $.ajax({
                        url: url,
                        type: "POST",
                        data: { id: id,status:status, _token: _token},
                        dataType: "JSON",
                    }).done(function (response) {
                        if (response.status == "success") {
                            Swal.fire("Status Changed", response.message, "success").then(function () {
                                table.ajax.reload(null, false);
                                base_unit();
                            });
                        }
                        if (response.status == "error") {
                            Swal.fire('Oops...', response.message, "error");
                        }
                    }).fail(function () {
                        Swal.fire('Oops...', "{{__('file.Something went wrong with ajax!')}}", "error");
                    });
                }
            });
        });

        base_unit();
        function base_unit()
        {
            $.ajax({
                url: "{{route('unit.base.unit')}}",
                type: "POST",
                data: { _token: _token},
                success: function (data) {
                    if(data){
                        $('#store_or_update_form #base_unit').html('');
                        $('#store_or_update_form #base_unit').html(data);
                    }else{
                        $('#store_or_update_form #base_unit').html('');
                    }
                    $('#store_or_update_form #base_unit.selectpicker').selectpicker('refresh');
                },
                error: function (xhr, ajaxOption, thrownError) {
                    console.log(thrownError + '\r\n' + xhr.statusText + '\r\n' + xhr.responseText);
                }
            });
        }


    });
    </script>
@endpush
