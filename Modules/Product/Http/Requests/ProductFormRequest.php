<?php

namespace Modules\Product\Http\Requests;

use App\Http\Requests\FormRequest;

class ProductFormRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules['name']                 = ['required','string','unique:products,name'];
        $rules['category_id']          = ['required'];
        $rules['code']                 = ['required','string','unique:products,code'];
        $rules['price']                = ['required','numeric','gte:0'];
        $rules['unit_id']              = ['required'];
        $rules['alert_qty']            = ['nullable','numeric','gte:0'];
        $rules['opening_cost']         = ['nullable','numeric','gte:0'];
        $rules['opening_stock_qty']    = ['nullable','numeric'];
        $rules['opening_warehouse_id'] = ['nullable','numeric'];

        if(request()->update_id){
            $rules['name'][2] = 'unique:products,name,'.request()->update_id;
            $rules['code'][2] = 'unique:products,code,'.request()->update_id;
        }

        if(request()->has_opening_stock == 1)
        {
            $rules['opening_cost'][0]         = 'required';
            $rules['opening_stock_qty'][0]    = 'required';
            $rules['opening_warehouse_id'][0] = 'required';
        }
        return $rules;
    }

    public function messages()
    {
        return [
            'unit_id.required'      => 'The unit name field is required',
            'sale_unit_id.required' => 'The sale unit name field is required',
        ];
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
