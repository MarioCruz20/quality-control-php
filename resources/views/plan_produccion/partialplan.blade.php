@extends('layouts.app')

@section('title', 'Plan de Producción')

@section('content')
<div class="space-y-6">

    <div class="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
        <div>
            <h1 class="font-nav text-2xl font-bold text-gray-800 tracking-tight">
                Plan de Producción
            </h1>
            <p class="text-sm text-gray-500 font-sans">
                Busca los Lotes según la Línea y Fecha.
            </p>
        </div>
    </div>

    <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">

        <form class="p-3" action="" method="POST" class="space-y-6">
            @csrf

            <div class="flex flex-col md:flex-row gap-4">

                <div class="w-full">
                    <label for="production_line_id"
                        class="block font-nav text-sm font-semibold text-gray-700 mb-2">
                        Línea de Producción
                    </label>

                    <div class="relative">
                        <select id="production_line_id" name="production_line_id"
                            class="block w-full px-4 py-3 rounded-xl border border-gray-300 bg-white text-gray-700 fontsans focus:ring-2 focus:ring-blue-500 focus:border-blue-500 appearance-none outline-none transition-all cursor-pointer">
                            <option value="" disabled {{ old('production_line_id') ? '' : 'selected' }}>
                                Seleccionar...
                            </option>

                            @foreach ($productionLines as $productionLine)
                            <option value="{{ $productionLine->production_line_id }}"
                                {{ old('production_line_id') == $productionLine->production_line_id ? 'selected' : '' }}>
                                {{ $productionLine->name }}
                            </option>
                            @endforeach
                        </select>

                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-gray-500">
                            <svg class="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 9l-7 7-7-7"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <div class="w-full">
                    <label for="production_date"
                        class="block font-nav text-sm font-semibold text-gray-700 mb-2">
                        Fecha de Producción
                    </label>

                    <input type="date" name="production_date" id="production_date"
                        value="{{ old('production_date') }}" required
                        class="uppercase w-full px-4 py-3 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue500 outline-none transition-all placeholder:text-gray-400">
                </div>

                <div class="w-full content-end">
                    <button type="button" onclick="buscarPlan()"
                        class="inline-flex items-center justify-center px-10 py-3 bg-blue-600 hover:bg-blue-700 text-white font-nav font-semibold rounded-lg shadow-sm transition-all transition-transform hover:scale-105">
                        Buscar
                    </button>
                </div>

            </div>
        </form>

        <div id="contenedor-plan" class="mt-6">
            <p class="text-gray-500 italic text-center py-10 font-sans">
                Seleccione los filtros para visualizar el plan de producción.
            </p>
        </div>

    </div>
</div>

<script>
    async function buscarPlan() {
        const production_line_id = document.getElementById('production_line_id').value;
        const production_date = document.getElementById('production_date').value;
        const contenedor = document.getElementById('contenedor-plan');

        // Mostramos un estado de carga
        contenedor.innerHTML = '<div class="text-center py-10"><span class="animate-pulse text-blue-600 fontbold">Cargando datos...</span></div>';

        try {
            const response = await fetch('/plan_produccion/obtener', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': '{{ csrf_token() }}', // necesario para rutas POST en web.php
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: JSON.stringify({
                    production_line_id: production_line_id,
                    production_date: production_date
                })
            })

            if (!response.ok) {
                throw new Error('Error en la respuesta del servidor');
            }

            contenedor.innerHTML = await response.text();

        } catch (error) {
            accionarToast("Error grave al procesar", 'toast-errorJS', 'toastErrorMsg');
        }
    }

    async function procesar(lot_id) {
        if (confirm("¿Estás seguro de que desea procesar este lote?")) {
            try {
                const response = await fetch('/plan_produccion/store', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}', // necesario para rutas POST en web.php
                        'X-Requested-With': 'XMLHttpRequest'
                    },
                    body: JSON.stringify({
                        lot_id: lot_id
                    })
                })

                if (!response.ok) {
                    accionarToast('Error en la respuesta', 'toast-errorJS', 'toastErrorMsg');
                }

                var data = await response.json();
                var status = data.status;
                var message = data.message;

                if (status) {
                    buscarPlan();
                    accionarToast(message, 'toast-successJS', 'toastSuccesMsg');
                } else {
                    accionarToast(message, 'toast-errorJS', 'toastErrorMsg');
                }

            } catch (error) {
                accionarToast("Error grave al procesar", 'toast-errorJS', 'toastErrorMsg');
            }
        }
    }

    function accionarToast(message, id, idmsg) {
        // obtenemos el toast del app.blade.php
        var toastJS = document.getElementById(id);
        var toastMsg = document.getElementById(idmsg);

        toastMsg.textContent = message;
        toastJS.classList.remove('hidden');

        // lo cerramos despues de 5 segundos
        setTimeout(() => {
            toastMsg.textContent = null;
            toastJS.classList.add('hidden')
        }, 5000);
    }
</script>

@endsection