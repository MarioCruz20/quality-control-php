@extends('layouts.app')

@section('title', 'Nuevo Parámetro de Calidad')

@section('content')
<div class="max-w-4xl mx-auto">

    <!-- Volver -->
    <div class="mb-6">
        <a href="{{ route('quality_parameters.index') }}" 
           class="inline-flex items-center text-sm font-nav text-blue-600 hover:text-blue-800 transition-colors">
            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"/>
            </svg>
            Volver a la lista
        </a>
    </div>

    <div class="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden">
        <div class="p-8">

            <!-- Título -->
            <div class="mb-8">
                <h1 class="font-nav text-2xl font-bold text-gray-900">Registrar Parámetros de Calidad</h1>
                <p class="text-sm text-gray-500 mt-1">
                    Complete los datos para definir los parámetros de calidad de un producto.
                </p>
            </div>

            <form action="{{ route('qualityparameters.store') }}" method="POST" class="space-y-6">
                @csrf

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <!-- Producto -->
                    <div class="md:col-span-2">
                        <label class="block font-nav text-sm font-semibold text-gray-700 mb-2">Producto</label>
                        <select name="product_id"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                            
                            @foreach($products as $p)
                                <option value="{{ $p->product_id }}">{{ $p->name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Humedad -->
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Min Humedad</label>
                        <input type="number" step="0.01" name="min_moisture"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Max Humedad</label>
                        <input type="number" step="0.01" name="max_moisture"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <!-- Temperatura -->
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Min Temperatura</label>
                        <input type="number" step="0.01" name="min_temperature"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Max Temperatura</label>
                        <input type="number" step="0.01" name="max_temperature"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <!-- Sodio -->
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Min Sodio</label>
                        <input type="number" step="0.01" name="min_sodium"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Max Sodio</label>
                        <input type="number" step="0.01" name="max_sodium"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <!-- Proteína -->
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Min Proteína</label>
                        <input type="number" step="0.01" name="min_protein"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Max Proteína</label>
                        <input type="number" step="0.01" name="max_protein"
                            class="w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 outline-none">
                    </div>

                    <!-- Estado -->
                    <div class="md:col-span-2">
                        <label class="block font-nav text-sm font-semibold text-gray-700 mb-2">Estado</label>

                        <div class="flex items-center space-x-6">
                            <label class="inline-flex items-center cursor-pointer">
                                <input type="radio" name="isactive" value="Y" checked
                                    class="w-4 h-4 text-blue-600">
                                <span class="ml-2 text-sm">Activo</span>
                            </label>

                            <label class="inline-flex items-center cursor-pointer">
                                <input type="radio" name="isactive" value="N"
                                    class="w-4 h-4 text-red-600">
                                <span class="ml-2 text-sm">Inactivo</span>
                            </label>
                        </div>
                    </div>

                </div>

                <!-- Botones -->
                <div class="pt-6 border-t border-gray-100 flex justify-end space-x-4">
                    <button type="reset"
                        class="px-6 py-2.5 font-nav text-sm font-semibold text-gray-600 hover:text-gray-800">
                        Limpiar
                    </button>

                    <button type="submit"
                        class="px-8 py-3 bg-blue-600 hover:bg-blue-700 text-white font-nav font-bold rounded-xl shadow-lg shadow-blue-200 transition-all active:scale-95">
                        Guardar
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>
@endsection