<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <div class="d-flex justify-content-between align-items-center my-4">
        <a href="/article" class="btn btn-outline-primary">
            <i class="fa fa-home"></i> Return to Home
        </a>
    </div>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .search-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .hotel-card {
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .hotel-card:hover {
            transform: translateY(-5px);
        }
        .hotel-card .card-title {
            color: #2c3e50;
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
        .hotel-card .card-text {
            color: #34495e;
        }
        .hotel-card .list-group-item {
            border: none;
            padding: 0.5rem 0;
        }
        .hotel-card .amenities-list, .hotel-card .offers-list {
            margin-top: 1rem;
        }
        .hotel-card .price {
            color: #e74c3c;
            font-weight: bold;
            font-size: 1.2rem;
        }
        .pagination {
            margin-top: 20px;
        }
        .city-selector {
            display: flex;
            gap: 10px;
        }
        .city-selector select {
            flex: 1;
        }
        .search-results {
            margin-top: 2rem;
        }
        .search-results h2 {
            color: #2c3e50;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #3498db;
        }
        .room-type-section {
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
        }
        .room-category {
            margin-top: 5px;
        }
        .price-section {
            background-color: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
        }
        .price-label {
            color: #666;
        }
        .price-value {
            font-size: 1.2em;
            font-weight: bold;
            color: #e74c3c;
        }
        .description-section {
            margin-top: 15px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
        }
        .description-header {
            color: #2c3e50;
            font-size: 1.1em;
        }
        .description-content {
            color: #34495e;
            font-size: 0.95em;
            line-height: 1.5;
        }
        .list-group-item {
            border: 1px solid #ddd;
            margin-bottom: 10px;
            border-radius: 5px;
        }
        .hotel-info {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #333;
            font-size: 0.95rem;
        }
        .basic-info {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border: 1px solid #e9ecef;
        }
        .basic-info p {
            margin-bottom: 8px;
        }
        .room-type-section {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 15px;
            border: 1px solid #e9ecef;
        }
        .room-type-section h6 {
            margin-bottom: 10px;
            color: #2c3e50;
        }
        .room-category {
            margin-top: 8px;
        }
        .room-category .badge {
            padding: 6px 10px;
            background-color: #3498db;
        }
        .price-section {
            background-color: #fff;
            padding: 12px 15px;
            border-radius: 5px;
            margin: 10px 0;
            border: 1px solid #e9ecef;
        }
        .price-label {
            color: #666;
        }
        .price-value {
            font-weight: 600;
            color: #e74c3c;
        }
        .description-section {
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
            border: 1px solid #e9ecef;
        }
        .description-header {
            color: #2c3e50;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .description-content {
            color: #34495e;
            line-height: 1.6;
        }
        .list-group-item {
            border: 1px solid #e9ecef;
            margin-bottom: 15px;
            border-radius: 5px;
            padding: 15px;
            background-color: #fff;
        }
        .fa {
            margin-right: 5px;
            color: #3498db;
        }
        .alert {
            background-color: #fff;
            border: 1px solid #e9ecef;
            padding: 15px;
            border-radius: 5px;
        }
        .offer-container {
            border: 1px solid #e9ecef;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 15px;
            background-color: #fff;
        }
        .offer-section {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .offer-section h6 {
            color: #2c3e50;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 120px;
        }
        .offer-section .content {
            flex: 1;
        }
        .room-category {
            display: inline-block;
            margin-left: 10px;
        }
        .room-category .badge {
            padding: 6px 10px;
            background-color: #3498db;
        }
        .price-value {
            font-weight: bold;
            color: #e74c3c;
        }
        /* 天气显示栏样式 */
        .weather-container {
            background: #f8f8f8;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .weather-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 8px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .weather-title .fa-sync-alt {
            font-size: 14px;
            cursor: pointer;
            transition: transform 0.5s;
        }
        
        .weather-title .fa-sync-alt:hover {
            transform: rotate(180deg);
        }
        
        .weather-item {
            padding: 10px;
            margin-bottom: 10px;
            background: #fff;
            border-radius: 4px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        
        .city-name {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
            color: #333;
        }
        
        .weather-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        
        .weather-text {
            color: #555;
        }
        
        .temperature {
            font-weight: bold;
            color: #e74c3c;
        }
        
        .observation-time {
            font-size: 12px;
            color: #999;
            text-align: right;
        }
        
        .loading-weather {
            text-align: center;
            padding: 15px;
            color: #666;
        }
        
        /* 滚动区域样式 */
        .weather-scroll-container {
            max-height: 500px;
            overflow-y: auto;
            padding-right: 5px;
            scrollbar-width: thin;
        }
        
        /* 自定义滚动条样式 */
        .weather-scroll-container::-webkit-scrollbar {
            width: 6px;
        }
        
        .weather-scroll-container::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }
        
        .weather-scroll-container::-webkit-scrollbar-thumb {
            background: #3498db;
            border-radius: 10px;
        }
        
        .weather-scroll-container::-webkit-scrollbar-thumb:hover {
            background: #2980b9;
        }
        
        /* 天气控制面板 */
        .weather-controls {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .weather-filter {
            display: flex;
            align-items: center;
        }
        
        .weather-filter select {
            padding: 4px 8px;
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-left: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="my-4">Hotel Search</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <div class="row">
        <div class="col-md-8">
            <div class="search-form">
                <form action="/hotel/search" method="get" id="searchForm">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>City Code</label>
                                <div class="city-selector">
                                    <select class="form-control" id="country" name="country">
                                        <option value="">Select Country</option>
                                        <option value="FR">France</option>
                                        <option value="US">United States</option>
                                        <option value="GB">United Kingdom</option>
                                        <option value="IT">Italy</option>
                                        <option value="ES">Spain</option>
                                        <option value="DE">Germany</option>
                                        <option value="JP">Japan</option>
                                        <option value="CN">China</option>
                                        <option value="AU">Australia</option>
                                        <option value="CA">Canada</option>
                                    </select>
                                    <select class="form-control" id="cityCode" name="cityCode">
                                        <option value="">Select City</option>
                                        <!-- Cities will be populated dynamically -->
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="radius">Radius (KM)</label>
                                <input type="number" class="form-control" id="radius" name="radius" value="${radius}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="rating">Rating</label>
                                <select class="form-control" id="rating" name="rating">
                                    <c:forEach begin="1" end="5" var="i">
                                        <option value="${i}" ${rating == i ? 'selected' : ''}>${i} Star</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="adults">Adults</label>
                                <input type="number" class="form-control" id="adults" name="adults" value="${adults}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="checkInDate">Check-in Date</label>
                                <input type="text" class="form-control datepicker" id="checkInDate" name="checkInDate" value="${checkInDate}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="checkOutDate">Check-out Date</label>
                                <input type="text" class="form-control datepicker" id="checkOutDate" name="checkOutDate" value="${checkOutDate}">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="hotels">Number of Hotels Every Page</label>
                                <input type="number" class="form-control" id="hotels" name="hotels" value="${hotels}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary btn-block">Search</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="search-results">
                <h2>Search Results</h2>
                <div class="row">
                    <c:forEach items="${hotelList}" var="hotel">
                        <div class="col-md-6">
                            <div class="card hotel-card">
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <a href="#" class="hotel-link" 
                                           data-hotel-id="${hotel.hotelId}"
                                           data-check-in="${checkInDate}"
                                           data-check-out="${checkOutDate}"
                                           data-adults="${adults}">
                                            ${hotel.name}
                                        </a>
                                    </h5>
                                    <div class="hotel-details" style="display: none;">
                                        <!-- Details will be loaded here -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <nav aria-label="Page navigation" class="pagination">
                <ul class="pagination justify-content-center">
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="/hotel/search?cityCode=${cityCode}&radius=${radius}&rating=${rating}&adults=${adults}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&hotels=${hotels}&page=${currentPage-1}">Previous</a>
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="/hotel/search?cityCode=${cityCode}&radius=${radius}&rating=${rating}&adults=${adults}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&hotels=${hotels}&page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="/hotel/search?cityCode=${cityCode}&radius=${radius}&rating=${rating}&adults=${adults}&checkInDate=${checkInDate}&checkOutDate=${checkOutDate}&hotels=${hotels}&page=${currentPage+1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>
        
        <!-- 添加天气显示栏 -->
        <div class="col-md-4">
            <div id="weather-widget" class="weather-container">
                <h3 class="weather-title">
                    <span><i class="fa fa-cloud"></i> 实时天气</span>
                    <i class="fa fa-sync-alt" id="refresh-weather" title="刷新天气数据"></i>
                </h3>
                <div class="weather-controls">
                    <div class="weather-filter">
                        <label for="weather-sort">排序:</label>
                        <select id="weather-sort" class="form-control-sm">
                            <option value="name">按城市名称</option>
                            <option value="temp-asc">按温度低-高</option>
                            <option value="temp-desc" selected>按温度高-低</option>
                        </select>
                    </div>
                    <span id="weather-count">0/50 城市</span>
                </div>
                <div id="weather-container">
                    <div class="loading-weather">
                        <i class="fa fa-spinner fa-spin"></i> 加载天气信息中...
                    </div>
                    <div class="weather-scroll-container">
                        <div id="weather-content" style="display:none;">
                            <!-- 天气内容将通过AJAX动态加载 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
    $(document).ready(function() {
        // Initialize datepicker
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd',
            autoclose: true,
            todayHighlight: true,
            startDate: new Date()
        });

        // Set minimum date for check-out date
        $('#checkInDate').on('changeDate', function() {
            $('#checkOutDate').datepicker('setStartDate', $(this).datepicker('getDate'));
        });

        // Form validation
        $('#searchForm').on('submit', function(e) {
            var cityCode = $('#cityCode').val();
            var radius = $('#radius').val();
            var rating = $('#rating').val();
            var adults = $('#adults').val();
            var checkInDate = $('#checkInDate').val();
            var checkOutDate = $('#checkOutDate').val();
            var errorMessage = '';

            if (!cityCode || cityCode.trim() === '') {
                errorMessage = 'City code cannot be empty';
            } else if (!radius || radius <= 0) {
                errorMessage = 'Radius must be greater than 0';
            } else if (rating < 1 || rating > 5) {
                errorMessage = 'Rating must be between 1 and 5';
            } else if (!adults || adults <= 0) {
                errorMessage = 'Number of adults must be greater than 0';
            } else if (!checkInDate || !checkOutDate) {
                errorMessage = 'Check-in and check-out dates are required';
            } else if (checkInDate === checkOutDate) {
                errorMessage = 'Check-out date must be after check-in date';
            }

            if (errorMessage) {
                e.preventDefault();
                alert(errorMessage);
                return false;
            }
        });

        // City code mapping
        var cityMap = {
            'FR': [
                { code: 'PAR', name: 'Paris' },
                { code: 'NCE', name: 'Nice' },
                { code: 'LYS', name: 'Lyon' },
                { code: 'MRS', name: 'Marseille' },
                { code: 'BOD', name: 'Bordeaux' },
                { code: 'TLS', name: 'Toulouse' },
                { code: 'NTE', name: 'Nantes' },
                { code: 'LIL', name: 'Lille' },
                { code: 'STR', name: 'Strasbourg' }
            ],
            'US': [
                { code: 'NYC', name: 'New York' },
                { code: 'LAX', name: 'Los Angeles' },
                { code: 'CHI', name: 'Chicago' },
                { code: 'MIA', name: 'Miami' },
                { code: 'SFO', name: 'San Francisco' },
                { code: 'LAS', name: 'Las Vegas' },
                { code: 'BOS', name: 'Boston' },
                { code: 'SEA', name: 'Seattle' },
                { code: 'DFW', name: 'Dallas' },
                { code: 'DEN', name: 'Denver' }
            ],
            'GB': [
                { code: 'LON', name: 'London' },
                { code: 'MAN', name: 'Manchester' },
                { code: 'EDI', name: 'Edinburgh' },
                { code: 'GLA', name: 'Glasgow' },
                { code: 'BRS', name: 'Bristol' },
                { code: 'BHX', name: 'Birmingham' },
                { code: 'LPL', name: 'Liverpool' },
                { code: 'NCL', name: 'Newcastle' },
                { code: 'BFS', name: 'Belfast' }
            ],
            'IT': [
                { code: 'ROM', name: 'Rome' },
                { code: 'MIL', name: 'Milan' },
                { code: 'FLR', name: 'Florence' },
                { code: 'VCE', name: 'Venice' },
                { code: 'NAP', name: 'Naples' },
                { code: 'BLQ', name: 'Bologna' },
                { code: 'TRN', name: 'Turin' },
                { code: 'PMO', name: 'Palermo' },
                { code: 'GOA', name: 'Genoa' }
            ],
            'ES': [
                { code: 'MAD', name: 'Madrid' },
                { code: 'BCN', name: 'Barcelona' },
                { code: 'AGP', name: 'Malaga' },
                { code: 'PMI', name: 'Palma de Mallorca' },
                { code: 'VLC', name: 'Valencia' },
                { code: 'SVQ', name: 'Seville' },
                { code: 'BIO', name: 'Bilbao' },
                { code: 'GRX', name: 'Granada' },
                { code: 'ALC', name: 'Alicante' }
            ],
            'DE': [
                { code: 'BER', name: 'Berlin' },
                { code: 'MUC', name: 'Munich' },
                { code: 'FRA', name: 'Frankfurt' },
                { code: 'HAM', name: 'Hamburg' },
                { code: 'CGN', name: 'Cologne' },
                { code: 'STR', name: 'Stuttgart' },
                { code: 'DUS', name: 'Düsseldorf' },
                { code: 'LEJ', name: 'Leipzig' },
                { code: 'DRS', name: 'Dresden' }
            ],
            'JP': [
                { code: 'TYO', name: 'Tokyo' },
                { code: 'OSA', name: 'Osaka' },
                { code: 'KYO', name: 'Kyoto' },
                { code: 'FUK', name: 'Fukuoka' },
                { code: 'NGO', name: 'Nagoya' },
                { code: 'SPK', name: 'Sapporo' },
                { code: 'HIJ', name: 'Hiroshima' },
                { code: 'NRT', name: 'Narita' },
                { code: 'KIX', name: 'Kansai' }
            ],
            'CN': [
                { code: 'PEK', name: 'Beijing' },
                { code: 'SHA', name: 'Shanghai' },
                { code: 'CAN', name: 'Guangzhou' },
                { code: 'SZX', name: 'Shenzhen' },
                { code: 'CTU', name: 'Chengdu' },
                { code: 'HGH', name: 'Hangzhou' },
                { code: 'XIY', name: 'Xi\'an' },
                { code: 'CKG', name: 'Chongqing' },
                { code: 'NKG', name: 'Nanjing' }
            ],
            'AU': [
                { code: 'SYD', name: 'Sydney' },
                { code: 'MEL', name: 'Melbourne' },
                { code: 'BNE', name: 'Brisbane' },
                { code: 'PER', name: 'Perth' },
                { code: 'ADL', name: 'Adelaide' },
                { code: 'CBR', name: 'Canberra' },
                { code: 'HBA', name: 'Hobart' },
                { code: 'DRW', name: 'Darwin' },
                { code: 'OOL', name: 'Gold Coast' }
            ],
            'CA': [
                { code: 'YTO', name: 'Toronto' },
                { code: 'YUL', name: 'Montreal' },
                { code: 'YVR', name: 'Vancouver' },
                { code: 'YYC', name: 'Calgary' },
                { code: 'YEG', name: 'Edmonton' },
                { code: 'YOW', name: 'Ottawa' },
                { code: 'YHZ', name: 'Halifax' },
                { code: 'YYZ', name: 'Toronto Pearson' },
                { code: 'YQB', name: 'Quebec City' }
            ]
        };

        // Set initial values if they exist
        var initialCountry = '${country}';
        var initialCityCode = '${cityCode}';
        
        // Load saved selections from localStorage
        var savedCountry = localStorage.getItem('selectedCountry');
        var savedCity = localStorage.getItem('selectedCity');
        
        // Use saved values if no initial values are set
        if (!initialCountry && savedCountry) {
            initialCountry = savedCountry;
        }
        if (!initialCityCode && savedCity) {
            initialCityCode = savedCity;
        }
        
        if (initialCountry) {
            $('#country').val(initialCountry).trigger('change');
            if (initialCityCode) {
                $('#cityCode').val(initialCityCode);
            }
        }

        // Save selections to localStorage when they change
        $('#country').on('change', function() {
            var country = $(this).val();
            localStorage.setItem('selectedCountry', country);
            
            var $citySelect = $('#cityCode');
            $citySelect.empty();
            $citySelect.append('<option value="">Select City</option>');
            
            if (country && cityMap[country]) {
                $.each(cityMap[country], function(index, city) {
                    $citySelect.append($('<option></option>')
                        .attr('value', city.code)
                        .text(city.name));
                });
                
                // Restore saved city selection if it exists
                var savedCity = localStorage.getItem('selectedCity');
                if (savedCity) {
                    $citySelect.val(savedCity);
                }
            }
        });

        $('#cityCode').on('change', function() {
            localStorage.setItem('selectedCity', $(this).val());
        });

        // Trigger change event on page load if country is selected
        if ($('#country').val()) {
            $('#country').trigger('change');
        }

        // Handle hotel link clicks
        $('.hotel-link').on('click', function(e) {
            e.preventDefault();
            var $link = $(this);
            var $details = $link.closest('.card-body').find('.hotel-details');
            
            if ($details.is(':visible')) {
                $details.slideUp();
                return;
            }

            var hotelId = $link.data('hotel-id');
            var checkInDate = $link.data('check-in');
            var checkOutDate = $link.data('check-out');
            var adults = $link.data('adults');

            // Show loading state
            $details.html('<div class="text-center"><i class="fa fa-spinner fa-spin"></i> Loading details...</div>').slideDown();

            $.ajax({
                url: '/hotel/details',
                method: 'GET',
                data: {
                    hotelId: hotelId,
                    checkInDate: checkInDate,
                    checkOutDate: checkOutDate,
                    adults: adults
                },
                success: function(result) {
                    var detailsHtml = '<div class="hotel-info">';

                    if (result && result.offers && result.offers.length > 0) {
                        detailsHtml += '<div class="offers-list">';
                        detailsHtml += '<h6 class="mb-3" style="color: #2c3e50;">Available Room Offers</h6>';
                        detailsHtml += '<ul class="list-group">';
                        
                        result.offers.forEach(function(offer) {
                            detailsHtml += '<li class="offer-container">';
                            
                            // Room Type Section
                            detailsHtml += '<div class="offer-section">';
                            detailsHtml += '<h6>';
                            detailsHtml += '<i class="fa fa-bed"></i>';
                            detailsHtml += 'Room Type';
                            detailsHtml += '</h6>';
                            detailsHtml += '<div class="content">';
                            detailsHtml += offer.room.type;
                            if (offer.room.typeEstimated && offer.room.typeEstimated.category) {
                                detailsHtml += '<span class="room-category">';
                                detailsHtml += '<span class="badge badge-info">';
                                detailsHtml += '<i class="fa fa-star"></i>';
                                detailsHtml += offer.room.typeEstimated.category;
                                detailsHtml += '</span>';
                                detailsHtml += '</span>';
                            }
                            detailsHtml += '</div>';
                            detailsHtml += '</div>';

                            // Price Section
                            detailsHtml += '<div class="offer-section">';
                            detailsHtml += '<h6>';
                            detailsHtml += '<i class="fa fa-money"></i>';
                            detailsHtml += 'Total Price';
                            detailsHtml += '</h6>';
                            detailsHtml += '<div class="content">';
                            detailsHtml += '<span class="price-value">';
                            detailsHtml += '<span class="currency">' + offer.price.currency + '</span> ';
                            detailsHtml += '<span class="amount">' + offer.price.total + '</span>';
                            detailsHtml += '</span>';
                            detailsHtml += '</div>';
                            detailsHtml += '</div>';

                            // Description Section
                            if (offer.description && offer.description.text) {
                                detailsHtml += '<div class="offer-section">';
                                detailsHtml += '<h6>';
                                detailsHtml += '<i class="fa fa-info-circle"></i>';
                                detailsHtml += 'Room Details';
                                detailsHtml += '</h6>';
                                detailsHtml += '<div class="content">';
                                detailsHtml += '<p>' + offer.description.text + '</p>';
                                detailsHtml += '</div>';
                                detailsHtml += '</div>';
                            }

                            detailsHtml += '</li>';
                        });
                        
                        detailsHtml += '</ul></div>';
                    } else {
                        detailsHtml += '<div class="alert alert-info">';
                        detailsHtml += '<i class="fa fa-info-circle"></i>';
                        detailsHtml += '<span style="margin-left: 8px;">No offers available for the selected dates.</span>';
                        detailsHtml += '<br><small style="margin-left: 25px;">Please try different dates or check back later.</small>';
                        detailsHtml += '</div>';
                    }
                    
                    detailsHtml += '</div>';
                    $details.html(detailsHtml);
                },
                error: function() {
                    var errorHtml = '<div class="alert alert-danger">';
                    errorHtml += '<i class="fa fa-exclamation-circle"></i> Error loading hotel details.';
                    errorHtml += '<br><small>Please try again later or contact support if the problem persists.</small>';
                    errorHtml += '</div>';
                    $details.html(errorHtml);
                }
            });
        });

        // 加载天气信息
        loadWeatherData();
        
        // 每5分钟刷新一次天气数据
        setInterval(loadWeatherData, 300000);
    });
    
    function loadWeatherData() {
        $('.loading-weather').show();
        $('#weather-content').hide();
        
        $.ajax({
            url: '/weather/top-cities',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                if (data && data.length > 0) {
                    // 保存天气数据到全局变量以便排序使用
                    window.weatherData = data;
                    
                    // 更新计数
                    $('#weather-count').text(data.length + '/50 城市');
                    
                    // 根据当前选择的排序方式显示数据
                    sortAndDisplayWeather();
                } else {
                    $('#weather-content').html('<p>暂无天气数据</p>');
                }
                $('#weather-content').show();
                $('.loading-weather').hide();
            },
            error: function(xhr, status, error) {
                $('#weather-content').html('<p>获取天气数据失败</p>');
                $('#weather-content').show();
                $('.loading-weather').hide();
                console.error("Weather data error:", error);
            }
        });
    }
    
    function sortAndDisplayWeather() {
        if (!window.weatherData || !window.weatherData.length) return;
        
        var sortType = $('#weather-sort').val();
        var data = [...window.weatherData]; // 复制数据以避免修改原始数据
        
        // 根据选择的方式排序
        if (sortType === 'name') {
            // 按城市名称排序
            data.sort(function(a, b) {
                return (a.localizedName || '').localeCompare(b.localizedName || '');
            });
        } else if (sortType === 'temp-asc') {
            // 按温度从低到高排序
            data.sort(function(a, b) {
                var tempA = a.temperature && a.temperature.metric ? a.temperature.metric.value : 999;
                var tempB = b.temperature && b.temperature.metric ? b.temperature.metric.value : 999;
                return tempA - tempB;
            });
        } else if (sortType === 'temp-desc') {
            // 按温度从高到低排序
            data.sort(function(a, b) {
                var tempA = a.temperature && a.temperature.metric ? a.temperature.metric.value : -999;
                var tempB = b.temperature && b.temperature.metric ? b.temperature.metric.value : -999;
                return tempB - tempA;
            });
        }
        
        // 显示排序后的数据
        displayWeatherData(data);
    }
    
    function displayWeatherData(weatherData) {
        var html = '<div class="weather-list">';
        
        // 显示所有城市的天气
        for (var i = 0; i < weatherData.length; i++) {
            var city = weatherData[i];
            var tempC = city.temperature && city.temperature.metric ? city.temperature.metric.value.toFixed(1) : 'N/A';
            var tempF = city.temperature && city.temperature.imperial ? city.temperature.imperial.value.toFixed(1) : 'N/A';
            
            html += '<div class="weather-item">';
            html += '<div class="city-name">' + (city.localizedName || 'Unknown City') + '</div>';
            html += '<div class="weather-info">';
            html += '<span class="weather-text">' + (city.weatherText || 'N/A') + '</span>';
            html += '<span class="temperature">' + tempC + '°C / ' + tempF + '°F</span>';
            html += '</div>';
            
            // 添加日期时间
            var dateTime = city.localObservationDateTime ? new Date(city.localObservationDateTime) : new Date();
            var formattedDate = dateTime.toLocaleString('zh-CN', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit'
            });
            
            html += '<div class="observation-time">观测时间: ' + formattedDate + '</div>';
            html += '</div>';
        }
        
        html += '</div>';
        $('#weather-content').html(html);
    }
    
    $(document).ready(function() {
        // 初始化天气数据
        loadWeatherData();
        
        // 每5分钟刷新一次天气数据
        setInterval(loadWeatherData, 300000);
        
        // 排序选择变化时重新排序并显示
        $('#weather-sort').on('change', function() {
            sortAndDisplayWeather();
        });
        
        // 刷新按钮点击事件
        $('#refresh-weather').on('click', function() {
            $(this).addClass('fa-spin');
            loadWeatherData();
            setTimeout(function() {
                $('#refresh-weather').removeClass('fa-spin');
            }, 1000);
        });
    });
</script>
</body>
</html> 