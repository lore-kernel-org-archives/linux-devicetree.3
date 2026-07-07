Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA69314A65
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 23:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468102; cv=none; b=PZZIE6dFMqsyjLpER2TSJNRqrUSYqKiAPAl1D8eAAp7WHBMGrl4+m/eSQCQMFvwWUO4ulNMwyl62OsxncsXmLgcvojn0jk0Kxq8xLma49C80hOH17gRRmzd3T6YkL5hPasYgzDOijMKyQINDPj9dyIT9qN76vw1NWQ1CZdTBbRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468102; c=relaxed/simple;
	bh=Bd+IWsqKnV9mCYORxl3Suup9InkBoPropt9ylUnGm0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUntxabZCNXYeMFGVLVBJnxklxzdo5c0d29mbfDol7dyvK0C7K80bC/jr9BjnKof+/mKSkYPCXzZ7M7W+vm/oluVgbKHnJJ4ixLOp/ZdvHLzrb/PJnd/Fc8AXK3IbNw9Jw74e8IDUgNbi6mp6IXkNdcqSA39Scw/A2udADerBbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhUp9gIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt11S98J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhUp9gIJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dt11S98J"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Md3Vj945057
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 23:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=; b=LhUp9gIJtrVmm787
	eSfxk+GWeUoG35Nf2zt/K1ZQH6wQpByNCriuOysIujPU859zpaeONYeRTCbjGwX4
	CCB5G+Nv6dfhhsBshiA6yFOC61nOiUk/PZet7FUwm0OQxilpWmclV2xTFsezatST
	81Mv6V32f0jusHOtD5pG7OSBKbwbU1dvLpjO8vE3fIJ+qEMq6N+cV8kPhxB1pvlY
	2Gkk0d6eYxrjXapOQrhywuZKwtfBjIJ0t/9Sc0sheX4eK0cZGckb1bWNrqrGegNT
	+h2aXN1FSyA4NHY03i4w+icioV0a+kLjULbC3VvPcIZZgYokRM05i0ffDuRDiwov
	fFxppw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v9acaaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 23:48:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37d4eede8ccso85531a91.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783468097; x=1784072897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=dt11S98JUNdz3K93s0gGhjbRMLZM1z4flM1doModrttw33foqexFc9ZeI0OGqwPAeO
         qKoC0TD9LKFVCfowxbfROa+0wzuEVxBPeaAUjb0iZKInqo+19tEj4ZH5Ho36Fp28TL3l
         dQ5y+Q5qCJbaJg60zCj4TfhbHypL3o4yYp+v0NEZ/zbw9zaR3rWWI1z+70fxBTa+qZri
         GxbDOD+THrzAqekUbzH1cOmpVDhlRP5NHHWB7bGjXFzeHQPZItghu/lgB8C7SY4f7sp6
         yD1I/aom80dEgiTLc994kj0weMAT8ExSv1zLBtkbonzifQtgkcF7LGwuMhZAW2obrs0D
         hyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783468097; x=1784072897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=XUOtq27LBcaAXdcO7ERCiRn5pQOK6rzsPmzbOCmuOAn7xGTKrW/HAnHuAgw61PrLDy
         OckDXFRwGz6vmbomjezdwpDMvBfgZUFWfpvWaqaVrUP3D3sfoXeSCcDtKB9tAKnGEccU
         B5+zMlUE/vBKsJbN0nI0Yxdv5MivD7xQvD6GIT9levX0SIr4qVzCrZsJVIg+syYm1WGm
         jABu/5Rmwyji6tJL2XRUV/9MVYZRfNstVM45NsGukL8hs5d5e+t4wOVXtN2VpkaIT3Ga
         sD9iIxFWreGEfGR39nej/pDYT7d+/+dTUFKQdGsO2prB8ZuBtrBMTbhMBtf0tR85yVa+
         Lgaw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0eSJSBCiDKiv7gbamnWYObCcylzw1HXGVfg4SSF9X6NsTQ92UCGV+CM4byanDS+l6ZTLi5+hlszsZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkfFB75700eyymS17oCEyfPULXAxTNuWdD7WpIzsgiDYTt4Ac
	N809sJhQbiyoFamquWMI0SfCE2x6dgWxK98XYw0yV9KGQKqaSPDNg4fGg8k7C7U6PWRGJue+17e
	JV7VbJ6F7lhWXUr0EjZ/WDK6IbfIxqKgL9DRZRJ4DvSBZpcgeBHH+A5/4Jg0e3BhI
