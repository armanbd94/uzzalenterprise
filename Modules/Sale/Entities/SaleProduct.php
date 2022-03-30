<?php

namespace Modules\Sale\Entities;

use Modules\Sale\Entities\Sale;
use Modules\Product\Entities\Product;
use Illuminate\Database\Eloquent\Model;

class SaleProduct extends Model
{
    protected $fillable = ['purchase_id', 'product_id', 'qty', 'vehicle_no', 'challan_no', 'price', 'total','net_unit_cost','total_cost'];

    public function sale()
    {
        return $this->belongsTo(Sale::class);
    }
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
