<?php
    $total_debit = 0;
    $total_credit = 0;
    $current_balance = $pre_balance;

    if (!$report_data->isEmpty()){
        foreach ($report_data as $key =>  $value){
            $total_debit += $value->debit;
            $current_balance += $value->debit;

            $total_credit += $value->credit;
            $current_balance -= $value->credit;
        }
    }
?>
<style>


    @media print {

        body,
        html {
            background: #fff !important;
            -webkit-print-color-adjust: exact !important;
            font-family: sans-serif;
            /* font-size: 12px !important; */
            margin-bottom: 100px !important;
        }

        .m-0 {
            margin: 0 !important;
        }

        h1,
        h2,
        h3,
        h4,
        h5,
        h6 {
            margin: 0 !important;
        }

        .no_screen {
            display: block !important;
        }

        .no_print {
            display: none;
        }

        a {
            content: none !important;
            text-decoration: none !important;
            color: #036 !important;
        }

        .text-center {
            text-align: center !important;
        }

        .text-left {
            text-align: left !important;
        }

        .text-right {
            text-align: right !important;
        }

        .float-left {
            float: left !important;
        }

        .float-right {
            float: right !important;
        }

        .text-bold {
            font-weight: bold !important;
        }


        /* .invoice>div:last-child {
            page-break-before: always
        } */
        .hidden-print {
            display: none !important;
        }
        .dashed-border{
            width:180px;height:2px;margin:0 auto;padding:0;border-top:1px dashed #454d55 !important;
        }
    }

    @page {
        /* size: auto; */
        margin: 5mm 5mm;

    }
</style>
<table width="100%" style="margin:0;padding:0;">
    <tr>
        <td width="100%" class="text-center">
            <h3 style="margin:0;">{{ config('settings.title') ? config('settings.title') : env('APP_NAME') }}</h3>
            @if(config('settings.contact_no'))<p style="font-weight: normal;margin:0;"><b>{{__('file.Contact')}}: </b>{{ config('settings.contact_no') }}, @if(config('settings.email'))<b>{{__('file.Email')}}: </b>{{ config('settings.email') }}@endif</p>@endif
            @if(config('settings.address'))<p style="font-weight: normal;margin:0;">{{ config('settings.address') }}</p>@endif
            <p style="font-weight: normal;margin:0;"><b>{{__('file.Date')}}: </b>{{ date('d-M-Y') }}</p>
        </td>
    </tr>
</table>
<div style="width:100%;height:2px;padding:5px 0;"></div>
<div style="width:100%;height:2px;border-bottom:1px dotted #454d55;"></div>
<div style="width:100%;height:2px;padding-top:5px;"></div>
<h4 class="text-dark text-center py-3"><b> {{__('file.General Ledger of')}} {{ $bank_name }} ({{__('file.From')}} {{ $start_date }} {{__('file.To')}} {{ $end_date }})</b></h4>
<table class="table table-borderless" style="width:100%;">
    <thead class="bg-primary">
        <tr>
            <th class="text-right">{{__('file.Pre Balance')}}: {{ number_format($pre_balance,2) }}</th>
        </tr>
        <tr>
            <th class="text-right">{{__('file.Current Balance')}}: {{ number_format($current_balance,2) }}</th>
        </tr>
    </thead>
</table>
<table class="table table-bordered" style="width:100%;">
    <thead class="bg-primary">
        <tr>
            <th class="text-center">{{__('file.SL')}}</th>
            <th class="text-center">{{__('file.Transaction Date')}}</th>
            <th class="text-center">{{__('file.Particulars')}}</th>
            <th class="text-right">{{__('file.Debit')}}</th>
            <th class="text-right">{{__('file.Credit')}}</th>
            <th class="text-right">{{__('file.Balance')}}</th>
        </tr>
    </thead>
    <tbody>
        @if (!$report_data->isEmpty())
            @foreach ($report_data as $key =>  $value)
            <tr>
                <td class="text-center">{{ $key + 1 }}</td>
                <td class="text-center">{{ $value->voucher_date }}</td>
                <td>{{ $value->description }}</td>
                <td class="text-right"> {{ number_format($value->debit,2) }}</td>
                <td class="text-right"> {{ number_format($value->credit,2)  }}</td>
                <td class="text-right">{{ number_format($current_balance,2)  }}</td>
            </tr>
            @endforeach
        @endif
    </tbody>
    <tfoot>
        <tr class="bg-primary">
            <td colspan="3" class="text-right text-white font-weight-bolder">{{__('file.Total')}}</td>
            <td class="text-right text-white font-weight-bolder">{{ number_format($total_debit,2)  }}</td>
            <td class="text-right text-white font-weight-bolder">{{ number_format($total_credit,2)  }}</td>
            <td class="text-right text-white font-weight-bolder">{{ number_format($current_balance,2)  }}</td>
        </tr>
    </tfoot>
</table>