X-Gm-Gg: AfdE7clDvCeyLNT06dq/iYKFTwgzC9JmucbSACQI2ak8BFTldEfD0E5EX8jg6V3mvo3
	NcJupt/MDBnzFv+52/FXYC0ln/lfBJEeU4XA457Xr5cpJJwCXNtdo5De1xRAmXktUWdY24ZE6IL
	rl9Ha6mRtshfmb9n7LVjMzOtZI+RLs+YIlo/9Kptu6PcAKUEPhNyEDe497rjLhQVb6zcr0Giz13
	wcVU9NnM4ZdcRvzL2zv9ilC1uB0AATNusXt7UMDMQSK7I1rqgbHI2UVek/Oq7ErSEG2Chq2QSp1
	8+ExToG+64T1/1u34Qc53IdIV8bsGJuP5Zo2SwxrXc/Q0od3LTAbha19nZtYzWcW8Us8w3gXst5
	ux1Q9c+lwakS+/Dxsn69BDVQw/QJgjxuuYic28+1eqTSteQkdIgcnbDpEVU398wW+bVxSUIPvnw
	kNEZI=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41999a91.38.1783468097262;
        Tue, 07 Jul 2026 16:48:17 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41961a91.38.1783468096706;
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm12059705eec.4.2026.07.07.16.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Message-ID: <f33f8d98-1da2-4b5f-84f0-3b7174af8728@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:48:14 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Peter Chen <peter.chen@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
 <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CXIdmsKWXry8jKXsmofLARaCMU8JQFat
X-Proofpoint-ORIG-GUID: CXIdmsKWXry8jKXsmofLARaCMU8JQFat
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX33fHuVEh+QTh
 ig6Y1SN9rtto/pAABioJs+J479cpJwd3iOmE/E2qU7n6Nl1cXhSytLims2ip6yBrt0cHwQQk2eZ
 rb2GJdVFazxcVui2K91qJlK2dZdaU7E=
X-Authority-Analysis: v=2.4 cv=b9yCJNGx c=1 sm=1 tr=0 ts=6a4d9042 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=H_2qtCgBOHeE-je_SbAA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfXzUS/NRopn8/5
 EfjqvQoEE8Ca8rEvC4YYZaBOCOuW1sOe7MQYQK402ck0DsB13IgZKutCsfw8BdPQfWdxNf6WY4q
 E7eLaStjejmYJPjrFCl7a/ozsJQwlOQ7Tg2Xg4VW/K9Bg7pWCnh6BlY8guHfay4FKvmS/sOZEIF
 rOAynV7G6MCv9JNnl4uus4sM54imJI0c9c7OuZVDZeNuh7Mfs0H7iwwpzO8NjlATkaoYUhrqydT
 EHkCszmibSCzMIzWu+HyZk9qosdlLEZPSk2K/Na2H/QYwu1HcQD30+7x9Gj8iE6soMgTJCiBNJX
 xx2BAs9JU3oqmcj0kBG/oD2ZAX2Vl/L5X+A3qNPo4KD97ohm9HX0p44MU505dX3HTwdil6p/IRw
 pHF7FAqW2l1DCXMgOhhEStouPlw8n458JsOiLsu1530N0LsLqQNmoh7ve9ijfQZSV684UusU9R9
 bN8LhupWoGkdA6bObBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070233



On 7/5/2026 8:32 PM, Peter Chen wrote:
> On 26-05-01 10:06:30, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single

[...]

>> +static void eud_path_role_switch_release(void *data)
>> +{
>> +	struct eud_path *path = data;
>> +
>> +	usb_role_switch_unregister(path->eud_sw);
>> +	usb_role_switch_put(path->controller_sw);
>>  }
>>  
>>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  {
>> +	struct usb_role_switch_desc role_sw_desc;
> 
> Should role_sw_desc be zero-initialized here? Otherwise, some entries
> of path->eud_sw are uncertain after calling usb_role_switch_register?
> 

Thank you for your review, Peter.

I'll zero-initialize role_sw_desc in the next revision to avoid any
uninitialized fields.

Elson

>> +	struct usb_role_switch *sw;
>>  	struct device_node *controller_node;
>>  	struct eud_path *path;
>>  	u32 path_num;
>> @@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  				     "failed to get controller node for path %u\n", path_num);
>>  
>>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
>> -	of_node_put(controller_node);
>> -
>> -	if (IS_ERR(path->phy))
>> +	if (IS_ERR(path->phy)) {
>> +		of_node_put(controller_node);
>>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>>  				     "failed to get PHY for path %d\n", path_num);
>> +	}
>> +
>> +	path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* Fetch controller role switch if it is role switch capable */
>> +	if (of_property_read_bool(controller_node, "usb-role-switch")) {
>> +		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +		if (!sw) {
>> +			of_node_put(controller_node);
>> +			return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +					     "Failed to get controller role switch for path %d\n",
>> +					     path_num);
>> +		}
>> +		path->controller_sw = sw;
>> +	}
>> +
>> +	of_node_put(controller_node);
>> +
>> +	role_sw_desc.fwnode = of_fwnode_handle(np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
>> +	if (IS_ERR(path->eud_sw)) {
>> +		usb_role_switch_put(path->controller_sw);
>> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
>> +				     "Failed to register EUD role switch for path %d\n", path_num);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
>> +	if (ret)
>> +		return ret;
>>  
>>  	chip->paths[path_num] = path;
>>  
>> @@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
>>  	if (!chip->paths[0])
>>  		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>>  
>> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
>> -	if (IS_ERR(chip->role_sw))
>> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> -					"failed to get role switch\n");
>> -
>> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
>> -	if (ret)
>> -		return ret;
>> -
>>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(chip->base))
>>  		return PTR_ERR(chip->base);
>> -- 
>> 2.34.1
>>
>>
> 
