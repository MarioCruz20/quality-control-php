<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

use Illuminate\Database\Eloquent\Factories\HasFactory;

class BatchAnalysis extends Model
{
    use HasFactory;

    protected $table = 'batch_analysis';
    protected $primaryKey = 'batch_analysis_id';
    public $timestamps = false;
    protected $fillable = [
        'created', 
        'createdby', 
        'updated', 
        'updatedby', 
        'isactive', 
        'lot_id'
    ];

    /**
     * Relacion 1:1 directa: Un analisis de lote solo puede tener un registro de estado
     *
     * @return HasOne - estado del lote analizado
     */
    function batchAnalysisState() : HasOne {
        return $this->hasOne(BatchAnalysisState::class, 'batch_analysis_id', 'batch_analysis_id');
    }

    /**
     * Relacion 1:N directa: Un lote puede tener varios batch analizados
     *
     * @return HasMany - los resultados del analisis del batch del lote
     */
    function batchAnalysisLines() : HasMany {
        return $this->hasMany(BatchAnalysisLine::class, 'batch_analysis_id', 'batch_analysis_id');
    }
}
