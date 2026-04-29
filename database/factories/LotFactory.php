<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Lot>
 */
class LotFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'name' => 'LOT-' . $this->faker->unique()->numberBetween(1000, 9999),

            'product_id' => \App\Models\Product::inRandomOrder()->first()->product_id,

            'production_date' => $this->faker->date(),
            'analysis_date' => $this->faker->optional()->date(),

            'isactive' => $this->faker->randomElement(['Y', 'N']),

            'created' => now(),
            'updated' => now(),
            'createdby' => 'admin'
        ];
    }
}
