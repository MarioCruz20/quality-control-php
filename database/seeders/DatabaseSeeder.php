<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            ProductionLineSeeder::class,
            ProductSeeder::class,
            QualityParameterSeeder::class,
            LotSeeder::class,
            BatchAnalysisSeeder::class,
            BatchAnalysisLineSeeder::class,
            BatchAnalysisStateSeeder::class,
        ]);
    }
}