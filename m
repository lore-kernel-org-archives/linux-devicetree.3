Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D991D61B7
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233259; cv=none; b=makMUK1vKI3W/aJ+PxTimiAWJUJDUXBbtXB2Prn3NqdvqD1Vqh3/EwaRsXyWfkx0xLySqBsWD5TYW+8KhyREWeW5QTn4RIeAPvdgldAdfnwmDqP9/xYNqUAP5mHscoGJDc1Wszi+QF2ix0aCNnsrzYWMIvWVIc+vjrDYb9Yclic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233259; c=relaxed/simple;
	bh=ejqs2vcPR76zBzb0TQ0RAYoHipYbI5Sn6UDxEfajQPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qq4of/j4xVs0BHT8feglzHxZbEAVYD2sk4ll+dfF7MgDQGXH5CRlNHr29/3X7pu0LJLZpIfgjikIfdqzjqAO0LzqA/5mDJtrJpgQlZeIL1FfUMXjQWXtCGP3AgZWZV8n9VHgRmddE5tMmHUYUSUDKtY5IWU7BbtetsAN7IjL51I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K01hXvlt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B+Tb5jwB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K01hXvlt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B+Tb5jwB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BMSnBt1912371
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=; b=K01hXvltaUDbj+I6
	zW5lIvcJFDTCNCWE32dGadxFsR9NDoDyqOlzpFz/Tmd9nM9Rr5xWEf0PJhONg+zq
	hxavEzpTLLER3cP637G6CVJGxUAq4ZL7zSUjNy8PSkwp7T10kKvFV+2eznKb97Ye
	c+/+V11SIVbRkGkyQvlgvipZG/G5laNQj7sB8VQPVT7Pe0voauczyjJpgnFH+GO9
	AuB/BZn+ZOKlaxaTlERO5VLlriq11h+7pvDwZZYtI9AQkluNtHeRQemeFbtme4Dl
	prztOlg3MloIXo0TAe7+4+CaS6USOrC3qyDgMrWa2xb9seKTEiDpR7RLSzq9bTlQ
	t0TH4Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er0x7j066-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:00:57 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8424aac207eso555589b3a.0
        for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781233257; x=1781838057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=;
        b=B+Tb5jwBM7DZg65x7Nkr6HlSzFsLn34ymqZwMTPuAAA9j+LCKJKffl7vEHmpjiZtYJ
         DPERedx1j0Zu8MF6LUd8Z4ZAguQCLV3CWQIMZA537lAWAOVnL+kP2JNjWWSBwsFOU0eP
         3e3BDsLzD6PV67g5rCACK6jMAyUT6jo3NFciwDai8A0k/mi0xzOnYaWumRjaXeSjZ+1w
         9jVERL+yNMELR365d1vm1y6MRtUcuZrbgkNcCqAe0kDDrGvhH6cl/BufzZKyvQ/mKOMO
         ms2+KZuaTpr7txMZkZkhZM+rZklYrMkXLwAethAumblpeuClfbnPAwpNrUiXlTk4NYRA
         Ekdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781233257; x=1781838057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohkNRy/pAe7gT67/lP8i9MPg3N+KSvVizD9FWIPxTu8=;
        b=h6VRNjUypyRbQerKAqboI3MlHSKcaT5u1VpeLw5a98XgvrN8/je2whyBl3U51fMnrD
         cxhqYARqmwMYBQZYd9s4GibudS4TBQ1yhCoG8YxTIskwY4+W2nN0E9olSWLf4lyeVX6P
         K1xe16RAqK7iMwY6b6IYfFD7YVmf3TaJVEOvoljjLv1tJn7pepWBv3Y7ulYEyM8Lsuze
         xM4Y2WT7w1CaDtuXsqlMbDwDO2pSFguhMs0dev2uCwgY0hr39M2LSPrcTrHNTCSi0Sxr
         ER0hi9VUXwkgKVKyumcWMPHDSQ3y0V0ORKOdPIIfU5foLI5wYbS84ZtfVRwf63+oVyOs
         +A7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8E+mfWtrkzB+TXdQIQ9equbYGajwl983QcFKnCLM9jZa+88lx2wsBuX4dDlGMRCGcPgZdyFD2VWsvs@vger.kernel.org
X-Gm-Message-State: AOJu0YzkqIEionN7bfIeFjzClGqdrEsv2WsGzNGGv2KAJoh88JnNFRZN
	kg4iJh4uiW7b+sTmwGnbu7wO+4Ju8j2bdd36JbyPgPPBNDueQ5JVRIGOrVH9Yz4sALOuUZNhCQa
	icZ6bwo6Z6eM7403wL+wgnXZtGy/ogAxtHCeTrBnFtmJBHoi/KmHZjAs/HPOMqToy
