<?php

namespace Modules\Setting\Http\Requests;

use App\Http\Requests\FormRequest;

class CompanySessionRequest extends FormRequest
{

    public function rules()
    {
        $rules = [
            'session_name' => ['required','unique:company_sessions,session_name'],
            'session_start' => ['required','date','date_format:Y-m-d'],
            'session_end' => ['required','date','date_format:Y-m-d'],
        ];
        if(request()->update_id)
        {
            $rules['session_name'][1] = "unique:company_sessions,session_name,".request()->update_id;
        }

        return $rules;
    }

    public function authorize()
    {
        return true;
    }
}
