<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BatchAnalysisSeeder extends Seeder
{
    public function run(): void
    {
        \App\Models\BatchAnalysis::factory(10)->create();
    }
}