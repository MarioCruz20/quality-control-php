<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use App\Models\BatchAnalysis;
use App\Models\Lot;
use App\Models\ProductionLine;
use App\Models\BatchAnalysisState;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class PlanProduccionController extends Controller
{
    public function index()
    {
        try {
            $productionLines = ProductionLine::all();
            return view('plan_produccion.index', compact('productionLines'));
        } catch (Exception $th) {
            return redirect()->back()->with('error', 'Error grave al acceder a la vista.');
        }
    }

    public function obtenerPlanPorLineaYFecha(Request $request)
    {
        try {

            $production_date = date('Y-m-d', strtotime($request->production_date));
            $production_line_id = $request->production_line_id;

            $lots = Lot::where('production_date', $production_date)
                ->where('isactive', 'Y')
                ->whereHas('product', function ($query) use ($production_line_id) {
                    $query->whereHas('productionLine', function ($subQuery) use ($production_line_id) {
                        $subQuery->where('production_line_id', $production_line_id);
                    });
                })
                ->get();

            // Retornamos la vista parcial (fragmento de HTML)
            return view('plan_produccion.partialplan', compact('lots'));
        } catch (\Exception $th) {
            return response()->json([
                'error' => $th->getMessage(),
                'line' => $th->getLine(),
                'file' => $th->getFile()
            ], 500);
        }
    }


    public function store(Request $request)
    {
        DB::beginTransaction();
        try {

            $validatedData = $request->validate([
                'lot_id' => 'required|numeric'
            ]);

            $data = new BatchAnalysis();
            $data->created = now();
            $data->createdby = 0;
            $data->updated = now();
            $data->updatedby = 0;
            $data->isactive = 'Y';
            $data->lot_id = $validatedData['lot_id'];
            $data->save();

            $dataDetalle = new BatchAnalysisState();
            $dataDetalle->created = now();
            $dataDetalle->createdby = 0;
            $dataDetalle->updated = now();
            $dataDetalle->updatedby = 0;
            $dataDetalle->isactive = 'Y';
            $dataDetalle->name = 'en proceso';
            $dataDetalle->datefrom = now();
            $dataDetalle->batch_analysis_id = $data->batch_analysis_id;
            $dataDetalle->save();

            DB::commit();

            // respondemos con un mensaje de éxito
            $message = ['message' => "Acción realizada correctamente", "status" => true];
            return response()->json($message);
        } catch (\Exception $th) {
            return response()->json([
                'error' => $th->getMessage(),
                'line' => $th->getLine(),
                'file' => $th->getFile()
            ], 500);
        }
    }
}