@extends('layouts.app')
@section('title', $page_title)
@push('styles')
<link href="{{asset('css/daterangepicker.min.css')}}" rel="stylesheet" type="text/css" />
<style>
    #dataTable{
        /* width: 2000px !important; */
    }
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
                    @if (permission('purchase-add'))
                    <a href="{{ route('purchase.add') }}"  class="btn btn-primary btn-sm font-weight-bolder">
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
                        <div class="form-group col-md-3">
                            <label for="name">{{__('file.Choose Your Date')}}</label>
                            <div class="input-group">
                                <input type="text" class="form-control daterangepicker-filed">
                                <input type="hidden" id="from_date" name="from_date" >
                                <input type="hidden" id="to_date" name="to_date" >
                            </div>
                        </div>
                        <x-form.textbox labelName="{{__('file.Memo No.')}}" name="memo_no" col="col-md-3" />
                        <x-form.selectbox labelName="{{__('file.Warehouse')}}" name="warehouse_id" col="col-md-3" class="selectpicker">
                            @if (!$warehouses->isEmpty())
                                @foreach ($warehouses as $warehouse)
                                    <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        <x-form.selectbox labelName="{{__('file.Supplier')}}" name="supplier_id" col="col-md-3" class="selectpicker">
                            @if (!$suppliers->isEmpty())
                                @foreach ($suppliers as $supplier)
                                    <option value="{{ $supplier->id }}">{{  $supplier->name.' ('.$supplier->company_name.')'  }}</option>
                                @endforeach
                            @endif
                        </x-form.selectbox>
                        

                        <x-form.selectbox labelName="{{__('file.Payment Status')}}" name="payment_status" col="col-md-3" class="selectpicker">
                            @foreach (PAYMENT_STATUS as $key => $value)
                                <option value="{{ $key }}">{{ $value }}</option>
                            @endforeach
                        </x-form.selectbox>

                        <div class="col-md-9">
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

                    <div class="row">
                        <div class="col-sm-12">
                            <table id="dataTable" class="table table-bordered table-hover">
                                <thead class="bg-primary">
                                    <tr>
                                        @if (permission('purchase-bulk-delete'))
                                        <th>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="select_all" onchange="select_all()">
                                                <label class="custom-control-label" for="select_all"></label>
                                            </div>
                                        </th>
                                        @endif
                                        <th>{{__('file.SL')}}</th>
                                        <th>{{__('file.Purchase Date')}}</th>
                                        <th>{{__('file.Memo No.')}}</th>
                                        <th>{{__('file.Warehouse Name')}}</th>
                                        <th>{{__('file.Supplier Name')}}</th>
                                        <th>{{__('file.Total Item')}}</th>
                                        <th>{{__('file.Total Cost')}}</th>
                                        <th>{{__('file.Shipping Cost')}}</th>
                                        <th>{{__('file.Grand Total')}}</th>
                                        <th>{{__('file.Paid Amount')}}</th>
                                        <th>{{__('file.Due Amount')}}</th>
                                        <th>{{__('file.Payment Status')}}</th>
                                        <th>{{__('file.Account Head')}}</th>
                                        <th>{{__('file.Action')}}</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                <!--end: Datatable-->
            </div>
        </div>
        <!--end::Card-->
    </div>
</div>
@endsection

@push('scripts')
<script src="{{asset('js/knockout-3.4.2.js')}}"></script>
<script src="{{asset('js/daterangepicker.min.js')}}"></script>
<script>
var table;
$("#kt_body").addClass("aside-minimize");
$(document).ready(function(){
    $('.daterangepicker-filed').daterangepicker({
        callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date   = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('input[name="from_date"]').val(start_date);
            $('input[name="to_date"]').val(end_date);
        }
    });
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
            "url": "{{route('purchase.datatable.data')}}",
            "type": "POST",
            "data": function (data) {
                data.memo_no         = $("#form-filter #memo_no").val();
                data.warehouse_id    = $("#form-filter #warehouse_id option:selected").val();
                data.supplier_id     = $("#form-filter #supplier_id option:selected").val();
                data.from_date       = $("#form-filter #from_date").val();
                data.to_date         = $("#form-filter #to_date").val();
                data.payment_status  = $("#form-filter #payment_status").val();
                data._token          = _token;
            }
        },
        "columnDefs": [{
                @if (permission('purchase-bulk-delete'))
                "targets": [0,14],
                @else
                "targets": [13],
                @endif
                "orderable": false,
                "className": "text-center"
            },
            {
                @if (permission('purchase-bulk-delete'))
                "targets": [1,2,3,4,6,12,13],
                @else
                "targets": [0,1,2,3,5,11,12],
                @endif
                "className": "text-center"
            },
            {
                @if (permission('purchase-bulk-delete'))
                "targets": [7,8,9,10,11],
                @else
                "targets": [6,7,8,9,10],
                @endif
                "className": "text-right"
            },

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
                    @if (permission('purchase-bulk-delete'))
                    columns: ':visible:not(:eq(0),:eq(14))'
                    @else
                    columns: ':visible:not(:eq(13))'
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
                    @if (permission('purchase-bulk-delete'))
                    columns: ':visible:not(:eq(0),:eq(14))'
                    @else
                    columns: ':visible:not(:eq(13))'
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
                    @if (permission('purchase-bulk-delete'))
                    columns: ':visible:not(:eq(0),:eq(14))'
                    @else
                    columns: ':visible:not(:eq(13))'
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
                    @if (permission('purchase-bulk-delete'))
                    columns: ':visible:not(:eq(0),:eq(14))'
                    @else
                    columns: ':visible:not(:eq(13))'
                    @endif
                },
                customize: function(doc) {
                    doc.defaultStyle.fontSize = 7; //<-- set fontsize to 16 instead of 10
                    doc.styles.tableHeader.fontSize = 7;
                    doc.pageMargins = [5,5,5,5];
                }
            },
            @if (permission('purchase-bulk-delete'))
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
        $('#form-filter #from_date').val('');
        $('#form-filter #to_date').val('');
        $('#form-filter .selectpicker').selectpicker('refresh');
        table.ajax.reload();
    });

    $(document).on('click', '.delete_data', function () {
        let id    = $(this).data('id');
        let name  = $(this).data('name');
        let row   = table.row($(this).parent('tr'));
        let url   = "{{ route('purchase.delete') }}";
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
            let url = "{{route('purchase.bulk.delete')}}";
            bulk_delete(ids,url,table,rows);
        }
    }



});
</script>
@endpush
