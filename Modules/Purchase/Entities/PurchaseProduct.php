<?php

namespace Modules\Purchase\Entities;

use Modules\Product\Entities\Product;
use Illuminate\Database\Eloquent\Model;
use Modules\Purchase\Entities\Purchase;

class PurchaseProduct extends Model
{
    protected $fillable = ['purchase_id', 'product_id', 'qty', 'vehicle_no', 'challan_no', 'net_unit_cost', 
    'new_unit_cost', 'current_unit_cost', 'old_unit_cost', 'total'];

    public function purchase()
    {
        return $this->belongsTo(Purchase::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