X-Gm-Gg: Acq92OEXc7tR3H/uDSRKI/s0rjQkhcqQeg3puza6KhyKPn1nEmWQ8wnbOFsJkRVi4GF
	ZorhFO85AGXTs5usduXOlp/GgDVI+V4+2BSxTcLcssdjxXHZ2BUs/qeDisXNYRwyCl5GbC8sX/z
	/JdQxi6jMHoYyGx7MY5A24NdQLilAdQd6zQLiMA2FEiZSsW0dpqx2iV3uhJofT5BoNF4IqbnKuJ
	2jueGOQtFEn/rFTrT3k7e6QZrG4tiXTicEZXwy72IUqhzb6fr1bKxlbkpKoBTeGQEizbtaIol7R
	g+ogv9ilq1KCk8N2n/1XPOymuplkQHLSVk4RwMYoYq+Jo6fSF6h7NyhVfNCyRrNGLdX8suovTcI
	3oujz2fJKGn5jirFV/UW34sePVVneO8BQNCUD53/wWC6At9GMgzrmQmWpJFmLofY=
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-8434cb01ac7mr914524b3a.6.1781233257132;
        Thu, 11 Jun 2026 20:00:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:1391:b0:82a:5d55:5807 with SMTP id d2e1a72fcca58-8434cb01ac7mr914476b3a.6.1781233256700;
        Thu, 11 Jun 2026 20:00:56 -0700 (PDT)
Received: from [192.168.1.8] ([122.164.81.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acd96d8sm592157b3a.19.2026.06.11.20.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 20:00:56 -0700 (PDT)
Message-ID: <a1fd6b27-6aaa-4246-aa0e-4a9fbecafb42@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 08:30:51 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] regulator: qcom-refgen: add support for the
 IPQ9650 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260611-ipq9650_refgen-v2-0-d96a91d5b99e@oss.qualcomm.com>
 <20260611-ipq9650_refgen-v2-3-d96a91d5b99e@oss.qualcomm.com>
 <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <367u4tqrx4wkwepm3pwlbdbqhsquilhmloxkzugvgmzk2iw6dw@ul25u2ynoyzn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YvncCSYORHneOgHU4zevJpmuhLtjt3Fg
X-Authority-Analysis: v=2.4 cv=c4abhx9l c=1 sm=1 tr=0 ts=6a2b7669 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=DVNErGSwdtF8OHn2hLoakQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Is6qsO8886F9CyN_g2gA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDAyNSBTYWx0ZWRfX1mR0yUb60J1h
 Gc7F7RJh5ATYhA2SvV/d6wAt651cq3IAbQ1BsSyu7KHsxyii8axdTOogE8GYqe+B7QjY5JiyzFX
 SLDrN0+l/Itxvx9nXKhP5Hqhm0wiYic3QFwcrrq6ir9ci3M53oQwOy8hi0QaeT5RZqI0kAMm+xc
 B+0Nlc1sV58SzzXftUcl6fM2cXgtT9jtF1kv/fU32vjqppKQtJjJQFoBkBQlNa+wdNB5vhXPnDn
 cEprV85oC3+oa+Doi9CAw8BMEgr0mHt3q3JAKe4gOP6h5la9Q1z/fHsViHZOKom96ZxXbCSDsP5
 zna292wa9LBsrGwgAb1Aw+AIK0uXWffuH1IPSosxtePnqDGqYd+OgeSFmBIdGKK6ZRGGEMap35R
 Ap6QT1BfBLPS+E0YCHBeOEFfQIZSRk3ZDXr6djwm5N0U1Mm9Yht8F0zG9k15nkLwcPKZWnsOogs
 jhGl7ZAyUT5/sCLPZbA==
X-Proofpoint-ORIG-GUID: YvncCSYORHneOgHU4zevJpmuhLtjt3Fg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDAyNSBTYWx0ZWRfXyPAMmLf4xk8/
 txZDGkbJbPa1N7YLU+2f+iV/Z2Wrq/R/6Ffba0mpdo0nPYJ/JXiOs2+UKX0dm7h9tD3V/Lc79/e
 C43uFkaLamWeB6PAIpDrvWwgvC09AMQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_05,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120025


On 6/12/2026 6:26 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 02:33:18PM +0530, Kathiravan Thirumoorthy wrote:
>> IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
>> PCIe and USB, UNIPHY PHYs. For the other SoCs, clocks for this block is
>> enabled on power up but that's not the case for IPQ9650 and we have to
>> enable those clocks explicitly to bring up the PHYs properly.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/regulator/qcom-refgen-regulator.c | 89 +++++++++++++++++++++++++++++--
>>   1 file changed, 85 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
>> index 6a3795469927..e8821f159ff1 100644
>> --- a/drivers/regulator/qcom-refgen-regulator.c
>> +++ b/drivers/regulator/qcom-refgen-regulator.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2023, Linaro Limited
>>   
>>   #include <linux/bitfield.h>
>> +#include <linux/clk.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> @@ -16,6 +17,10 @@
>>    #define REFGEN_BIAS_EN_ENABLE		0x7
>>    #define REFGEN_BIAS_EN_DISABLE		0x6
>>   
>> +#define REFGEN_REG_REFGEN_STATUS	0xC
> Lowercase hex, please.

Ack.

>
> With that fixed:
>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks!

>
>
>
>> +#define REFGEN_STATUS_OUT_MASK		BIT(3)
>> + #define REFGEN_STATUS_OUT_ENABLE	0x8
>> +
