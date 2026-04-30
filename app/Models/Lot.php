<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasOne;

use Illuminate\Database\Eloquent\Factories\HasFactory;


class Lot extends Model
{
    use HasFactory;

    protected $table = 'lot';
    protected $primaryKey = 'lot_id';
    public $timestamps = false;

    protected $fillable = [
        'created',
        'createdby',
        'updated',
        'updatedby',
        'isactive',
        'name',
        'production_date',
        'analysis_date',
        'product_id'
    ];

    protected $casts = [
        'analysis_date' => 'datetime',
        'production_date' => 'datetime',
        'created' => 'datetime',
        'updated' => 'datetime',
    ];

    /**
     * Relacion 1:n inversa: Devuelve el producto al que pertenece el lote
     *
     * @return BelongsTo - registro de producto
     */
    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id', 'product_id');
    }

    /**
     * Relacion 1:1 directa: Un lote solo puede tener un analisis de lote 
     *
     * @return HasOne - lote analizado
     */
    function batchAnalysis(): HasOne
    {
        return $this->hasOne(BatchAnalysis::class, 'lot_id', 'lot_id');
    }
}
