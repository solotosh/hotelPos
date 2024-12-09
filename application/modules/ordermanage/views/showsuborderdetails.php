<thead>
                                                <tr>
                                                 <th><?php echo display('item');?></th>
                                                <th><?php echo display('varient_name');?></th>      
                                                <th><?php echo display('unit_price');?></th>
                                                <th><?php echo display('qty');?></th>
                                                     <th class="text-center"><?php echo display('total_price')?></th> 

                                                </tr>
                                            </thead>
                                            <tbody>
                                           <?php 
                                           	  $totalprice =0;
   											  $totalvat =0;
    										  $itemprice=0;
											  $SD=0;
											  $pvat=0;
											  $multiplletax = array();
                                           foreach($iteminfo as $item){
											   $mypdiscountprice =0;
											   $isoffer=$this->order_model->read('*', 'order_menu', array('row_id' => $item->row_id));	
                                                  if($isoffer->isgroup==1){
													$this->db->select('order_menu.*,item_foods.ProductName,item_foods.productvat,item_foods.OffersRate,variant.variantid,variant.variantName,variant.price');
													$this->db->from('order_menu');
													$this->db->join('item_foods','order_menu.groupmid=item_foods.ProductsID','left');
													$this->db->join('variant','order_menu.groupvarient=variant.variantid','left');
													$this->db->where('order_menu.row_id',$item->row_id);
													$query = $this->db->get();
													$orderinfo=$query->row(); 
													$item->ProductName=$orderinfo->ProductName;
													$item->OffersRate=$orderinfo->OffersRate;
													$item->price=$orderinfo->price;
													$item->variantName=$orderinfo->variantName;
													$item->productvat=$orderinfo->productvat;
												  }
													$itempricesingle=$item->price*$presenttab[$item->row_id];
													if($item->OffersRate>0){
														$mypdiscountprice=$item->OffersRate*$itempricesingle/100;
													}
													$itemvalprice =  ($itempricesingle-$mypdiscountprice);
													if(!empty($taxinfos)){
																	$tx=0;
																	foreach ($taxinfos as $taxinfo) 
																	{
																	  $fildname='tax'.$tx;
																	  if(!empty($item->$fildname)){
																	  $vatcalc=$itemvalprice*$item->$fildname/100;
																	   $multiplletax[$fildname] = $multiplletax[$fildname]+$vatcalc;
																	  }
																	  else{
																		$vatcalc=$itemvalprice*$taxinfo['default_value']/100; 
																		 $multiplletax[$fildname] = $multiplletax[$fildname]+$vatcalc; 
								
																	  }
								
																	$pvat=$pvat+$vatcalc;
																	$vatcalc =0; 
																	$tx++;  
																	}
																	}
													else{
																	  $vatcalc=$itemprice*$item->productvat/100;
																	  $pvat=$pvat+$vatcalc;
																	  } 
													
                                           		 /* 
                                                 for addones*/ 
                                                    $adonsprice =0;
                                                    $addonsname = array();
                                                    $addonsnamestring ='';
                                                	$addn=0;
                                                $isaddones=$this->order_model->read('*', 'check_addones', array('order_menuid' => $item->row_id));
                                    if(!empty($item->add_on_id) && !empty($isaddones) ){
                                        $y=0;
                                        
                                        
                                        $addons = explode(',', $item->add_on_id);
                                        $addonsqty = explode(',',  $item->addonsqty);

                                            foreach($addons as $addonsid){
                                                 $adonsinfo=$this->order_model->read('*', 'add_ons', array('add_on_id' => $addonsid));
                                                    $addonsname[$y] = $adonsinfo->add_on_name;
                                                   
                                                    $adonsinfo=$this->order_model->read('*', 'add_ons', array('add_on_id' => $addonsid));

                                                    $adonsprice=$adonsprice+$adonsinfo->price*$addonsqty[$y];
													$tax=0;
													if(!empty($taxinfos)){
														foreach ($taxinfos as $taxainfo) 
                                          					{
					
																$fildaname='tax'.$tax;
					
															if(!empty($adonsinfo->$fildaname)){
																
															$avatcalc=($adonsinfo->price*$addonsqty[$addn])*$adonsinfo->$fildaname/100;
															$multiplletax[$fildaname] = $multiplletax[$fildaname]+$avatcalc; 
					
															}
															else{
															  $avatcalc=($adonsinfo->price*$addonsqty[$addn])*$taxainfo['default_value']/100; 
															  $multiplletax[$fildaname] = $multiplletax[$fildaname]+$avatcalc;  
															}
					
														  $pvat=$pvat+$avatcalc;
					
																$tax++;
															  }
																		}
													$addn++;
                                                    
                                     $y++;
                                                }
                                                $addonsnamestring = implode($addonsname, ',');

                                         } ?>
                                                <!-- end addones -->
                                           
                                                <tr>
                                                    <td scope="row"><?php echo $item->ProductName.','.$addonsnamestring; ?></td>
                                                    <td><?php echo $item->variantName; ?></td>
                                                    <td>
                                                       <?php echo $item->price;?>
                                                    </td>
                                                    <td><?php echo $presenttab[$item->row_id]; ?></td>
                                                    <td><?php  if($item->OffersRate >0){ 
                                                        $discountt = ($item->price*$item->OffersRate)/100;  
                                                            echo $presenttab[$item->row_id]*$item->price-($presenttab[$item->row_id]*$discountt)+$adonsprice;
                                                            $totalprice = $totalprice+$presenttab[$item->row_id]*$item->price-($presenttab[$item->row_id]*$discountt)+$adonsprice;
                                                             $itemprice = $presenttab[$item->row_id]*$item->price-($presenttab[$item->row_id]*$discountt)+$adonsprice;
                                                            }
                                                    else{
                                                          echo $adonsprice+$presenttab[$item->row_id]*$item->price;
                                                        $totalprice= $totalprice+$adonsprice+$presenttab[$item->row_id]*$item->price;
                                                        $itemprice = $adonsprice+$presenttab[$item->row_id]*$item->price;

                                                    } ?></td>
                                                </tr>
                                            <?php 
											 $msd=$itemprice*$settinginfo->servicecharge/100;
											 $SD=$msd+$SD;
											}
											
											if($settinginfo->service_chargeType==1){
												  $service_chrg_data =$SD;
												}
											else{
												 $count =count($suborder_info);
												  $service_chrg_data = $SDtotal->service_charge/$count;
												}
												if(empty($taxinfos)){
														  if($settinginfo->vat>0 ){
															$calvat=$totalprice*$settinginfo->vat/100;
														  }
														  else{
															$calvat=$pvat;
															}
														  }
														  else{
															$calvat=$pvat;
														  } 
											?>
                                       

                                            </tbody>
                                                      <tfoot>
                                        <tr>
                                        	
                                            <td colspan="1" class="text-right font-14" align="right">&nbsp; <b><?php echo display('total') ?> </b></td>
                                            <td class="text-right"><b><?php echo number_format($totalprice,3);?> </b></td>
                                        </tr>
                                        
                                         
                                        <?php if (empty($taxinfos)) { ?>
                                         <tr>
                                            <td colspan="1" align="right" class="text-right font-14">&nbsp; <b><?php echo display('vat_tax') ?> </b></td>
                                            <td class="text-right"><b><?php echo number_format($calvat,3);?></b></td>
                                        </tr>
                                        <?php } else {
											$i = 0;
											foreach ($taxinfos as $mvat) {
											if ($mvat['is_show'] == 1) {
                        				?>
                                        <tr>
                                            <td colspan="1" align="right" class="text-right font-14">&nbsp; <b><?php echo $mvat['tax_name']; ?></b></td>
                                            <td class="text-right"><b><?php echo $multiplletax['tax' . $i]; ?></b></td>
                                        </tr>
                                        <?php $i++;
											}
											} 
										}
										?>
                                          <tr>
                                            <td colspan="1" align="right" class="text-right font-14">&nbsp; <b><?php echo display('service_chrg') ?> </b></td>
                                            <td class="text-right"><b><?php echo number_format($service_chrg_data,3);?></b></td>
                                        </tr>
                                         <tr>
                                            <td colspan="1" align="right" class="text-right font-14">&nbsp; <b><?php echo display('grand_total') ?> </b></td>
                                            <td class="text-right"><b><?php 
                                            echo number_format($totalprice+$totalvat+$service_chrg_data,3);?></b></td>
                                            <input type="hidden" id="total-sub-<?php echo $suborderid;?>" value="<?php echo $totalprice;?>">
                                            <input type="hidden" id="vat-<?php echo $suborderid;?>" value="<?php echo $calvat;?>">
                                            <input type="hidden" id="service-<?php echo $suborderid;?>" value="<?php echo $service_chrg_data;?>">
                                        </tr>
                                    </tfoot>