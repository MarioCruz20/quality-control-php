<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Lot;
use App\Models\Product;
use Exception;
use Illuminate\Http\Request;

class LotController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $lots = Lot::all();
            return view('lot.index', compact('lots'));
        } catch (Exception $th) {
            return redirect()->back()->with('error', 'Error grave al acceder a la vista.');
        }
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        try {
            $products = Product::all();
            return view('lot.create', compact('products'));
        } catch (Exception $th) {
            return redirect()->back()->with('error', 'Error grave al acceder a la vista.');
        }
    }
    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            // validamos los datos recibidos del formulario
            $validatedData = $request->validate([
                'isactive' => 'required|string|max:1',
                'product_id' => 'required|integer|exists:product,product_id',
                'name' => 'required|string|max:100',
                'production_date' => 'required|string'
            ]);
            // seteamos los datos para crear un nuevo producto
            $data = new Lot();
            $data->created = now();
            $data->createdby = 0;
            $data->updated = now();
            $data->updatedby = 0;
            $data->isactive = $validatedData['isactive'];
            $data->name = $validatedData['name'];
            $data->production_date = $validatedData['production_date'];
            $data->product_id = $validatedData['product_id'];
            // creamos un nuevo registro en la base de datos
            $isOK = $data->save();
            if ($isOK) {
                // redirigimos con un mensaje de éxito
                return redirect()->route('lot.index')->with('success', 'Registro creado exitosamente.');
            } else {
                return redirect()->back()
                    ->withInput() // Envía los datos del formulario de vuelta
                    ->with('error', 'Error al crear el registro.');
            }
        } catch (Exception $ex) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Error grave al crear el registro.' . $ex->getMessage());
        }
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        try {
            // buscamos el registro por su id
            $lot = Lot::find($id);
            // obtenemos el listado de productos
            $products = Product::all();
            if ($lot == null || $products == null) {
                // si no se encuentra el registro, redirigimos con un mensaje de error
                return redirect()->route('lot.index')->with('error', 'Registro no encontrado.');
            }
            // retornamos la vista con los datos del registro encontrado
            return view('lot.edit', compact('lot', 'products'));
        } catch (Exception $ex) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Error grave al buscar el registro.');
        }
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            // validamos los datos recibidos del formulario
            $validatedData = $request->validate([
                'isactive' => 'required|string|max:1',
                'product_id' => 'required|integer|exists:product,product_id',
                'name' => 'required|string|max:100',
                'production_date' => 'required|string'
            ]);
            // seteamos los datos para crear un nuevo producto
            $data = Lot::find($id);
            $data->updated = now();
            $data->updatedby = 0;
            $data->isactive = $validatedData['isactive'];
            $data->name = $validatedData['name'];
            $data->production_date = $validatedData['production_date'];
            $data->product_id = $validatedData['product_id'];
            // creamos un nuevo registro en la base de datos
            $isOK = $data->save();
            if ($isOK) {
                // redirigimos con un mensaje de éxito
                return redirect()->route('lot.index')->with('success', 'Registro actualizado exitosamente.');
            } else {
                return redirect()->back()
                    ->withInput() // Envía los datos del formulario de vuelta
                    ->with('error', 'Error al actualizar el registro.');
            }
        } catch (Exception $ex) {
            return redirect()->back()
                ->withInput()
                ->with('error', 'Error grave al actualizar el registro.' . $ex->getMessage());
        }
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            // buscamos el registro por su id
            $lot = Lot::find($id);
            if ($lot == null) {
                // si no se encuentra el registro, redirigimos con un mensaje de error
                return redirect()->route('lot.index')->with('error', 'Registro no encontrado.');
            }
            // eliminamos el registro de la base de datos
            $isOK = $lot->delete();
            if ($isOK) {
                // redirigimos al usuario con un mensaje de éxito
                return redirect()->route('lot.index')->with('success', 'Registro eliminado exitosamente.');
            } else {
                return redirect()->back()
                    ->with('error', 'Error al eliminar el registro.');
            }
        } catch (Exception $ex) {
            return redirect()->back()
                ->with('error', 'Error grave al eliminar el registro.');
        }
    }
}