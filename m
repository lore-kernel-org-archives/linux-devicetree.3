Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD27F41B8C8
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970241; cv=none; b=V2H1JdlN1GWMrJo0H77OT0Das+CnfkOwuGbPc+xoRIl6T29M3eg4EPM9oDf9HizOiUAhFA4dPVG40hmVjRJMCk/gROvgs/YLKprE9/YttbHnQQu6DJCdO4McEVJimwj7gInv7mZ+qxhcILKDI+0a8uUhnpVdUOvRV01kuK4gE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970241; c=relaxed/simple;
	bh=XI5xTyvbfGiAmFocmMfUlPa2OTEVl2XwGWUa7ebZ/fQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhgeToJ9e1UINiVuDF7h/atk16iHbP1TvOc1QCfVaIUY0Xlj3Wau1BjjZ313DS99kom1ixns6NxRlpyEvKA9kZqqpHGb0nVmh3IWhLA8j1HxjANqLFs3CRtwosQwRw+oFsFRtnFcs/OwFFKe2e3Jm3dBYxZQ9NwHNCQKJnB1OdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTe7mwKo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OQEmAdu8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTe7mwKo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OQEmAdu8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HC9wHm2112698
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=; b=gTe7mwKonglaFvUI
	W/VdR/tCuYIHhlhbLWIlAEjoBjWFoSeACqiZp3K9a+FNGw55ZAgKlUaB+KXPNfUY
	S/yhUzlM2ZyaCfBkDXtI4VChJtLvcL+v4ocogXjtrl/Ld4AXv5JzoKjJ9hZZLekM
	BkYp7QzSfCKAIYItA1a2rc+lsLBqiHZfl3nN8cB9ZtV3WDqLSinCZAO7JDvYGxZ9
	AyoeVZpYD9Pqvp3qLpUGhYDmKcBqe9l8sYf6Xr/OGVCOZFQyd5cwvJHT8kSUb7h8
	TZYF+2XjM6YjO2bbcfo8BoLOs/lEuEHzX87Z9gB+7CAtr2FgZuoU0VgeSxu71882
	sSBBWA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xyk8w3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 12:37:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-758dfd578b2so70293137.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786970232; x=1787575032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=OQEmAdu8Fstu8CUT3RMcCu8V8Bp3V54PxHz08itl3Cg57QEm8B+roOrjHsnX8XzKB/
         ec70ZrGMQEsuMtaSF1bjTYhQMHLIkRVT2g88T3GzZjazwdpNiHtdgnw9fbFi+wfov6wb
         2pMxPnIz8YMTCSdZmH1XFHIBDmlrymh5KxzePe0LlIfsNoCSwBFkguBBiIsKk0lEM3RR
         +Co8kBamAhrUZftcWiT9g5q4zwK8gHquJUiqfQgvlR5OgnyBNEgIWamcszDekF0a6Kyh
         D17UtzeUgr4Efue9mBdE+XSAoG5UjjXkPVwB3AXiFs7/XSkrGmqJIAeNNaCWw8Nu0pgy
         wsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970232; x=1787575032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pHVXmskGYy7e0WC7aNcyOMsjPM1X9U5WYkzqH6C0i8=;
        b=CM0nzQu7v2Dnarx/WXFvB/F77z6DvH6PjnQSmKRvCj+4j0oMo8UBVzPpun1hiLkMK2
         /Wl9faTr6HV6CPPq/Xw9kmhCp0v3S78A7tPaS653YM32HH3wRzgXuDBRvBzPzhCiWMOM
         nFAvKyg+qp7+NkR97DMx881/R4kFcHPgHRIxifgOGq34Ho/TNsGijrOkmCMxCEZ918FQ
         bEcaEWSQbl4sF8vfjKeorhgoO7jZtjHyqmSzsMFuysLkzMMhvUTy0v5pn2MdaDEcjL6R
         WMxQdThhbCX0s353v2Z3cmpj5+pCLV12urIiVDO3MnwAPM+zfLpQOteojcc0/4yL2AS+
         fgFA==
X-Forwarded-Encrypted: i=1; AHgh+Rpz65935iAyxyBKusaIvRCNtuPD0wrkAU+1zqyK/m0gjR7dLNvXWKqmSQjLgzyLHbcXwqYE7zlyvZnz@vger.kernel.org
X-Gm-Message-State: AOJu0YxWlZt1FlrC521nJ4tETAma9X+HIhDfMOWkPCBFN/dJJyhcYZqr
	50mb+PVwijR6lCSs7wUSSF6sHAqF16oh8bw0cXMCPBzruDFFwa4zLt1PMiRhd+XaNPew6oPDv+q
	afnALyv7EXWcjMzvvuYNicUirZJjEj20J9wDcCTzNNEoh8nJxV4VCKe7jpB85kF3S
