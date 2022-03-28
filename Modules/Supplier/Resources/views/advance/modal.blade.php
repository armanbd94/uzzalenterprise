<div class="modal fade" id="store_or_update_modal" tabindex="-1" role="dialog" aria-labelledby="model-1" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <!-- Modal Content -->
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header bg-primary">
          <h3 class="modal-title text-white" id="model-1"></h3>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <i aria-hidden="true" class="ki ki-close text-white"></i>
          </button>
        </div>
        <!-- /modal header -->
        <form id="store_or_update_form" method="post">
          @csrf
            <!-- Modal Body -->
            <div class="modal-body">
                <div class="row">
                    <input type="hidden" name="update_id" id="update_id"/>
                    <x-form.selectbox labelName="{{__('file.Supplier Name')}}" name="supplier" required="required"  col="col-md-12" class="selectpicker">
                        @if (!$suppliers->isEmpty())
                        @foreach ($suppliers as $supplier)
                            <option value="{{ $supplier->id }}" data-coaid="{{ $supplier->coa->id }}" data-name="{{ $supplier->name }}">{{ $supplier->name.' - '.$supplier->mobile }}</option>
                        @endforeach
                        @endif
                    </x-form.selectbox>
                    <x-form.selectbox labelName="{{__('file.Advance Type')}}" name="type" required="required"  col="col-md-12" class="selectpicker">
                        <option value="debit">Payment</option>
                        <option value="credit">Receive</option>
                    </x-form.selectbox>
                    <x-form.textbox labelName="{{__('file.Amount')}}" name="amount" required="required" col="col-md-12" placeholder="{{__('file.Enter Amount')}}"/>
                </div>
            </div>
            <!-- /modal body -->
            <!-- Modal Footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">{{__('file.Close')}}</button>
            <button type="button" class="btn btn-primary btn-sm" id="save-btn"></button>
            </div>
            <!-- /modal footer -->
        </form>
      </div>
      <!-- /modal content -->
    </div>
  </div>
