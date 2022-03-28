@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link href="{{asset('css/bootstrap-datetimepicker.min.css')}}" rel="stylesheet" type="text/css" />
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
                    @if (permission('session-add'))
                    <a href="javascript:void(0);" onclick="showFormModal('{{__('file.Add New Customer Group')}}','{{__('file.Save')}}')" class="btn btn-primary btn-sm font-weight-bolder">
                        <i class="fas fa-plus-circle"></i> {{__('file.Add New')}}</a>
                    @endif
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
                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        @if (permission('session-bulk-delete'))
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        @endif
                                        <th>{{__('file.SL')}}</th>
                                        <th>{{__('file.Session Name')}}</th>
                                        <th>{{__('file.Session Start')}}</th>
                                        <th>{{__('file.Session End')}}</th>
                                        <th>{{__('file.Created By')}}</th>
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
@include('setting::session.modal')
@endsection

@push('scripts')
<script src="{{asset('js/jquery-ui.js')}}"></script>
<script src="{{asset('js/bootstrap-datetimepicker.min.js')}}"></script>
<script>
    var table;
    $('.date').datetimepicker({format: 'YYYY-MM-DD',ignoreReadonly: true});
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
                "url": "{{route('session.datatable.data')}}",
                "type": "POST",
                "data": function (data) {
                    data._token = _token;
                }
            },
            "columnDefs": [{

                @if (permission('session-bulk-delete'))
                "targets": [0,6],
                @else
                "targets": [5],
                @endif
                "orderable": false,
                "className": "text-center"
            },
            {
                @if (permission('session-bulk-delete'))
                "targets": [1,2,3,4,5],
                @else
                "targets": [0,1,2,3,4],
                @endif
                "className": "text-center"
            }
            ],
            "dom": "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6' <'float-right'B>>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'<'float-right'p>>>",

            "buttons": [
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
                        @if(permission('session-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(6))'
                        @else
                        columns: ':visible:not(:eq(5))'
                        @endif
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
                        @if(permission('session-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(6))'
                        @else
                        columns: ':visible:not(:eq(5))'
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
                        @if(permission('session-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(6))'
                        @else
                        columns: ':visible:not(:eq(5))'
                        @endif
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
                        @if(permission('session-bulk-delete'))
                        columns: ':visible:not(:eq(0),:eq(6))'
                        @else
                        columns: ':visible:not(:eq(5))'
                        @endif
                    },
                },
                @if (permission('session-bulk-delete'))
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
            let url = "{{route('session.store.or.update')}}";
            let id = $('#update_id').val();
            let method;
            if (id) {
                method = 'update';
            } else {
                method = 'add';
            }
            store_or_update_data(table, method, url, formData);
        });

        $(document).on('click', '.edit_data', function () {
            let id = $(this).data('id');
            $('#store_or_update_form')[0].reset();
            $('#store_or_update_form').find('.is-invalid').removeClass('is-invalid');
            $('#store_or_update_form').find('.error').remove();
            if (id) {
                $.ajax({
                    url: "{{route('session.edit')}}",
                    type: "POST",
                    data: { id: id,_token: _token},
                    dataType: "JSON",
                    success: function (data) {
                        if(data.status == 'error'){
                            notification(data.status,data.message)
                        }else{
                            $('#store_or_update_form #update_id').val(data.id);
                            $('#store_or_update_form #session_name').val(data.session_name);
                            $('#store_or_update_form #session_start').val(data.session_start);
                            $('#store_or_update_form #session_end').val(data.session_end);

                            $('#store_or_update_modal').modal({
                                keyboard: false,
                                backdrop: 'static',
                            });
                            $('#store_or_update_modal .modal-title').html(
                                '<i class="fas fa-edit text-white"></i> <span>Edit ' + data.session_name + '</span>');
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
            let url   = "{{ route('session.delete') }}";
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
                let url = "{{route('session.bulk.delete')}}";
                bulk_delete(ids,url,table,rows);
            }
        }


    });
    </script>
@endpush
