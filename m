Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6396C288C0E
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151403; cv=none; b=gVKfqulUZXOdS6wb2mtI8n6kNhgefgp9QxjIdUZiojdJf2LufW68v76PgMdEZnVcyVbdgWQbTchCuhsrg6b2pF96pMx2mfqOapcUgqsWMgvSB1A6I4jGQjyrV1FWAOl/Ylb2QUx0nIJdEW+j98rbL+VPsbiUC4bfqqnxsF67qEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151403; c=relaxed/simple;
	bh=fbu/+zj6aeh639hwEw1NBkjlAGIRRjC5FcHHwvgHRuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MUo6/BRlQzKV8GwiIQacecJ047cZJ6w+0CZsEV9nJGOtwK0A213aaE/OjivUX60JGYk489wKMYHsPIp5MGJPWZZ+mjp4/aYasuDIb+Vs48YgQpW3MBY/46hIEtCHwvzVmPsZJqIH0tbkGdId1UcJ53UPqfOsgPijyLuczOI/yVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbZNQVMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1YgrO78; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbZNQVMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1YgrO78"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMCrm3427670
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=; b=TbZNQVMCIQEKb6mT
	zMedew595zz4zkNSOJbprFPN2+tBWaO8Lb4HBUwx2Hr2YqTHTEvHrG2wupFm+vg5
	+FOipmCjSOjN8yj8dzHCv2LN6w7kLI7A02zJAWfl1OjaVBvbDtrHGmYWMeR+PH03
	f5Jtw8R3uMToWWm4v59SjcpnY8nIcukb2kTZ383aznsUMQZMTz06MMd93+lnaGXs
	ShKugyAtBP1Bh5w9vrMmAfiewqSxpV3fYeJpJQh/KG9vo4qS/N9Fpsf38l5Gbs6z
	79IAb2HUuYV8staP+oA0b1VNg8USa7vrfxT6No6J4W1r23k0jSZGbLHsg2TGOzS7
	nhRZZg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2amk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 11:23:21 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b13so2919805a12.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785151400; x=1785756200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=;
        b=g1YgrO78XEbYfYnT2nK9HHrJ6OE0p1tGB5RpLBHdZKDIdKsNji6Y1LTEC5/BuvE+/b
         XmdDm1Im2HrnRWU9H3ITG3no3CqdThiitBA9YVM/KGSC6Qd238t8xLyyhO8Bgy7js+WU
         8opzZP3MTwhMm+OlNKVJE/sU+JnQ+ImlSUnAKG0YAG+8swOW+82fcd79nXRL1mTcyMNe
         ZIIkL+d3CPOFX1gB00/YKhpORCSc2egmj1B3biPH28gghqHDNgTJZuvqG84jNryvj4ka
         9JY2fDCKRlYpHhp8pBGH/05DIjygsX9hj69yIaa/PenzQBfFdw8aWcmq0WOq4UCFRr27
         ruvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151400; x=1785756200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=;
        b=s9ctVGiRJGe7QECu3QZ5FMFB34nNcXP8ck5cAx9HHeXQSLfk+cnZ1IsNDy+8xeSzbP
         wgw1jQ/Gc6eZQgWbqBQx+NyScmzJ8Q0fMj3ujjs0jDrY/TFUKvXHNVylPlMTbfobQfc0
         h+BKkUGkV2sgDaI+reADrZ1EMqMnVEt5Kx1SSfjy0/7FaPCwFAbgtv0ysyKAZrkxhRH6
         Pxvyh1omm9kI6zFzXP71uF6+6wEYyjMiyUlwxJAfvtAv52ZH1+NSm3viUk6Sox+JV211
         R1u3Ch3tas3jbYKMl8UVcl1REtIjMNUgHYyiOq1it0nfxuQBpQsnx2TiQdLDGmn7fR6g
         aaEA==
X-Gm-Message-State: AOJu0Yy6Nust4ko1cT+jITeORQVIH2qGpH4ydGwpLxDEddw177Q6KYsS
	KtXgCNdLmy/7eWBJ+x1CRzvkWSUbtt0DvKQVcesE3Zce3NmbEcVqcQPz68PmuHIWwzqWh5wTI4X
	DDezBkYs42JXYhhhKznz2cop4/m9Xm2Wfy1INNdkCOJw5vLTQxbNN3bCbMGNiJSYB
X-Gm-Gg: AR+sD135buvNvZm2xjfsxpr+zYINXN7Bzry2nuhmvJZbqxEaBSYaOMtkTaEw0OizDxZ
	vCe18zmBgxs3lyOGlSLCN+jQmzE2/QTO44zjnLa7oA1VH1F9pMgQ0t740s8KaeGV5AE/aGGCdzv
	491BM5/sCyJE8gM6mUwVoKut/gR2ZJlHw6N7LGJZVo2voHqm5JfnkxSZstqTCMSCegFVHzGmczo
	et1awgisMJYxtpa+IrIO7NrapQLIjplDdj0Fd+aK5fy2raMtW7Ne5Osq30UncBCu5zLHvgKHGwr
	Ht1LKB8O8J6/WMqEH7r2KUcmIozetfcNXKi65v9E3itxMXlgNyNU77CxvbnpcKXo8MhE9pPVkXV
	Ujuzc8Alu0GV0SBRd28qNK/JmrHAlLw6HhZkizlg77uvVjs9h4L+ZcmSUvGUK4X2Vs6wGwkKYkG
	8kCA4ORsCErgzGMODdaAp7uICNd0s=
