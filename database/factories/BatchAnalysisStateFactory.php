<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\BatchAnalysis;

class BatchAnalysisStateFactory extends Factory
{
    public function definition(): array
    {
        $dateFrom = $this->faker->dateTimeBetween('-10 days', 'now');
        $dateTo = $this->faker->dateTimeBetween($dateFrom, 'now');

        return [
            'name' => $this->faker->randomElement(['Pendiente', 'En Proceso', 'Finalizado']),

            'datefrom' => $dateFrom,
            'dateto' => $dateTo,
            'datediif' => $dateFrom->diff($dateTo)->days,

            'batch_analysis_id' => BatchAnalysis::inRandomOrder()->first()->batch_analysis_id,

            'isactive' => 'Y',

            'created' => now(),
            'updated' => now(),
            'createdby' => 1,
            'updatedby' => 1,
        ];
    }
}