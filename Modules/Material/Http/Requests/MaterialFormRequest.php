<?php

namespace Modules\Material\Http\Requests;

use App\Http\Requests\FormRequest;

class MaterialFormRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules['material_name']        = ['required','string','unique:materials,material_name'];
        $rules['material_code']        = ['required','string','unique:materials,material_code'];
        $rules['cost']                 = ['required','numeric','gte:0'];
        $rules['unit_id']              = ['required'];
        $rules['purchase_unit_id']     = ['required'];
        $rules['alert_qty']            = ['nullable','numeric','gte:0'];
        $rules['tax_id']               = ['nullable','numeric'];
        $rules['tax_method']           = ['required','numeric'];
        $rules['opening_stock_qty']    = ['nullable','numeric'];
        $rules['opening_warehouse_id'] = ['nullable','numeric'];

        if(request()->update_id){
            $rules['material_name'][2] = 'unique:materials,material_name,'.request()->update_id;
            $rules['material_code'][2] = 'unique:materials,material_code,'.request()->update_id;
        }

        if(request()->has_opening_stock == 1)
        {
            $rules['opening_stock_qty'][0]    = 'required';
            $rules['opening_warehouse_id'][0] = 'required';
        }
        return $rules;
    }

    public function messages()
    {
        return [
            'unit_id.required'          => 'The unit name field is required',
            'purchase_unit_id.required' => 'The purchase unit name field is required',
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
