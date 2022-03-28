<?php

namespace Modules\Vehicle\Http\Requests;

use App\Http\Requests\FormRequest;


class VehicleFormRequest extends FormRequest
{
    protected $rules;
    public function rules()
    {
        $this->rules['name'] = ['required','unique:vehicles,name'];
        $this->rules['qty'] = ['required','numeric','gt:0'];
        if(request()->update_id)
        {
            $this->rules['name'][1] = "unique:vehicles,name,".request()->update_id;
        }
        return $this->rules;
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
