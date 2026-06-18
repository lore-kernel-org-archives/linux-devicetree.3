Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CE38E121
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770723; cv=none; b=F6HgAhsWCeok+OTfiRM7HiJrpMoStBMQ1rxl4C0diIk1qn5xRE+Wbz9uSfPX47JmjLYcJVt5NakoTUjYl2oI83+E8hxV/QtJPOcHwesGsOjrimAwPc2VF1VzHq5v3MZAdRWaclzBQPm6aUGhtfTOGVwVicwJMN4xm2/YwTsg9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770723; c=relaxed/simple;
	bh=gFzDwyt2X6xvExVhZeoNS5S99hvPwFohVyXgPPfmGQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aHLHYrU15c5ye2CqxQXGSxVnvA8UX5/YjNVlnLk9dL9gQuBvOQpuMrsR34XjWM+LpWezUZwK5q8D9Hthz2c2hCWA1dg64yHuP9R0LlmI13IcdKnk67IDvLGxHrUIA+bFmahyZxjlHgB5JDVW3JUxLnjB4UeVvnCBYCnNHn1w2Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G/MAbkOQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y03NhVTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G/MAbkOQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y03NhVTB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8G2Ym1253284
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=; b=G/MAbkOQ9ABuri01
	qfZODnVGS3de2ZDM46Q0ZfNBPCMShSg2etQl/aIrPcceDEYl95YCVUKh6Bp4j3Uq
	HEmLY/pj0MEV+c3DBc1Svr+uTdlOqk1ToEVINzPjvwkyva1bOqz/Lv+FOLfbY0fp
	IoUPEQ6w2JI2fFSI/s1S/iXElYi+GQKTty4y7AEeofFdX7qmTUaNbk95ftjRlG9h
	WYtyeTPXfLOjDmc0WoD9TxfLGqkvnGKc8wA2cSCsAzDq8Qd/Bf+YtCO5sLgctC4m
	LIRqrTrR86p0WRizVthuAdGqIfKg6fBq3bTa0cZVyfnCZDLDc7cblYh7+r4AsZQY
	r7VloA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7jr5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 08:18:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915ccc2d4d2so20869985a.1
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 01:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781770718; x=1782375518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=;
        b=Y03NhVTB8FsUqBbYTRQQWLL+wxRbOXh//wB+edE6Lu1Zbu8rbda/HcExXWruFh1d6B
         c6S4eOosyOOPvLBwYfNGL7VzLl5liKnUlG3XV0sXU0+OmUzPTNPXmeFKqcpIU+huaEkH
         OxQa8z0c5K16SFJSTXh5sXkeKpVsjU+6E7wQYsPrywi1C51KZSIN8h9uH2tw17w3GWY1
         BXaaY0I81rBE2Y2+C7zhWWUIRLsCE7HUJ//xUJVvv7/fSW5oihe3A88DxXhbhlV5j/Os
         kFs6+byJqW695WsUaq8z3oiR5fyK8fDFcaoNxZ4w5ZOeIRNz1Y4tT3/kH87kZh8ZHPwD
         tzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781770718; x=1782375518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZj09S/BPA0LGOpjmWXCjddpOq0twXITRnAhohphPiU=;
        b=CUp7EAzA0dsAxpMygkRtcZJUv7qg4RWjHT5PLCoPoPNiV1TFtMrTUYgyILKp7eVkOm
         iE3Bj57hoPzcmFyjHaNFbkaPMmMHKgShjSyY7xC6dkQAH12Y3/LWBYzqz+h8YqbBg+Th
         cQdoLd4FN9jkcIO79jU3PvubNqGII3CkIcY1txghn9X1x7lwe8v8ejHZyLVhUedOmxmT
         z8IXbAW09e5vXV8wyUrtKwIBknUh3nuHUpxbsyqUqH3PybNZfROoOorWL9gJCxCSSGqi
         IH/Iz0QNKfUtBT37p+WAf+T5yPKMkcmkh2F2TpltseKIhWSUjdmtq6gtMst38IaOuwvo
         OSHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/As6Bgli0EV3jCkZeAkX+FFY6pG1e5F1iIAXC05O7cR2Ilc8H3PqQjKba7rfl4qb4y5607r2tKQzUT@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6Db2p5jLU+bS4u9dcyZBj6cWwlVUhOwvKS2gH0r7e+VBPPrg
	PFvWuOq9Pvv0ywY76HruZnZwcowP9pxJlhtGNi5a0p+dQPyxUa+DzB+pez1f87Z2vi9Q3Ab38I0
	eL3lCc+AGAbAWaug2mBXb1LHx1yKbkjRFRH1Nb1ZHIgay3B3Ly7tsdKXJCaON33jd
