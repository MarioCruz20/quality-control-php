@extends('layouts.app')

@section('title', 'Lista de Parámetros de Calidad')

@section('content')
<div class="space-y-6">
    <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
            <h1 class="font-nav text-2xl font-bold text-gray-800 tracking-tight">
                Gestión de Parámetros de Calidad
            </h1>
            <p class="text-sm text-gray-500 font-sans">
                Visualiza, crea, edita y elimina parámetros de calidad.
            </p>
        </div>

        <a href="/qualityparameters/create"
            class="inline-flex items-center justify-center px-5 py-2.5 bg-blue-600 hover:bg-blue-700 text-white font-nav font-semibold rounded-lg shadow-sm transition-all hover:scale-105">
            <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M12 4v16m8-8H4"></path>
            </svg>
            Registrar Nuevo
        </a>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full text-left border-collapse">
                <thead class="bg-gray-50 border-b border-gray-200">
                    <tr>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600 text-center">ID</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600">Producto</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600">Humedad</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600">Temperatura</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600">Proteína</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600">Estado</th>
                        <th class="px-6 py-4 text-xs font-semibold text-gray-600 text-right">Opciones</th>
                    </tr>
                </thead>

                <tbody class="divide-y divide-gray-100 font-sans">
                    @forelse($list as $q)
                    <tr class="hover:bg-gray-50 transition">
                        <td class="px-6 py-4 text-sm text-center text-gray-500">
                            {{ $q->quality_parameter_id }}
                        </td>

                        <td class="px-6 py-4">
                            <div class="flex items-center">
                                <div class="h-9 w-9 rounded-full bg-indigo-100 flex items-center justify-center text-indigo-700 font-bold text-xs">
                                    {{ strtoupper(substr($q->product->name ?? 'NA', 0, 2)) }}
                                </div>
                                <div class="ml-3 text-sm font-semibold text-gray-900">
                                    {{ $q->product->name ?? 'Sin producto' }}
                                </div>
                            </div>
                        </td>

                        <td class="px-6 py-4 text-sm text-gray-600">
                            {{ $q->min_moisture }} - {{ $q->max_moisture }}
                        </td>

                        <td class="px-6 py-4 text-sm text-gray-600">
                            {{ $q->min_temperature }} - {{ $q->max_temperature }}
                        </td>

                        <td class="px-6 py-4 text-sm text-gray-600">
                            {{ $q->min_protein }} - {{ $q->max_protein }}
                        </td>

                        <td class="px-6 py-4 text-sm">
                            @if($q->isactive == 'Y')
                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                Activo
                            </span>
                            @else
                            <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                Inactivo
                            </span>
                            @endif
                        </td>

                        <td class="px-6 py-4 text-right">
                            <div class="flex justify-end space-x-2">

                                <a href="/qualityparameters/edit/{{ $q->quality_parameter_id }}"
                                    class="p-1.5 text-yellow-600 hover:bg-yellow-50 rounded-md transition"
                                    title="Editar">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                    </svg>
                                </a>

                                <form action="/qualityparameters/destroy/{{ $q->quality_parameter_id }}"
                                    method="POST"
                                    onsubmit="return confirm('¿Eliminar este registro?');">
                                    @csrf
                                    @method('DELETE')

                                    <button type="submit"
                                        class="p-1.5 text-red-600 hover:bg-red-50 rounded-md transition"
                                        title="Eliminar">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                                        </svg>
                                    </button>
                                </form>

                            </div>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" class="px-6 py-10 text-center text-gray-500 italic">
                            No hay parámetros registrados.
                        </td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection