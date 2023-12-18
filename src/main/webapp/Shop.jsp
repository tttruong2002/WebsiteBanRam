<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Shop Ram</title>
<!-- Roboto Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
<!-- Material Design Bootstrap Ecommerce -->
<link rel="stylesheet"
	href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
<!-- Your custom styles (optional) -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ------>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link href="css/style.css" rel="stylesheet" type="text/css" />

<style>
.view.zoom {
	width: 255px;
	height: 255px;
}

.view.zoom img.img-fluid {
	width: 100%;
	height: 100%;
}
</style>


</head>


<body class="skin-light" onload="loadAmountCart()">

	<!--Main Navigation-->
	<header>

		<jsp:include page="Menu.jsp"></jsp:include>

	</header>
	<!--Main Navigation-->

	<!--Main layout-->
	<main>
		<div class="container" style="margin-top: 100px">

			<!--Grid row-->
			<div class="row mt-5">

				<!--Grid column-->
				<div class="col-md-4 mb-4">

					<!-- Section: Sidebar -->
					<section>

						<!-- Section: Categories -->
						<section>

							<h5>Thương Hiệu</h5>

							<div class="text-muted small text-uppercase mb-5">
								<c:forEach items="${listCC}" var="o">
									<p class="mb-3">
										<a onclick="load(${o.cid})" class="card-link-secondary">${o.cname}</a>
									</p>
								</c:forEach>
							</div>

						</section>
						<!-- Section: Categories -->

						<!-- Section: Filters -->
						<section>

							<h5 class="pt-2 mb-4">Tên</h5>

							<section class="mb-4">

								<div
									class="md-form md-outline mt-0 d-flex justify-content-between align-items-center">
									<input oninput="searchByName(this)" value="${txtS}" name="txt"
										type="text" class="form-control mb-0" placeholder="Search...">
									<a href="#!" class="btn btn-flat btn-md px-3 waves-effect"><i
										class="fas fa-search fa-lg"></i></a>
								</div>

							</section>


							<!-- Section: Capacity -->
							<section class="mb-4">

								<h6 class="font-weight-bold mb-3">Giá</h6>

								<div class="form-check pl-0 mb-3">
									<input onchange="searchByPriceUnder100()" type="radio"
										class="form-check-input" id="under100"
										name="materialExampleRadios"> <label
										class="form-check-label small text-uppercase card-link-secondary"
										for="under100">Dưới $100</label>
								</div>
								<div class="form-check pl-0 mb-3">
									<input onchange="searchByPrice100To200()" type="radio"
										class="form-check-input" id="100200"
										name="materialExampleRadios"> <label
										class="form-check-label small text-uppercase card-link-secondary"
										for="100200">$100 - $200</label>
								</div>
								<div class="form-check pl-0 mb-3">
									<input onchange="searchByPriceAbove200()" type="radio"
										class="form-check-input" id="200above"
										name="materialExampleRadios"> <label
										class="form-check-label small text-uppercase card-link-secondary"
										for="200above">Trên $200</label>
								</div>
								<form>
									<div class="d-flex align-items-center mt-4 pb-1">
										<div class="md-form md-outline my-0">
											<input oninput="searchByPriceMinToMax()" id="priceMin"
												type="text" class="form-control mb-0"> <label
												for="priceMin">$ Min</label>
										</div>
										<p class="px-2 mb-0 text-muted">-</p>
										<div class="md-form md-outline my-0">
											<input oninput="searchByPriceMinToMax()" id="priceMax"
												type="text" class="form-control mb-0"> <label
												for="priceMax">$ Max</label>
										</div>
									</div>
								</form>

							</section>
							<!-- Section: Price -->


							<!-- Section: Capacity -->
							<section class="mb-4">

								<h6 class="font-weight-bold mb-3">Dung lượng</h6>

								<div class="form-check pl-0 mb-3">
									<input onchange="searchByCapacity2GB()" type="radio"
										class="form-check-input" id="2GB" name="materialExampleRadios">
									<label
										class="form-check-label small text-uppercase card-link-secondary"
										for="2GB">2 GB</label>
								</div>

								<div class="form-check pl-0 mb-3">
									<input onchange="searchByCapacity4GB()" type="radio"
										class="form-check-input" id="4GB" name="materialExampleRadios">
									<label
										class="form-check-label small text-uppercase card-link-secondary"
										for="4GB">4 GB</label>
								</div>

								<div class="form-check pl-0 mb-3">
									<input onchange="searchByCapacity8GB()" type="radio"
										class="form-check-input" id="8GB" name="materialExampleRadios">
									<label
										class="form-check-label small text-uppercase card-link-secondary"
										for="8GB">8 GB</label>
								</div>

								<div class="form-check pl-0 mb-3">
									<input onchange="searchByCapacity16GB()" type="radio"
										class="form-check-input" id="16GB"
										name="materialExampleRadios"> <label
										class="form-check-label small text-uppercase card-link-secondary"
										for="16GB">16 GB</label>
								</div>
								<div class="form-check pl-0 mb-3">
									<input onchange="searchByCapacity32GB()" type="radio"
										class="form-check-input" id="32GB"
										name="materialExampleRadios"> <label
										class="form-check-label small text-uppercase card-link-secondary"
										for="32GB">32 GB</label>
								</div>


							</section>
							<!-- Section: Capacity -->


						</section>
						<!-- Section: Filters -->

					</section>
					<!-- Section: Sidebar -->

				</div>
				<!--Grid column-->

				<!--Grid column-->
				<div class="col-md-8 mb-4">

					<!-- Section: Block Content -->
					<section class="mb-3">

						<div class="row d-flex justify-content-around align-items-center">
							<div class="col-12 col-md-3 text-center text-md-left">

								<!-- Thử Xóa
								<a href="#!" class="text-reset"><i
									class="fas fa-th-list fa-lg mr-1"></i></a href="#!"> <a href="#!"
									class="text-reset"><i class="fas fa-th-large fa-lg"></i> </a href="#!"> 
									Thử Xóa-->

							</div>
							<div class="col-12 col-md-5">
								<div class="d-flex flex-wrap">
									<div class="select-outline position-relative w-100">
										<select class="mdb-select md-outline md-form"
											searchable="Search here..">
											<option value="" disabled selected>Choose category</option>
											<option value="1">Category 1</option>
											<option value="2">Category 2</option>
											<option value="3">Category 3</option>
											<option value="4">Category 4</option>
											<option value="5">Category 5</option>
										</select> <label>Tất cả sản phẩm</label>
										<button class="btn-save btn btn-primary btn-sm mt-2">Save</button>
									</div>
								</div>
							</div>
							<div class="col-12 col-md-4 text-center">
								<nav aria-label="Page navigation example">
									<ul
										class="pagination pagination-circle justify-content-center float-md-right mb-0">
										<c:if test="${tag != 1}">
											<li class="page-item"><a href="shop?index=${tag-1 }"
												class="page-link"><i class="fas fa-chevron-left"></i></a></li>
										</c:if>
										<c:forEach begin="1" end="${endPage }" var="i">
											<li class="${tag==i?"page-itemactive":"page-item" }"><a
												href="shop?index=${i }" class="page-link">${i }</a></li>
										</c:forEach>
										<c:if test="${tag != endPage}">
											<li class="page-item"><a href="shop?index=${tag+1 }"
												class="page-link"><i class="fas fa-chevron-right"></i></a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>

					</section>
					<!-- Section: Block Content -->

					<!--Section: Block Content-->
					<section>

						<!-- Grid row -->
						<div class="row" id="content">


							<c:forEach items="${listP}" var="o">
								<!-- Grid column -->
								<div class="col-md-4 mb-5">

									<!-- Card -->
									<div class="">

										<div class="view zoom overlay rounded z-depth-2">
											<img class="img-fluid w-100" src="${o.image }" alt="Sample">
											<a href="detail?pid=${o.id}">
												<div class="mask">
													<img class="img-fluid w-100" src="${o.image }">
													<div class="mask rgba-black-slight"></div>
												</div>
											</a>
										</div>

										<div class="text-center pt-4">

											<h5>${o.name }</h5>
											<p>
												<span class="mr-1"><strong>${o.price }$</strong></span>
											</p>

										</div>

									</div>
									<!-- Card -->

								</div>
								<!-- Grid column -->
							</c:forEach>

						</div>
						<!-- Grid row -->
					</section>
					<!--Section: Block Content-->

				</div>
	</main>
	<!--Main layout-->

	<!-- Footer -->


	<jsp:include page="Footer.jsp"></jsp:include>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Footer -->



	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
	<!-- MDB Ecommerce JavaScript -->
	<script type="text/javascript"
		src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
	<script>
    $('#multi').mdbRange({
      single: {
        active: true,
        multi: {
          active: true,
          rangeLength: 1
        },
      }
    });

    $(document).ready(function () {
      $('.mdb-select').materialSelect();
      $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
        $(this).closest('.select-outline').find('label').toggleClass('active');
        $(this).closest('.select-outline').find('.caret').toggleClass('active');
      });
    });
    function load(cateid){
    	 $.ajax({
             url: "/WebsiteBanRam/categoryShop",
             type: "get", //send it through get method
             data: {
                 cid: cateid
             },
             success: function (responseData) {
                 document.getElementById("content").innerHTML = responseData;
             }
         });
    }  
    function searchByName(param){
        var txtSearch = param.value;
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxShop",
            type: "get", //send it through get method
            data: {
                txt: txtSearch
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByPriceMinToMax(){
        var numMin = document.getElementById("priceMin").value;
        var numMax = document.getElementById("priceMax").value;
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxPriceMinToMax",
            type: "get", //send it through get method
            data: {
                priceMin: numMin,
                priceMax: numMax
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByPriceUnder100(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxPriceUnder100Shop",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByPrice100To200(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxPrice100To200Shop",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByPriceAbove200(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxPriceAbove200Shop",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    
    function searchByCapacity2GB(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxCapacity2GB",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByCapacity4GB(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxCapacity4GB",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByCapacity8GB(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxCapacity8GB",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByCapacity16GB(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxCapacity16GB",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByCapacity32GB(){
        $.ajax({
            url: "/WebsiteBanRam/searchAjaxCapacity32GB",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    
    function loadAmountCart(){
    	 $.ajax({
             url: "/WebsiteBanRam/loadAllAmountCart",
             type: "get", //send it through get method
             data: {
                 
             },
             success: function (responseData) {
                 document.getElementById("amountCart").innerHTML = responseData;
             }
         });
    }         
  </script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript" src="js/script.js"></script>
</body>

</html>