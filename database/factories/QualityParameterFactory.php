<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\QualityParameters;

class QualityParameterFactory extends Factory
{
    protected $model = QualityParameters::class;

    public function definition()
    {
        return [
            'min_moisture' => $this->faker->randomFloat(2, 1, 10),
            'max_moisture' => $this->faker->randomFloat(2, 10, 20),

            'min_temperature' => $this->faker->randomFloat(2, 10, 30),
            'max_temperature' => $this->faker->randomFloat(2, 30, 60),

            'min_sodium' => $this->faker->randomFloat(2, 1, 5),
            'max_sodium' => $this->faker->randomFloat(2, 5, 10),

            'min_protein' => $this->faker->randomFloat(2, 5, 15),
            'max_protein' => $this->faker->randomFloat(2, 15, 30),

            'isactive' => $this->faker->randomElement(['Y', 'N']),

            'product_id' => \App\Models\Product::inRandomOrder()->first()->product_id,

            'created' => now(),
            'updated' => now(),
            'createdby' => 1,
            'updatedby' => 1
        ];
    }
}