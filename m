Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC137F731
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782379509; cv=none; b=jV+ipHOAzTB9inPaqI/41gAHZc0iXY1P9ayfzb8F7x1PjYLQxwf2Mdx+L+5h3VFtpcYUn8f6JaWsdOXRGFfzuCsWUBviHuG3U9gq532F24K3soSPj2SfhJOoF7tyo6kjwkqPymThY4cLH7k89NCvLTInzpxNHUTbK8IV11TDeeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782379509; c=relaxed/simple;
	bh=S8A0MIsdoB9Z/bl+h5cGSw/0oJ1b71iteY6tOP0fHiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+GzNZ4Paz7FKyrP8w7mF+tnCvz0Gu3onFx7q0yvy4FoSyS7cPTA0Gg1wXVUL17a/Q/wu/h8fhub8RshSiOXeDSWS5+KbJ3S8smPs3F2LeyAYefIsEbxQcZ4hzCHDjBaOEXs0azQgM0BmpnCllQH+v/6fZGp5OSVLg/vXeDnvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPhOKPYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSQvy904; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPhOKPYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSQvy904"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8q5Wv1601049
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=; b=mPhOKPYYo7sZFSr5
	XTZGuZPsvhu69DYlKmxwyy5qidNe0ck28455KYP1eDHO0+1EffsJp3yKo/MjBWNf
	w71e7JGLRleyPkR4jJYehbB/6ytztBKsQOYouMQwkW61G0X1z7CAP7s739/3o5aO
	VTtHI2aMYlNluLDZ3jZXA1T9oK07hLSmNZFUElf5bcC+txPB8VDas82GLPId9XBO
	lWQL2jP8McJUdZ/ToFtRRyi1BIZSubcjvB4b/nSNsGN/PuT87YtInaMCeQTeVqaG
	6dz2dtA9qdnncx4/4XlRQFJeoqgHmIdFHHDeP15aE5zsMABnJx8MZrxPxi3cl08m
	mUixmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0j7dukyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:25:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6b4271491so12269515ad.2
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782379506; x=1782984306; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=;
        b=DSQvy904739pKXVNqk7EgADlvp0KpqEEzN+oMIAbZqRTLW77FT9ulZnZbWDYlz7dAm
         WsYpWuQuMkn5eUeWPWk2HfXyYiZHCLQ0drUAAQFsXjbp1JG0+/nXr1y21UJzrUp7Cs++
         rPvybZukSUC0Va/PUaOPXLV8MGWqqJYIwjNjZDdgbyZqgkMsaUhW8kH0UcO3sJr4BY4e
         9sWkmGtWPNPXTqx2Ie4qvtnC1/Tj6o4anyH02U0Ra8I/J+3sUia5fOB/87B8LhX8PBPZ
         /zw5MZOP51z7RUBStU71ZGOhNVb4jai4p5CB3dtAQ5HN5ISbAHRH+0gxriGy5QQJShLO
         HzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782379506; x=1782984306;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlNuT8OW5AbZRZ7zo4XpP7ZzYh3qaFOpGyK9QlIFi3o=;
        b=iJreNWVgiIi0EHRkicNsI8WnL5yJQdKjFxq3olc6ublKLeW/Ds4KHis6zbe1y5SX8w
         wpyxM9zy4LDeNwpzyBTTzNV303W+8+4lAbHUV0tJAEJ3BvIWOovFHdLdLZF1/MaPoEGb
         ZFVaYplpmJjmTkBi+idIICPeZQackJoESy2vQrvBv2vzNnNHyVYQuSJ0zk8FG740tjMx
         21AVIgiC7Nxoj+4aGGLCptIifbKLVQ9IOOT1h4Lnvw/gPuH4YVkJ93tsKWFZnN8/BEA+
         H4jyYWUH1uhBPEzyEzFFsLulGladjffDd/p++jfSHxL8QECt6HN5CRj7wk7NJARYDYq+
         lliQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFiSDz2x4AEXESVxlM1mkC9Ri1DdUm5eCpKLXNbKkRgsEbFqpOUS2dQMhPjKvJKVLe3e/cbgnSdgH0@vger.kernel.org
X-Gm-Message-State: AOJu0YwSZo7KXoaQ5GSmozKJOYeafa98TnpkzgwuJ75Fe6fCAcIhyP51
	r3V1tIalt2p7OcMaHKzxusB3QnhxnRLr2Vz7DzWzCgkgdC+g+9cnqILF7is3kHufhRxR29oWbvm
	cXA2r5W4DUJtAmxAB0xpozlJfNt2aDXMBTWb06RbWMD6AZ7WukjXLLwVbIKk7NEFKerKXGQkv
X-Gm-Gg: AfdE7cmqdtvWw+OlgOqIUSCadqtiVIMtjw7GCtT4UzDlWifiQdnrF8fh6qEmQyAeBWw
	lE5RTUH5zLowJixA7B4dT+xKUVev+qvUkNBjHDGvACQRM439UMfvNfJy/v2bi4OXMNJxXAncoYz
	BLDhX0228nQ2rk++VBLEJDxbX2k14YCPHSl2FEAJApQ+rr5lTl2xgavAr2Ogtag9wfPuTbO4XkV
	u67l8/Hu5MVpD479ALmV6xK35MOBNIPi8EDPJ+WFOZwem8ktKnuZL8l1DaArD5d3K7QZgW1PJJH
	6UCHnKU+0dBL0iXStB6fPXQ5+UF2m8HGMbk3bQef//jvK3X91Ka1Ku/gG+7McxIoZA8Kbbb3FXm
	o8Yi8I7T2J1mC12zUudg5CRakgDBzPF8vB2hURQ==
