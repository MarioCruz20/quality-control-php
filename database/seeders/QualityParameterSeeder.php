<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class QualityParameterSeeder extends Seeder
{
    public function run(): void
    {
        \App\Models\QualityParameters::factory(10)->create();
    }
}
