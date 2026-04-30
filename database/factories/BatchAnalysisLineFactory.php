<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\BatchAnalysisLine;

class BatchAnalysisLineFactory extends Factory
{
    protected $model = BatchAnalysisLine::class;

    public function definition(): array
    {
        return [
            'moisture' => $this->faker->randomFloat(2, 1, 20),
            'temperature' => $this->faker->randomFloat(2, 10, 60),
            'sodium' => $this->faker->randomFloat(2, 1, 10),
            'protein' => $this->faker->randomFloat(2, 5, 30),
            'number_batch' => $this->faker->numberBetween(1, 100),

            'batch_analysis_id' => \App\Models\BatchAnalysis::inRandomOrder()->first()->batch_analysis_id,

            'isactive' => $this->faker->randomElement(['Y', 'N']),

            'created' => now(),
            'updated' => now(),
            'createdby' => 1,
            'updatedby' => 1
        ];
    }
}