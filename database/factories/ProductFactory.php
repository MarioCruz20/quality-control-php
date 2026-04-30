<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => $this->faker->word(),
            'code' => strtoupper($this->faker->bothify('PRD-###')),
            'picture' => null,

            'production_line_id' => \App\Models\ProductionLine::inRandomOrder()->first()->production_line_id,

            'isactive' => 'Y',
            'created' => now(),
            'updated' => now(),
            'createdby' => 1,
        ];
    }
}
