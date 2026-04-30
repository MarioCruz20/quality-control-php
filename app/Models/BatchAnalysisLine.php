<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class BatchAnalysisLine extends Model
{

    use HasFactory;
    protected $table = 'batch_analysis_line';
    protected $primaryKey = 'batch_analysis_line_id';
    public $timestamps = false;
    protected $fillable = [
        'created',
        'createdby',
        'updated',
        'updatedby',
        'isactive',
        'moisture',
        'temperature',
        'sodium',
        'protein',
        'number_batch',
        'batch_analysis_id'
    ];
}
