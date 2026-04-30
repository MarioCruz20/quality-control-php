<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\BatchAnalysis;

class BatchAnalysisFactory extends Factory
{
    protected $model = BatchAnalysis::class;

    public function definition(): array
    {
        return [
            'lot_id' => \App\Models\Lot::inRandomOrder()->first()->lot_id,
            'isactive' => $this->faker->randomElement(['Y', 'N']),
            'created' => now(),
            'updated' => now(),
            'createdby' => 1,
            'updatedby' => 1
        ];
    }
}