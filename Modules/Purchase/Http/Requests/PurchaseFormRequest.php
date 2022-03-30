<?php

namespace Modules\Purchase\Http\Requests;

use App\Http\Requests\FormRequest;

class PurchaseFormRequest extends FormRequest
{
    protected $rules;
    protected $messages;
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $this->rules['memo_no']    = ['required','unique:purchases,memo_no'];
        $this->rules['purchase_date']    = ['required','date','date_format:Y-m-d'];
        $this->rules['warehouse_id']    = ['required'];
        $this->rules['supplier_id']     = ['required'];
        $this->rules['shipping_cost']   = ['nullable','numeric','gte:0'];

        if(request()->has('products'))
        {
            foreach (request()->products as $key => $value) {
                $this->rules   ['products.'.$key.'.qty']          = ['required','numeric','gt:0'];
                $this->rules   ['products.'.$key.'.net_unit_cost']= ['required','numeric','gt:0'];
                $this->messages['products.'.$key.'.qty.required'] = 'This field is required';
                $this->messages['products.'.$key.'.qty.numeric']  = 'The value must be numeric';
                $this->messages['products.'.$key.'.qty.gt']       = 'The value must be greater than 0';
                $this->messages['products.'.$key.'.net_unit_cost.required'] = 'This field is required';
                $this->messages['products.'.$key.'.net_unit_cost.numeric']  = 'The value must be numeric';
                $this->messages['products.'.$key.'.net_unit_cost.gt']       = 'The value must be greater than 0';
            }
        }


        $this->rules['payment_status'] = ['required'];
        if(!empty(request()->payment_status) && request()->payment_status != 3)
        {
            $this->rules['paid_amount'] = ['required','numeric','gt:0','lt:'.request()->grand_total];
            if(request()->payment_status == 1)
            {
                $this->rules['paid_amount'][2] = 'min:'.request()->grand_total;
                $this->rules['paid_amount'][3] = 'max:'.request()->grand_total;
            }
            $this->rules['payment_method'] = ['required'];
            $this->rules['account_id'] = ['required'];
            
        }
        
        if(request()->purchase_id)
        {
            $this->rules['memo_no'][1] = 'unique:purchases,memo_no,'.request()->purchase_id;
        }

        return $this->rules;
    }

    public function messages()
    {
        return $this->messages;
    }


    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
