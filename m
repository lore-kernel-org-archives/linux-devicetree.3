Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239353A9851
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501805; cv=none; b=N9a9V3569xGSfYlp8p+iPWBnQmu/KyOnt9u/p6h6XRO/q6HzdrnYzV4Qjz3D9ZNls5K87qcILNh9ytav5HO2qRi3PjmEo6s5r5z7/5jCNEq2R5LTOvkRcyvu0VJ4D43wWA4jdR5PI4swQQvAJil0iVfUReZsFyNCfWK4FT0DIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501805; c=relaxed/simple;
	bh=gATNM/iQUFyfjUYu7EvC47L3WwzSIq2ypxLBAmy07Wk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ReGdOC3rELBAity4/z3gI+fzAJkLJkS0dZWVsB0vUx+huvzOnAF7x7e+TE0k4UDC4lipqinsr/OZpyYPl9CQ72USJdfM0XNn3Q3HE9FtP3YI51s65mrA7+vL3AzDbk3Orm1gJXnM5v73h7qadkYkdfVm+OLkNpx5ghaiKgxfKLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFvlgwd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZtAzdoV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFvlgwd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZtAzdoV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1kUO43108241
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=; b=jFvlgwd2XTS/gC9+
	df/utlLHbwFUk9vDpmHJi4bqXpP6MGmwGpqj1Bo+WZZ8DgG98/caEhhbS65STgxc
	EJrt7RYwnRWRFXBywwtFo/w+5APZ0KiP/hk6dQCoDjOG1mZDXj7VT+dZCmXO9SnX
	8cXZ+S6LA3Cc7M68ZYwPPtK8kzcPwGs5a+CNXKnDIkV48HU3mje2T+nfjiyEqhGb
	O4xjeOAZwf+Ckk0F59nVpwuoOtVCDrLD0l/wgQWUf/a3bYaRwDFLHbphKuDaV8kE
	8Luk9oeMM7efOrdv9cAguTji67YD3uWqQd0nvMa4+rgaEHTZuvsg6UGlsNGOk+Aa
	8kKgUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery955nbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:36:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c32faa62so47662925ad.2
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 22:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501800; x=1782106600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=;
        b=AZtAzdoVZkA+ljGpxTsAywTasqW3Co/NrThfwISnOiQqY4xBru2gm5K4vAugy3KsrT
         uCtap+8vkQ2bNyfzkepemThanv6NH8xEiTctnE3xRTOlVMfwwA1U9yLnv+BvwSat+Azo
         UBOPwLPkqIcdcti6Bz59am+iqD/ADo50UCqf2UBHrLdUe540nkNSF/rvXsRwpgoSGYGF
         DJExQ1JpuA7xfBaVRMNKn9CPS1T836g9UsOYKji0dxl7lkKrXRR+ScViWfYCi5AiDL+i
         aujud+N/Zj1nVQlw64X2zV/1w7DFqxOxfefWbCa+L3lBn94kRiqcOwSN7Npm50IWMBpe
         MyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501800; x=1782106600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvzuTVgDKgi30e79iKlXGgVXA+rxq/L0lqt/SXPUfMo=;
        b=kVoErIU8CdnrAJr0YiHxE+FcICvCTdfi6fVf6a3EHcBvEbpEGKeUyGPgc0N5xNRNBA
         OxvB7cZ03p0RLzsfaKxIiDKOTFtkkdn6CVBaip+h9fg73Yy/+HsNr9STgFX+6Sq0HEzG
         +hqB82QSkt7iGwjuihykKsgafNNQQw/taXeTL70+73MeoczZrYK3FsAbs+KRkzIWeVUt
         St0GqF0SygrLkiP8sRLi6i/HBD0z1bIMgBHM5RJYNcLAlTm4elvTmL979h+lJjHwIsfL
         2oOLadq8SmlnhXvp+h+jYyWAryUBjFVwQoDGoZY6eATsUdUYrselzVsStncE8381DV4e
         fvLw==
X-Forwarded-Encrypted: i=1; AFNElJ/ktbSbAsq48OTClCRnM0lKXkLjoYfyyz61P0CXehHOCZtrbOwt6Yz2evolIqbU8aE3p/KuZD0HOlp8@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbYj4ddY1rStM/lcPQWOu3ndiUhG0fffzA8LHogIuFB1ptZNl
	i6k6sgCwE4Xn6bsI+27cOnNtv80Bm4pav7lRPD+Z0jzi7n+PDtyt5mBXPFSvTZGXXYXalVxRO4d
	CsgYHkGNaDJqxUnoO9a1cxGN0VbwEBpUozAKZ+OKseQWz6luciCXCPrKhWCrsYXERKtpe2vG7