X-Gm-Gg: Acq92OFDk0MEdghx03rBrKYvZT0ZGi/IRXPkubvvYLMKH6liWaiyEQ3z7tgt24vjPfO
	AFB+lE3gj/J1SfgZAPppjfdTu2t06dquifrtMSb/ixRz0vgW0e5elQ1TSYX282ugpvMcRhSSC6L
	pYjspPq5X1sx2iewXV/l5B2ZltMV5Mt2eqvwo7L5Oe3n/z1amdoNeXnzNhUG7ZsQ/WmsEVT3Wq2
	/zWxzu0sU+lRYcrV2SlTiTZjE80zXjYsyLP67GrPODwZUIUoBFgQq2cOkLxGMMhuNUWYsPcW57h
	sGuZwJHQqNG6vJodk0y4HEPK6tEEeQXr3PiGgErjHavt5AV0/aLux5tU369255LSJsfF9FERoop
	pvR92+hZ9EOczaF6zukCqFKBBpmZvQJu7GsE=
X-Received: by 2002:a05:620a:3721:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91f2a1e4688mr233824985a.4.1781770718381;
        Thu, 18 Jun 2026 01:18:38 -0700 (PDT)
X-Received: by 2002:a05:620a:3721:b0:8f1:9e59:2208 with SMTP id af79cd13be357-91f2a1e4688mr233822685a.4.1781770717871;
        Thu, 18 Jun 2026 01:18:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6955acc7597sm1902928a12.9.2026.06.18.01.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:18:37 -0700 (PDT)
Message-ID: <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 10:18:34 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-5-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfXzsjk45i5rZLm
 4dCt1PFDBovCz1QzCVGegNu8hJxAMOm3FSGXVAuj79LpUBR0rHBRp6sD6lotP7vPRkQuedEav2E
 cOS8+aLa/XiKcO4+YkTIMGpE5U3cAwhim78JlG0jkxhbvBxfYlfwtSsv+jgnKXKPx6bbf3EXN8B
 gArH3kXmnf1SS1HXNpaiCQP717JbzYvyS2CFLm6y5S9Y/fG3gIzMHTouI4ulxQomdyjYNusZkey
 HkrWClYWk2YLuQ3skSVWeDKm56BVcDtf3mqjNmR7VwV8M7h7NX42cGooZ/PPsxaFi245VKDzRqA
 IaLAI8suEZ5SQmKu5/t4U3bbwLTmAvqIeeOIJzjksRUH5DO9xJr5Ze1S7zw8YPuY/BaWTzPTT6t
 NDNW5pRlwz3xFYizrDhcKtFoh7SSOWocw88K8ocMoW6jKPJSSfCfXoiK1gSHI2iqxuYAhFDK9Kc
 i2nLUp2bq5z6qisCYeg==
X-Proofpoint-GUID: RdUpQOf-8y_89fv8JP_jX3cwWbk6jqZG
X-Proofpoint-ORIG-GUID: RdUpQOf-8y_89fv8JP_jX3cwWbk6jqZG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA3NSBTYWx0ZWRfX3u3cvfcU/AUu
 k52rSljq9PG1wE/pE5JnpaugTWBwD77Icfet+UH2AlRD254sc1OoebZdw/1c90OkO9kh+brlwAI
 a+FTc14OShKAk17Jma58UfSD8j2Y+1o=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33a9df cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=83jgrZZgdiTdjN6bNP8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180075

