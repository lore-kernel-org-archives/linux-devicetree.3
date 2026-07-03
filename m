Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E37F3B14AF
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783070418; cv=none; b=QSe9nm1sRZh0VUgyuOqkBbTy6Qm5bTnGMDN/JlGWxzoq/VSR8z+KCdyjo2SKMJiIL/fzRWcSZIRueypMuPphNgnK13wbRMRyuZQh55Pj4Ov66OiEOV38QasPo8UaCWyhvL7+SdR4OAS/0xjHzbnLBed/L8FBVQmCA6LLpEfiTxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783070418; c=relaxed/simple;
	bh=SInzcmPHMyawTK6c/5nfvrH+VklBNXrN3daWxDv60fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0RzL2cW2lsNc9kFFDCnIm21YTZCmu7lgwulN/RAmzeqUDeuB/GT3S1EPPq4Ekxy1J9pgFn1ibwl0L92aA+h2XFP2v3knxyYxw64fKdx8n4fzs2OKUaSePthd/CM13uTe5NF/4AikMOeu6sW0RZajWCkgRrNrYtCJMRO2r0r6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LBwReXtB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1F8VE7t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBwReXtB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G1F8VE7t"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368BON3053832
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 09:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=; b=LBwReXtBR7ctHxYX
	BiAIamsMZpf6SEA0ETGaIQJdWEN4a3wCSWpB9x+QC7WWbOcA8xFJfdx8VkGfpBE9
	LR4+FyZFRX0WeRZQKoOiNYRZ4VPDBL+5yZz11KgWzrPYUn6JfJnHktDFzCkFGVjO
	SKpQmu2Wa/hv8s/6FDyaS1PYydTvgoBv/+ymkMZb8LMsmTqF1/ZFIYgeDHy7Yd8w
	lwzkeClh91u/L2oMDJqVnHlIxL8wAdzi6olt2WzoZnFgkbnSysQc8XVN3KhqWDtb
	9uAB5Bsmy1bYLkjjX8fOgU2PjDyykz2+XXBDMhjjq5kDz10CyX+PFAzr3ZnBfX3T
	u4jbPw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j00q3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 09:20:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso485566a12.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 02:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070415; x=1783675215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=G1F8VE7tzTO6Zj/I/dy7NajL/9V6PPchjESG9ZOnboigGt51Ia2Bvp7jHKnteonFaT
         0auBM8X/wJjLNLmbHWtYCDdILkTOZWksBSGE5fJE6YSnTk6H2Xb5lKLaeM56KpQp196N
         ikR6NLmoqaVl6fwYWkP99GZiurqBVkXnsDmlm66bE6tvglkKVunJX0X21mPQqBvRmSPJ
         OZn+0o2x6VqbvldnMTOUpFg67jGUjBH72MGz5MJ5hNwLMSo1OaLgSKgN15NSDBqZkeNS
         vQRc0P61ijLgJeMfTXZ2kD6xZrFUYa6qmQ0DOeTeTx85HhvPrxqm9aQGKV9IFMgQoEhj
         vWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070415; x=1783675215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQtmr+j8o6eeTBOLKctC/1KMmbnUFU7wJ0fv38TVJTE=;
        b=r/IKa+Ooa9AlWY7LOjLtPL7q6HLNG0LwVp6rU79HBzoIEvSYq3Iif74250vBLz8Ndt
         9iwyVtktbP1e9kLWFk4B2kQxeTIZsv4tSgy+8/2+D/Hijv8JehZx5IYM7uSAJqs25HWs
         XnF8Qnkz1hoFYqIv6LmbZmHn51xz8MEk0a5HM3FLmegGFM7pPYI3dLUxwWFuSiCgokEs
         cwF4j+Bty64uPu/U/dfNk/RmLshZUp94sJh6vGXI+Ih9aDxuFdJqXzSWbYPjIezpTCgj
         e41cLcBLcgrk18jSGXE5PUkWj6QRq16chcsnZdc6hqQM3gpSyzhjRdNAVUP7vcGR4Mrb
         Xz9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqjYkUwL0EMXoI3Y+CQ3hQ8sAHMqxNqbES2ZkOuUelyHQUXrMNsLIhKvBP8tJspvxCi63whQns4ZK2E@vger.kernel.org
X-Gm-Message-State: AOJu0Ywutq85QuN9BgLCAjTLiije1ey71Q8Qs9YrLMSghwXvZO57HDEU
	QyK9Zdr89n3OgfdqYjaerZYy5dSfwIZwC8AyudtlA8kDLgG98gy7OeK4dvratvi1AyDaFvKWRU5
	xcEnS6OLfO8PipaqGqt3I7oUlDmSUwfdRVMt1WJyGSqkzVyKmXSz+cpO5dmZDTNj3
