<style>
		.table_topper{
			border-top: 1px solid #999;
			border-left: 1px solid #999;
			border-right: 1px solid #999;
		}
		.border{
			border: 1px solid #999;
		}
		.border-bottom{
			border-bottom: 1px solid #999;
		}
		.border-end{
			border-right: 1px solid #999;
		}
		.text-center{
			text-align: center;
		}
		.p-5{
			padding: 5px;
		}
		.d-flex{
			display: -webkit-flex;
			display: -moz-flex;
			display: -ms-flex;
			display: -o-flex;
			display: flex;
		}
		.align-items-center{
			align-items: center;
		}
		.item_title{
			width: calc(100% - 95px);
			text-align: left;
		}
		.item_size{
			width: 60px
		}
		.table_qnt{
			border-collapse: collapse;
		}
		.table_qnt td,
		.table_qnt th{
			border: 1px solid #999;
			padding: 3px;
		}
		.w_25{
			width: 25px;
		}
		.w-25{
			width: 25%;
		}
		.w-50{
			width: 50%;
		}
		.w-100{
			width: 100%;
		}
		.w-auto{
			width: auto
		}

	</style>




		<div class="table_topper text-center">
			<div class="border-bottom">
				<div class="p-5">Token No:</div>
			</div>
			<div class="d-flex border-bottom">
				<div class="w-50 border-end p-5">Name:Demo</div>
				<div class="w-50 p-5">Type: Walk In</div>
			</div>
			<div class="d-flex">
				<div class="w-50 border-end p-5">Table:A3</div>
				<div class="w-50 p-5">Time: 10:30:00</div>
			</div>
		</div>
		<table class="w-100 border table_qnt">
			<tr>
				<td>Q</td>
				<td>Item</td>
				<td>Size</td>
			</tr>
			<tr>
				<td>4</td>
				<td>Chiken Kebab Fry (-souce,-Butter)</td>
				<td>Regular</td>
			</tr>
			<tr>
				<td>4</td>
				<td colspan="2">Chiken Kebab Fry (-souce,-Butter)</td>
			</tr>
		</table>