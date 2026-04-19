<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;500;600;700&family=Dancing+Script:wght@400..700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <title>QualityControl - @yield('title')</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Configuración personalizada de Tailwind -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Roboto', 'sans-serif'], // Cuerpo y lectura
                        title: ['Dancing Script', 'cursive'], // Logo / Branding
                        nav: ['Archivo', 'sans-serif'], // Menús y botones
                    }
                }
            }
        }
    </script>
</head>

<body class="bg-gray-100 font-sans antialiased text-gray-900 min-h-screen flex flex-col">

    <!-- Barra de Navegación -->
    <nav class="bg-black shadow-lg">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">

                <!-- Logo y Enlaces de Navegación -->
                <div class="flex items-center space-x-8">
                    <div class="flex-shrink-0 flex items-center">
                        <span class="text-white font-title text-3xl tracking-wider">Quality<span class="text-blue-400">Control</span></span>
                    </div>

                    <div class="hidden md:flex md:space-x-4">
                        <a href="/production_line" class="font-nav font-medium text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm transition">
                            Líneas de Producción
                        </a>
                        <a href="/products" class="font-nav font-medium text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm transition">
                            Productos
                        </a>
                        <a href="/quality_parameters" class="font-nav font-medium text-gray-300 hover:text-white px-3 py-2 rounded-md text-sm transition">
                            Parámetros de calidad
                        </a>
                        
                    </div>
                </div>

                <!-- Avatar y Menú de Usuario -->
                <div class="flex items-center space-x-4">

                    <div class="flex-shrink-0 relative">
                        <button type="button" class="flex text-sm rounded-full focus:outline-none focus:ring-2 focus:ring-blue-400" id="user-menu-button">
                            <div class="h-9 w-9 rounded-full border-2 border-slate-600 bg-slate-200 flex items-center justify-center text-slate-700 font-bold text-xs">
                                {{ strtoupper(substr('Administrador', 0, 2)) }}
                            </div>
                        </button>

                        <div id="user-dropdown" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50 ring-1 ring-black ring-opacity-5">
                            <div class="px-4 py-2 border-b border-gray-100">
                                <p class="text-sm font-semibold text-gray-700 text-truncate">Administrador</p>
                            </div>

                            <a href="#" class="font-nav flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                <svg class="h-4 w-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
                                    <path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                Configuración
                            </a>

                            <hr class="my-1 border-gray-100">

                            <a href="#" class="font-nav flex items-center px-4 py-2 text-sm text-red-600 hover:bg-gray-100">
                                <svg class="h-4 w-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                                </svg>
                                Cerrar sesión
                            </a>
                        </div>
                    </div>

                    <div class="md:hidden">
                        <button id="mobile-menu-button" class="text-gray-300 hover:text-white">
                            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                            </svg>
                        </button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Menú Móvil -->
        <div id="mobile-menu" class="hidden md:hidden bg-black px-2 pt-2 pb-3 space-y-1">
            <a href="/production_line" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Líneas de Producción</a>
            <a href="/products" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Productos</a>
            <a href="/quality_parameters" class="text-gray-300 hover:text-white block px-3 py-2 rounded-md text-base font-medium">Parámetros de Calidad</a>
        </div>
    </nav>

    <!-- Contenido Principal -->
    <main class="max-w-7xl mx-auto py-10 px-4 sm:px-6 lg:px-8 flex-grow w-full">
        <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg p-6">
            @yield('content')
        </div>
    </main>

    <footer class="bg-white border-t border-gray-200 py-6">
        <div class="max-w-7xl mx-auto px-4 text-center text-gray-500 text-sm">
            &copy; 2026 ITCA-GROUP. Todos los derechos reservados.
        </div>
    </footer>

    <!-- Contenedor para Toast Notifications -->
    <div class="fixed top-20 right-5 z-[100] flex flex-col items-end space-y-3 pointer-events-none">

        @if(session('error'))
        <div id="toast-error" class="pointer-events-auto bg-white border-l-4 border-red-500 shadow-2xl rounded-xl p-4 w-80 md:w-96 flex items-center space-x-4 transform transition-all duration-500 animate-slide-in">
            <div class="flex-shrink-0 bg-red-100 p-2 rounded-full">
                <svg class="h-5 w-5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                </svg>
            </div>
            <div class="flex-grow">
                <p class="font-nav text-sm font-bold text-gray-800">Error generado</p>
                <p class="font-sans text-xs text-gray-500">{{ session('error') }}</p>
            </div>
            <button onclick="closeToast('toast-error')" class="text-gray-400 hover:text-gray-600 transition-colors">
                <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
                </svg>
            </button>
        </div>
        @endif

        @if(session('success'))
        <div id="toast-success" class="pointer-events-auto bg-white border-l-4 border-green-500 shadow-2xl rounded-xl p-4 w-80 md:w-96 flex items-center space-x-4 transform transition-all duration-500 animate-slide-in">
            <div class="flex-shrink-0 bg-green-100 p-2 rounded-full">
                <svg class="h-5 w-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
            </div>
            <div class="flex-grow">
                <p class="font-nav text-sm font-bold text-gray-800">Información</p>
                <p class="font-sans text-xs text-gray-500">{{ session('success') }}</p>
            </div>
            <button onclick="closeToast('toast-success')" class="text-gray-400 hover:text-gray-600 transition-colors">
                <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" />
                </svg>
            </button>
        </div>
        @endif
    </div>

    <style>
        @keyframes slide-in {
            from {
                opacity: 0;
                transform: translateX(100%);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .animate-slide-in {
            animation: slide-in 0.4s ease-out;
        }
    </style>

    <!-- Scripts para Interactividad -->
    <script>
        // Referencias para el Menú Móvil
        const btnMobile = document.getElementById('mobile-menu-button');
        const menuMobile = document.getElementById('mobile-menu');

        // Referencias para el Dropdown del Avatar
        const btnAvatar = document.getElementById('user-menu-button');
        const dropdownAvatar = document.getElementById('user-dropdown');

        // Toggle para Móvil
        btnMobile.addEventListener('click', () => {
            menuMobile.classList.toggle('hidden');
        });

        // Toggle para Avatar
        btnAvatar.addEventListener('click', (e) => {
            e.stopPropagation(); // Evita que el clic se propague al documento
            dropdownAvatar.classList.toggle('hidden');
        });

        // Cerrar el dropdown si se hace clic en cualquier otra parte de la pantalla
        document.addEventListener('click', () => {
            if (!dropdownAvatar.classList.contains('hidden')) {
                dropdownAvatar.classList.add('hidden');
            }
        });

        ////////////////////////////// Toast

        function closeToast(id) {
            const toast = document.getElementById(id);
            if (toast) {
                toast.style.opacity = "0";
                toast.style.transform = "translateX(20px)"; // Se desliza hacia la derecha al cerrar
                setTimeout(() => toast.remove(), 500);
            }
        }

        // Auto-cerrado después de 6 segundos
        window.onload = () => {
            ['toast-error', 'toast-success'].forEach(id => {
                if (document.getElementById(id)) {
                    setTimeout(() => closeToast(id), 6000);
                }
            });
        };
    </script>
</body>

</html>