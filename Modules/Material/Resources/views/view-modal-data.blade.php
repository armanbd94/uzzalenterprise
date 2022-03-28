<div class="col-md-12 text-center">
    @if($material->material_image)
        <img src='storage/{{ MATERIAL_IMAGE_PATH.$material->material_image }}' alt='{{ $material->material_name }}' style='width:200px;'/>
    @else
        <img src='{{asset('images/default.svg')}}' alt='Default Image' style='width:200px;'/>
    @endif
</div>
<div class="col-md-12">
    <div class="table-responsive">
        <table class="table table-borderless">
            <tr><td width="40%"><b>{{__('file.Material Name')}}</b></td><td><b>:</b></td><td>{{ $material->material_name }}</td></tr>
            <tr><td width="40%"><b>{{__('file.Material Code')}}</b></td><td><b>:</b></td><td>{{ $material->material_code }}</td></tr>
            <tr><td width="40%"><b>{{__('file.Cost')}}</b></td><td><b>:</b></td><td>{{ $material->cost ? number_format($material->cost,2) : 0 }}</td></tr>
            <tr><td width="40%"><b>{{__('file.Unit')}}</b></td><td><b>:</b></td><td>{{ $material->unit->unit_name }}</td></tr>
            <tr><td width="40%"><b>{{__('file.Purchase Unit')}}</b></td><td><b>:</b></td><td>{{ $material->purchase_unit->unit_name }}</td></tr>
            <tr><td width="40%"><b>{{__('file.Stock Quantity')}}</b></td><td><b>:</b></td><td>{!! $material->qty ? $material->qty : '<span class="label label-danger"">0</span>' !!}</td></tr>
            <tr><td width="40%"><b>{{__('file.Stock Alert Quantity')}}</b></td><td><b>:</b></td><td>{!! $material->alert_qty ? $material->alert_qty : '<span class="label label-danger"">0</span>' !!}</td></tr>
            <tr><td width="40%"><b>{{__('file.Status')}}</b></td><td><b>:</b></td><td>{!! STATUS_LABEL[$material->status] !!}</td></tr>
            <tr><td width="40%"><b>{{__('file.Created By')}}</b></td><td><b>:</b></td><td>{{  $material->created_by  }}</td></tr>
            @if($material->modified_by)<tr><td width="40%"><b>{{__('file.Modified By')}}</b></td><td><b>:</b></td><td>{{  $material->modified_by  }}</td></tr>@endif
            <tr><td width="40%"><b>{{__('file.Create Date')}}</b></td><td><b>:</b></td><td>{{  $material->created_at ? date(config('settings.date_format'),strtotime($material->created_at)) : ''  }}</td></tr>
            @if($material->modified_by)<tr><td width="40%"><b>{{__('file.Modified Date')}}</b></td><td><b>:</b></td><td>{{  $material->updated_at ? date(config('settings.date_format'),strtotime($material->updated_at)) : ''  }}</td></tr>@endif
    </div>
</div>