X-Received: by 2002:a05:6a00:4307:b0:848:5010:ad3a with SMTP id d2e1a72fcca58-84e5958a8eemr6554547b3a.58.1785151400020;
        Mon, 27 Jul 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4307:b0:848:5010:ad3a with SMTP id d2e1a72fcca58-84e5958a8eemr6554527b3a.58.1785151399508;
        Mon, 27 Jul 2026 04:23:19 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533cb54dsm2880228b3a.31.2026.07.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:23:19 -0700 (PDT)
Message-ID: <aba21143-2dbf-4f1b-b504-7c03c1618603@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:53:16 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
 <20260718121649.1714C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260718121649.1714C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExMSBTYWx0ZWRfX1gOMkTuVGbpC
 o8coF3IAoFZUIkQAWq+jQk32tjRRqZgRuMY6gYPn7tyeYtetZYIcPkMIvo+64QqR91AzyVV8eEk
 sN1/B8E++A9oS5uVPM8KVCBmKyom5d6WyuMkZiuLMyxQyn558FBxLFZkmn30Poubo+QKP7jnX60
 1Sz5sps93NsoGGieFtOeO1AQRkvHwfTTpb6/Y89iEvjuh3fbeeD5LxJ6eoouygON6ZKfgBr+Szi
 gH1gEp7EXbsCLIY6HR9NWUL0kbVd3PHcHE4Nr8FseNjXt8B2BqFUVh5s5DvloY8sKYdHYQTaxJE
 8B+35wuojgAq9kx48LMtijgwRo7dcg4efwiD5wlSMrYC8cdNrPY0j3zKxf2o1focJSrKDArEEFW
 SxGwHGRcxbXwfI0k+NQIdLkXpGIJF+vdS1HXAmHkPp7hrjlFVtTKP4ozOlATwEznyxCMEUQIZ32
 3RRe6I/aFHpLLNPO+UQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a673fa9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mn405PmejxS87doCboMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: YjrtDeNhRWrrPTph2jLMZ2ghL1fsZ2kS
X-Proofpoint-GUID: YjrtDeNhRWrrPTph2jLMZ2ghL1fsZ2kS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExMSBTYWx0ZWRfX/KeOnGu+q96H
 r6Q0IQwtGjU2RgicIUOYwkGDWyhvvvEoAY2Uj4ccxRGSyWvtUhKZ9OckA8IVG1awVbyTTw8St1x
 fTythYjeIcS5omI9lcr+ziPh1yW1IJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270111



On 7/18/2026 5:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The device tree leaves orphaned nodes for the physically absent PMIC 'D', leading to invalid SPMI device probing and thermal zone registration.
> --
> 
> --- Patch [3]: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD ---
> commit aaa6e566ef6b80e52c726e5cb734189e7e8ad2a3
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Kalambo CRD
> 
> Introduce support for the CRD based on the Qualcomm Kalambo SoC.
> It reuses the common CRD board description and drops the PMIC nodes
> not present on this design.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
>> new file mode 100644
>> index 0000000000000..b4441807f4602
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "kalambo.dtsi"
>> +#include "glymur-crd.dtsi"
>> +
>> +/delete-node/ &pmcx0102_d_e0;
>> +/delete-node/ &pmcx0102_d0_thermal;
> 
> [Severity: Medium]
> Are the deletions for the SPMI bus 1 endpoint and its thermal zone missing
> here?
> 
> This drops the SPMI bus 0 endpoint for PMIC D, but seems to leave the bus 1
> endpoint (&pmcx0102_d_e1) and its thermal zone (&pmcx0102_d1_thermal) active.
> Since the PMIC is physically absent, attempting to probe the orphaned bus 1
> device and poll the absent thermal sensor can cause SPMI bus timeouts,
> deferred probes, and log spam from the thermal framework.
> 
> Should &pmcx0102_d_e1 and &pmcx0102_d1_thermal also be deleted in this block?
> 

No, these deletes are not missing.

Kalambo CRD keeps the PMIC D bus 1 endpoint. This was checked against
the schematics and also verified on the running target:

   # cat /sys/bus/spmi/devices/1-03/uevent
   DRIVER=pmic-spmi
   OF_NAME=pmic
   OF_FULLNAME=/soc@0/arbiter@c400000/spmi@c437000/pmic@3
   OF_COMPATIBLE_0=qcom,pmcx0102
   OF_COMPATIBLE_1=qcom,spmi-pmic

   # grep -H . /sys/class/thermal/thermal_zone*/type | grep 'pmcx0102-d1'
   /sys/class/thermal/thermal_zone74/type:pmcx0102-d1-thermal

So &pmcx0102_d_e1 and &pmcx0102_d1_thermal are valid on Kalambo CRD and
should remain enabled. Only &pmcx0102_d_e0 and &pmcx0102_d0_thermal are
deleted.

Thanks,
Gopikrishna
