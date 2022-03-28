<div class="form-group {{$col ?? ''}} {{$required ?? ''}}" >
    <label for="{{$name}}">{{$labelName}}</label>
    <select name="{{$name}}" id="{{$name}}" class="form-control {{$class ?? ''}}"
      @if(!empty($onchange)) onchange="{{$onchange}}" @endif data-live-search="true"
      data-live-search-placeholder="{{__('file.Search')}}">
        <option value="">{{__('file.Select Please')}}</option>
        {{$slot}}
    </select>
</div>