X-Received: by 2002:a17:902:fc4f:b0:2c6:6926:8968 with SMTP id d9443c01a7336-2c7fc7406d5mr19613955ad.20.1782379505616;
        Thu, 25 Jun 2026 02:25:05 -0700 (PDT)
X-Received: by 2002:a17:902:fc4f:b0:2c6:6926:8968 with SMTP id d9443c01a7336-2c7fc7406d5mr19613565ad.20.1782379505130;
        Thu, 25 Jun 2026 02:25:05 -0700 (PDT)
Received: from [10.218.48.36] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5afbbd9sm16716915ad.28.2026.06.25.02.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 02:25:04 -0700 (PDT)
Message-ID: <82bb1355-7ae5-4123-afe5-890c6a6cdd27@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 14:54:58 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <e513bc4c-ddeb-43b3-aa05-59051136ba4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DO_23siRvJtGXUnTqHS6X-5heQhL3Sg6
X-Authority-Analysis: v=2.4 cv=NvHhtcdJ c=1 sm=1 tr=0 ts=6a3cf3f2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VMtcQVj_OTphKyc3ifsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX2YbubK3dhAyZ
 SHFgNG24xb+8PSNjJwVBt1RNY07jzbVf+6TxF4xlRLp1YkephSBZLMy5IE/bbU/FOQ6/ImASsU1
 iwmIG/pkUc9MG4CtY7bDxypN08aaRuU=
X-Proofpoint-ORIG-GUID: DO_23siRvJtGXUnTqHS6X-5heQhL3Sg6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MCBTYWx0ZWRfX5cYf3JoR7WLv
 W3VzktsMvaCb3KYhmCiIJz9b15eUrlwxPbv3zEbnZrGq92UbHOH/KIQkiFd38FadWqiWHWZs43O
 0l6SPp6oJxnwks/z9pO6V4u0D0gK/AM0lo1St/mrJyKgtt7adfZFha0aqy2dS1vO3tN7cqVmx+8
 OTnPrULD00+owVToqjiVqMH8b8hEtrPizh7xDNTK6Z1M/bkH0tsXKypfRcGZ/DoIHQz/+U+bwux
 jYxrpDgDHwAkfL0MRTimv4Mk2pqh4nNEJr5V30tyqWxo/cemFIGaIXQsxkPULdimjTtS26Yx3MY
 OhoUjL6RUIO64/jHdGEO3Ku8188EMjcj7PwqYjJQP1X2JXSjs34WhouK3BEVGjxo1MCkSD1MAEw
 6SQC/qM7x896MsJrXN3I0s389kVSI4xq1OJXmGN8MpNCaDvdbz+UJrFb3bxlv11PxkA0sxdY1a9
 6sze5oZb7/M5r3arSdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250080



On 6/18/2026 1:48 PM, Konrad Dybcio wrote:
> On 6/16/26 11:25 AM, Maulik Shah wrote:

[...]

>> +	type = IRQ_TYPE_LEVEL_HIGH;
> 
> 
> Please carry your comment from the previous revision:
> 
> /*
>  * PDC forwards GPIOs as level high to GIC in secondary
>  * mode. Update the type and clear any previously latched
>  * phantom interrupt at PDC.
>  */
> 

I will add back this comment in v4.

[...]


>> +	if (pdc->mode == PDC_PASS_THROUGH_MODE || !pdc_pin_is_gpio(hwirq)) {
>> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> +						    &qcom_pdc_gic_chip,
>> +						    NULL);
>> +		if (ret)
>> +			return ret;
>>  
>> -	region = get_pin_region(hwirq);
>> -	if (!region)
>> -		return irq_domain_disconnect_hierarchy(domain->parent, virq);
>> +		if (type & IRQ_TYPE_EDGE_BOTH)
>> +			type = IRQ_TYPE_EDGE_RISING;
>>  
>> -	if (type & IRQ_TYPE_EDGE_BOTH)
>> -		type = IRQ_TYPE_EDGE_RISING;
>> +		if (type & IRQ_TYPE_LEVEL_MASK)
>> +			type = IRQ_TYPE_LEVEL_HIGH;
>> +	} else {
>> +		ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
>> +						    &qcom_pdc_gic_secondary_chip,
>> +						    NULL);
>> +		if (ret)
>> +			return ret;
>>  
>> -	if (type & IRQ_TYPE_LEVEL_MASK)
>> +		/* Secondary mode converts all interrupts to LEVEL HIGH type */
>>  		type = IRQ_TYPE_LEVEL_HIGH;
>> +	}
> 
> nit: (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq))
> could be the primary case to better communicate intent
> 
> Konrad

Made primary case as (pdc->mode == PDC_SECONDARY_MODE && pdc_pin_is_gpio(hwirq) in v4.

Thanks,
Maulik