On 6/16/26 11:25 AM, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> In secondary mode set the separate irqchip for the GPIOs to perform
> additional operations only for the GPIO irqs.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +static int qcom_pdc_gic_secondary_set_type(struct irq_data *d, unsigned int type)
> +{
> +	enum pdc_irq_config_bits pdc_type;
> +	enum pdc_irq_config_bits old_pdc_type;
> +	int ret;
> +
> +	switch (type) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		pdc_type = PDC_EDGE_RISING;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		pdc_type = PDC_EDGE_FALLING;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		pdc_type = PDC_EDGE_DUAL;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		pdc_type = PDC_LEVEL_HIGH;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		pdc_type = PDC_LEVEL_LOW;
> +		break;
> +	default:
> +		WARN_ON(1);
> +		return -EINVAL;
> +	}
> +
> +	old_pdc_type = pdc_reg_read(pdc->regs->irq_cfg_reg, d->hwirq);
> +	pdc_type |= (old_pdc_type & ~pdc->cfg_fields->irq_type);
> +	pdc_reg_write(pdc->regs->irq_cfg_reg, d->hwirq, pdc_type);
> +
> +	type = IRQ_TYPE_LEVEL_HIGH;


Please carry your comment from the previous revision:

/*
 * PDC forwards GPIOs as level high to GIC in secondary
 * mode. Update the type and clear any previously latched
 * phantom interrupt at PDC.
 */

> +	pdc->clear_gpio(d->hwirq);
> +
> +	ret = irq_chip_set_type_parent(d, type);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * When we change types the PDC can give a phantom interrupt.
> +	 * Clear it.  Specifically the phantom shows up when reconfiguring
> +	 * polarity of interrupt without changing the state of the signal
> +	 * but let's be consistent and clear it always.
> +	 *
> +	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
> +	 * interrupt will be cleared before the rest of the system sees it.
> +	 */
> +	if (old_pdc_type != pdc_type)
> +		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);

This bit and the switch statement above are common between the two paths..
I'm debating whether we should factor them out as static inline void, but
neither solution is perfect.. so, up to you

[...]

> @@ -385,20 +547,37 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
>  	if (hwirq == GPIO_NO_WAKE_IRQ)
>  		return irq_domain_disconnect_hierarchy(domain, virq);
>  
> -	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> -					    &qcom_pdc_gic_chip, NULL);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * PDC secondary chip is only set for the GPIO interrupts as SPIs.
> +	 * Direct SPI interrupts are still in pass through mode (no latching
> +	 * at PDC).
> +	 */
> +	if (pdc->mode == PDC_PASS_THROUGH_MODE || !pdc_pin_is_gpio(hwirq)) {
> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;
>  
> -	region = get_pin_region(hwirq);
> -	if (!region)
> -		return irq_domain_disconnect_hierarchy(domain->parent, virq);
> +		if (type & IRQ_TYPE_EDGE_BOTH)
> +			type = IRQ_TYPE_EDGE_RISING;
>  
> -	if (type & IRQ_TYPE_EDGE_BOTH)
> -		type = IRQ_TYPE_EDGE_RISING;
> +		if (type & IRQ_TYPE_LEVEL_MASK)
> +			type = IRQ_TYPE_LEVEL_HIGH;
> +	} else {
> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
> +						    &qcom_pdc_gic_secondary_chip,
> +						    NULL);
> +		if (ret)
> +			return ret;
>  
> -	if (type & IRQ_TYPE_LEVEL_MASK)
> +		/* Secondary mode converts all interrupts to LEVEL HIGH type */
>  		type = IRQ_TYPE_LEVEL_HIGH;
> +	}

nit: (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq))
could be the primary case to better communicate intent

Konrad