X-Gm-Gg: Acq92OH82S+kO4tEwzVBLT5/0unbWJ/41HftuePJ1tIzVM/Al5LNJrutIp+xJiWy0Ok
	G8cEqQhuV9dEeyazV2Y5vDNZSf7HTKfU7c+A7GJEeM+YJ2Cd188QTiQQy5A35PSDe4g+EgquL5F
	5H6OgTtNt7woSwKkB+JsfMV1mDwwc7zTZCiRvnvrtSC0LhehLvbXk6oPVcb94HJPXArMj14ryng
	hIr2hsbqPm1i/K2qjz7OvABOzCdpa5jUQKFK0+zH6gtNF+XrfIEyN2GcRcYLO0laj5NiSZRZ5bq
	jiMGfBkNW3CngBBMYd7fvlW75sKq+oJ966kIMz/nclfKK+zT7kyaSQV/twxner00l2ofWMQhvSh
	Tz8+n5QX3RnP+8E/CC86uKYEQsgaPA1JST8iAV1NmVc02AYj7ZoU=
X-Received: by 2002:a17:902:e786:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c412840747mr134605995ad.32.1781501799967;
        Sun, 14 Jun 2026 22:36:39 -0700 (PDT)
X-Received: by 2002:a17:902:e786:b0:2c0:d4a8:85d0 with SMTP id d9443c01a7336-2c412840747mr134605665ad.32.1781501799316;
        Sun, 14 Jun 2026 22:36:39 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5dd0sm111774125ad.20.2026.06.14.22.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:36:38 -0700 (PDT)
Message-ID: <5a5acc8a-80d3-429d-9bd5-93b72cf4e768@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 11:06:35 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] irqchip/qcom-pdc: Move all statics to struct
 pdc_desc
To: Thomas Gleixner <tglx@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-2-f6857af1ce91@oss.qualcomm.com> <87bjdr7ikt.ffs@fw13>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <87bjdr7ikt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9B5t7Ba8xOgG3Y9pFhFtJN7kdFUGAq5_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfXxP9RrBBezxUT
 62GbrjbCqrZW91YCR1G7MsoElLfaYPeaFwMRhFIVrAE2dGsNJ5F1ZBMEqeetmhtBlAGZ5MyzrU/
 w2mEU9ihreuxHfE2KiuGUcHAHlJ6gJQ=
X-Proofpoint-GUID: 9B5t7Ba8xOgG3Y9pFhFtJN7kdFUGAq5_
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2f8f69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=lRqjTDc659lOLNP7f6MA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NiBTYWx0ZWRfX9hRDohZuSBe2
 8EHILS2hAwBaAu+wz6rRb0ybe+vQvh3suGzbI6cfB/s1/1y1jppZAk3Rqslqh67g+vNeXWTs7ck
 yyC0Ytm2ZmnxZixidTRd8nLxHCkGQUMnUchK4g1u53sTWOnMWwqWD4VBwz3Qg/LdGYiqxKJXlny
 9A8Jh1TzGD2M4Okjhjb8wRje7rlSs4Z5iGkUdTPSTHBKmwVQNVjTizftXSgz4vaNNU8GaAFBRRB
 IEA6eEw7qAVo9QOcQqEiH+jiP7zrvIb8lqKR098pSlAZLskddXpV4dNPHJtidCTf0RaGvv6THsz
 v3RCGb1L1KBZZ5iWKFuQLqV089T56ryX93FVgWN9T/drB+/nXDvt0Pz+pmWUHaBOv3MyMkDz0eM
 Bk98wTpT0de9gxZZsZxZmkbio5hjbPrAi2Bx7IGGQwRSzEel3NQGJzJFovE3oTwuFWD3cRh/Pkw
 GwX2otJ5PaGb8ldofmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150056



On 6/3/2026 8:54 PM, Thomas Gleixner wrote:
> On Tue, May 26 2026 at 16:24, Maulik Shah wrote:
>> @@ -221,9 +231,9 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
>>  {
>>  	unsigned long flags;
>>  
>> -	raw_spin_lock_irqsave(&pdc_lock, flags);
>> -	__pdc_enable_intr(d->hwirq, on);
>> -	raw_spin_unlock_irqrestore(&pdc_lock, flags);
>> +	raw_spin_lock_irqsave(&pdc->lock, flags);
> 
> While at it please convert this to:
> 
>       guard(raw_spinlock_irqsave)(...);
> 
> The _irqsave is not really required when invoked from the irqchip
> callbacks with irq desc lock held and interrupts disabled, but that's
> also magically invoked from other contexts. So you could spare that
> irqsave by wrapping the other callsite into:
> 
>         guard(irq)() or scoped_guard(irq)

Ack. Will update in v3.

> 

>> +	for (i = 0; i < pdc->region_cnt; i++) {
> 
> for (int i = 0; ....

Ack. Will update in v3.

> 
>> +		if (pin >= pdc->region[i].pin_base &&
>> +		    pin < pdc->region[i].pin_base + pdc->region[i].cnt)
>> +			return &pdc->region[i];
>>  
>> +	raw_spin_lock_init(&pdc->lock);
>> +
>>  	pdc_domain = irq_domain_create_hierarchy(parent_domain,
>>  					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
>>  					PDC_MAX_IRQS,
> 
> Please fix up the coding style here according to
> 
> https://docs.kernel.org/process/maintainer-tip.html


Ack. Will update in v3.

Thanks,
Maulik

