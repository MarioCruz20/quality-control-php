<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Product;

class QualityParameters extends Model
{
    protected $table = 'quality_parameters';
    protected $primaryKey = 'quality_parameter_id';
    public $timestamps = false;

    protected $fillable = [
        'created', 'createdby', 
        'updated', 'updatedby', 
        'isactive', 
        'min_moisture', 'max_moisture', 
        'min_temperature', 'max_temperature', 
        'min_sodium', 'max_sodium', 
        'min_protein', 'max_protein', 
        'product_id'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }
}