X-Gm-Gg: AfdE7cnvH7s8hlTM/pBNcxslwdUb9OhXDt8zD5hz26E0Fso7T5o3Yb+XGw3nt5BT2Yr
	FU84VoMDaUyI9W/N8NZE4ZLOcGwKEKSVYuEEZWa58S7QLmB8rRTTKz/KngDPEyP6RPT5BbI9uCF
	8xImd50PYK/KPunuPmPkokzu+2esscQXPpENKtdQtWZ/C4RghHwnMELIlod5FPn1oUZ28vz8Mev
	DYmUZ4tGv+gkWUrp+juS841x/IQmr4N1LgO4QizoClhIA++6OVFEY4wMd/cLLjZxFRW3j9FJFNc
	e2zLzvyfnIJtMUlYUbdCm3sNuFCP4esbJktC25ar9d49oh5rJISxxUQlCbnYpsZ1kfN1NAObLwL
	ZOnLcjUq0YtlNR5ZPk6sAUxx2J3RYabvSjzgCdFLQ
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96592265ad.35.1783070414893;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
X-Received: by 2002:a17:902:d4c8:b0:2c9:bd3b:34f with SMTP id d9443c01a7336-2ca911f344fmr96591945ad.35.1783070414411;
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b41c364d5sm12798365c88.14.2026.07.03.02.20.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:20:14 -0700 (PDT)
Message-ID: <8a538dd5-ab36-4826-929c-8ad16d652728@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:50:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
 <87echoqd7d.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87echoqd7d.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m9x8D5WyqvPfbNPStk1sRHyu_NKhrC3L
X-Proofpoint-ORIG-GUID: m9x8D5WyqvPfbNPStk1sRHyu_NKhrC3L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX7s2MACzS7DZI
 RLzvl9Cnixw82aXIYeZBJd1RKLJ8jEMWmBlrSYL9XY15Eiu5cou5TV9vI/pY72FlSBgNi6fcoxe
 i0pR6aIDQGbVqy+9MWWQ7tT+diQjh2E=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a477ecf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=OtCtuEUk8598TF12AxYA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX4pXvcw4xB4Zd
 KqX20vX8EVH6eUW8EakkL5CGaP4Njk4sZ4fsS9blPTEEFvHJ6MktC3VIu7SkV6Qml80X1CbDjc3
 sx0u+gjhjvtih8v2bNuUqH19VvE1Diqo0rrokxl+CcJPbzW5BGbL/PiyPXV//jUQx/VHjVyRcR0
 oXEieNmhZKTSqo0rxabCY2wQo0U8RxOl1XVxkqTioKRGacbmF5+7i1mo6VGB8EYZ0cGEf0aRumW
 2H9wnlar5a0OLpOEiF5udIP7TOmhnIB8umT5FRZvvwpUB2D3r8w8JOeyATKyIWAtb25ENOKol49
 6iF66SvKvWek0B6YF7FF5z6ZRAEUAetKpaRPXxDpcOjbjrrTV3+yxtGitQyoRepsuwUy+kCsWh+
 frvEGh52+FQV1Nh3tYFdLCcVMc1P3bOdhVkLaD4uTyCiZfDhmAeqHAjNTVSH0z8p0x5O9RpemQU
 TaKze6X+F8UCUsfktKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030088



On 6/30/2026 8:37 PM, Thomas Gleixner wrote:
> On Tue, Jun 16 2026 at 14:55, Maulik Shah wrote:
>> All PDC irqchip supports pass through mode in which both Direct SPIs and
> 
> All PDC variants support pass .. ??

Yes, It should be all PDC HW variants supports...I will update in v4.

> 
>> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
>>
>> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
>> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> 
> latches the GPIO interrupts and sends them to GIC as level type interrupts.

Sure, I will update in v4.

> 
>> still works same as pass through mode without latching at PDC even in
> 
> SPIs .. work the same as pass-through mode ....

Sure, I will update in v4.

> 
>> secondary controller mode.
>>
>> All the SoCs so far default uses pass through mode with the exception of
> 
> SoCs ... use pass-through 

Sure, I will update in v4.

> 
>> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
>> boards whereas it may be set to pass through mode for IoT-EVK boards.
>> The mode configuration is done in firmware and initially shipped windows
>> firmware did not have SCM interface to read or modify the PDC mode.
>> Later only write access is opened up for non secure world.
> 
> .. for the non-secure ..
> 

Sure, I will update in v4.

>> +/**
>> + * qcom_pdc_gic_set_type: Configure PDC for the interrupt
>> + *
>> + * @d: the interrupt data
>> + * @type: the interrupt type
> 
> https://docs.kernel.org/process/maintainer-tip.html#struct-declarations-and-initializers
> 
> I'm sure I pointed you to that document before.

Yes, missed this place to follow. I will update in v4.

> 
>> + *
>> + * All @type are forwarded as Level type to parent GIC
>> + */
>> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
>> +{
>> +	enum pdc_irq_config_bits pdc_type;
>> +	enum pdc_irq_config_bits old_pdc_type;
> 
> Chapter before the above ...

I will update in v4.

> 
>> @@ -449,8 +628,13 @@ static int pdc_setup_pin_mapping(struct device *dev, struct device_node *np)
>>  		if (ret)
>>  			return ret;
>>  
>> -		for (int i = 0; i < pdc->region[n].cnt; i++)
>> -			pdc->enable_intr(i + pdc->region[n].pin_base, 0);
>> +		for (int i = 0; i < pdc->region[n].cnt; i++) {
>> +			if (pdc_pin_is_gpio(i + pdc->region[n].pin_base) &&
>> +			    pdc->mode == PDC_SECONDARY_MODE)
>> +				pdc->clear_gpio(i + pdc->region[n].pin_base);
>> +
> 
> Requires guard(irqsave)(...)
> 

Yes, added in v4 within pdc->enable_intr().

Thanks,
Maulik