X-Gm-Gg: AR+sD11OuYeSDEzukzUyZtkSNNYCEA0A0VA8UymSxIjVav1c80/IFRAb90KOTQt64Wd
	Ebkn+h3WtRkGXx9gbiVvgXxlc6JSqAVnQkChPB6upohsBXiZUeeThERmrJOSKxt/XnKxOB6ETlq
	HwDrWJqeX4eHPTUc+jF5Aj854nZ+wU8f7D4teUged93MTnfVmj8Rzl9Lh9Psm8xp5V7versGvAC
	XEp9n7AbF84pXOQ1zPsb6xWQ3HnZa0LGXTWKQv1qMUzSc2soJAcr/ShUhFYPvUcP4YoPVjNNaoV
	PmvxJmBTWvGOeRRcgF7G1Nchn+mCaLhdErrtJJV9vV+iwlmWjgGWfShl+NhxsRbOc0yle8fUudV
	Ww78ysd3PaupdgjucJVkkJxyV
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393146137.3.1786970231963;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
X-Received: by 2002:a05:6102:6888:b0:745:17b0:10d5 with SMTP id ada2fe7eead31-76f2cd6ba90mr1393132137.3.1786970231506;
        Mon, 17 Aug 2026 05:37:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00ab34sm362466e87.58.2026.08.17.05.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:37:10 -0700 (PDT)
Message-ID: <34503ae2-9c89-4773-af80-fa7b7439ff23@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:37:07 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/14] dt-bindings: phy: Document the Qualcomm IPQ5332
 UNIPHY USB Super-speed PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-1-8f355d7ff0ef@outlook.com>
 <20260813-alluring-advanced-jackalope-55e5c1@quoll>
 <SN7PR19MB67369ED27F676F6197A0727A9DDB2@SN7PR19MB6736.namprd19.prod.outlook.com>
 <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <71cfe76b-ea84-47f8-9ff7-945d69efbdcd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MDFGH99mp9S7aqRsAcgy00WpKwT982S-
X-Proofpoint-ORIG-GUID: MDFGH99mp9S7aqRsAcgy00WpKwT982S-
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83007e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Wkax7JBLRjVfAwrBdP0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX77kWBdjX4aRH
 cWQkk3xjsdbOU9bmbXyyxAYwiKQ2lPWOpU0U6X8Mtr5n5ZLIcOykAwQ90fdkhoW6g971IOjhL/4
 Rfb8tyGDItVabaxI7YjY2RiQnbNDN/jn5HRSS1V4QeP4NwBsgQpUFjU25UpNCxSuelYtU98aFT8
 U+IlbjeHA8KLi4rPAXSwNgS+qiaEIN8i2+mR+yBy50801OVSsOsvG9VvOIsTpeF34MsW+BmgycA
 OucK/RDIPaAHHkROPy1hZLe/3r3+7Zzii7oloi5S51PMfqsJ6Kq9KAY8uAvBKEjvSVw2NliPkSF
 SfBe+O0Ty2ccVlUGuBA+ygBJJMlWtQEYAnf+riGOaQk81vCy/TL8WDINkaHs7M+G+buLHB4TTdt
 JGaBJRhAiBvwOO2kj49omyyyuLKqPbRPterq2qzl0oTQuDnlTd8pl5JHrjqnzkZFsXlD7o+Gybk
 e+VcxI1u5xB8G9f3cRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5NiBTYWx0ZWRfX6Xdq/iBygENe
 5dK4l0RM9QWcImulHq6XDWlFljpK14zyqIPXnVJxEufLc/lyrfK+T8bsZE5PQ7O3BOMaZTeDN0o
 BTFG2ERXO3xERaH0rvZLhb/cuJ2yGs8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170096

On 8/13/26 12:48 PM, Krzysztof Kozlowski wrote:
> On 13/08/2026 12:28, George Moussalem wrote:
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
>>>> +
>>>> +    phy@4b0000 {
>>>> +        compatible = "qcom,ipq5332-uniphy-usb-ss-phy";
>>>> +        reg = <0x4b0000 0x800>;
>>>
>>> That is the same address as PCI PHY, so you have one device, not two.
>>
>> yes, AFAIK they're separate PHYs (pcie-28lp vs usb-ss-22ull) sharing the
>> same MMIO register space in IPQ5332. To enable USB3, the compatible
>> string, clocks, resets, and related USB3 properties override the PCIe
>> properties. In IPQ5018, the PHYs have different register address spaces,
>> hence representing it as a new devicetree node.
>>
> 
> Same MMIO space is same device, IMO, especially that you have the same
> registers (looking at the driver).

It's indeed one device, fittingly named "PCIE+USB COMBO PHY"

Konrad
