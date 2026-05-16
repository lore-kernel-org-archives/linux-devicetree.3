Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC3A2BDC23
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 07:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778915042; cv=none; b=Ym69l9mUGwi6oS6vOGPLWXdu4/lNWWtbqcyhDX1Pd0hPG+qzXCj8AVBpUs30VkXIIeQjWUkyfweURr5gjQZPSCywrxwOzXWqKCSljkwgpK1Q0RRYr4XkCwFpOSyqDCwzxIeCwHxBqwckrlrrQIOiv2p04ZJ0Yfdi6WZgp7Q8fNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778915042; c=relaxed/simple;
	bh=QN2x9GSk7lruQdFlnqtkHlY9/80BHtXSKUREZrFq8Dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfE/w4gwYOLWzxY2tFwJedbgXyHo2o4Rd7N5ZDKCZUlvhhN/mRgpkkukuChAgcu7qK6GEzUTEnvTc0s3jEqHXpUpzp5f97ZCvAOu8yx/JAWY04uUfrHacCG4gcD16AuYjLOedQE3g6ok1mnuHr45B62eHJL9vF0JSeZ3N9J/uXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCwJAiOJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRbflfJQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCwJAiOJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRbflfJQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4nOkx2865797
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 07:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=; b=DCwJAiOJoMb432Fw
	xhYbg3q4w3dp960CN+w6U+OD2eWQc8ZmxM9ExzrYGnQVMz9+UGy+DvGBpyFbb42n
	ifZRXWA7uHil1ckAHqVu00xHJZwc+Ep6waQkWLNG8bo9WYmtVgvFG4DhJr7u8iIJ
	SD1pibotmxuQdm98meCt/0yDRGY5/8eYfs65gPM44r6mY8BIFul/ybM72QsSVFqg
	BkHe4RpK38q6IABdypcbbnJUPG+DQfKEKaTSEv7GrPrlwurN7fMOq9lzoZNI+Jmy
	UoMU8pO/Ghp32T4H/4wBl161VhcrjNAhVRHnYqaAF/EOFx0KMghMkFY5xyug9jfO
	9rjoJg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7r7c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 16 May 2026 07:04:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-365fd467cf6so438058a91.0
        for <devicetree@vger.kernel.org>; Sat, 16 May 2026 00:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778915040; x=1779519840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=;
        b=LRbflfJQ5FMTuQ/J+08wGZn7GXYMW/Wkr5lUSat57HxjlWQSpR2EeL5hU9m76XTejW
         XvEk0Pu37m5d/qSFtWwqWqweg4m8u8CBYeDutW21m4vqzABPfs+tiYlJxcMuINnoW3qj
         8PV6ZrcZBfwgOi5GXqE3aHOfgbXiBsDtVtMiJ2aBIHSnlO8HUNHQcMN/wU09DRf7rw6H
         I2xNobJfv2SScenkdSq9jy76E2DV+eqofaGWvgO9aW17Z0layHpw6OCDYK2MXw9fHN/3
         Zc+GDFpBp4I5qkBD9G9X0HLeLYI5fmNDjbxzKsOHT60NVy7H1qq8R75zgRSsl1E6v/0j
         5bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778915040; x=1779519840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXNiHDMYaqzcjjrNvjUNJdNUgOI+VkHcu12M9jk3xGQ=;
        b=dKyXooAQ5YkQo7Tou/lruS/qBwlaI7LnQQZ8QNBx9d5vOjOhjLZNIQbh5csS0QK2Fm
         uH0VVm2O3vURsbdrANYxHn6utuhVFEtMCb04wxhVbaYvHGH4KXUtG1OnDhXH3X0Sz1XN
         e2L0GinFH6YmPiHQd850AfS26taTdHL/ZaM37470rBsXE3+N5vT7Izu8JvZmQ/JZ0kKV
         C8tRgoZiONGymeE7nHP2WcKb1MLk0gqGfXSEkI3OzT1dqOCYMNbhOj9fYNrUqBdMzuj7
         8+qze9BcrpZXohq9iB6c2mhCmwNHiBSL2U2zTq8/2cqw9JoGea2K+vXJZbTIoBAYz3xn
         Jemw==
X-Gm-Message-State: AOJu0YxllN72phXYO5k8usVhhJmrDjM6F8EpO27HBaoNJ4hdwgcZocy5
	wO1RheacsBTcdbzanw/HlWeUFVMTasqLIzC46H8nAN9TtBlvgKUrUWcBIeZxFgbqWiSC1aP42c8
	WIXoEziq8iL1D5DsnPAbkz64XxI5ZNuOoCMdqKTf0YDZojb9iOtsgSBw2rkZ8iB+R
X-Gm-Gg: Acq92OHIobdFTDEpIP3uRomdrkSgSqxpALKzfKZOkyWpZvYBMmWAtm+HG9vpizQRMBF
	mPxHmUSvIOrslqGWM2yf4nvAilVKLz4VO/hyDvn18tGlANVGvAO4wnv0/3nEQd6GAIo/R0pbxDO
	TcAJ7ZsbZ8QAtnUVncT4JomK59IBMUzcvgcubS+8LXNQQKGSjWKO0eZZpxj5jmALV7BnFzITsQJ
	N7pCdJUX/K9wI4iqWGIynSHsSiRmHWwjDGzOeYrFUWJK34Lqut/bgfAFXOs36o5CBYt1ggRLSBu
	507e2OhPcRQuckSdrsioSTSaJY2zsy04QR12PejHEf+NiCEOTj5LHqH0iauMAy1/5+6hAFdd0aw
	08sPGuHs53LLccnULE7WKwPfSLtv7wRn8eeE8hBN/sfhIQvg8W+o04PVVhz9DsgUR0LGVnYC9Ak
	rgXAp+66G9e90HwXk=
X-Received: by 2002:a17:90b:38ce:b0:368:d8a1:3bd4 with SMTP id 98e67ed59e1d1-369519e2088mr6591097a91.3.1778915039587;
        Sat, 16 May 2026 00:03:59 -0700 (PDT)
X-Received: by 2002:a17:90b:38ce:b0:368:d8a1:3bd4 with SMTP id 98e67ed59e1d1-369519e2088mr6591074a91.3.1778915039080;
        Sat, 16 May 2026 00:03:59 -0700 (PDT)
Received: from [10.91.222.120] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695126fc8asm4699885a91.7.2026.05.16.00.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 00:03:58 -0700 (PDT)
Message-ID: <d22e0834-4ab4-4b33-93e2-6a913889884d@oss.qualcomm.com>
Date: Sat, 16 May 2026 15:03:54 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: sashiko@lists.linux.dev,
        Qian Zhang via B4 Relay <devnull+qian.zhang.oss.qualcomm.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        krzk+dt@kernel.org
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <20260512010904.12442C2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
In-Reply-To: <20260512010904.12442C2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDA2NyBTYWx0ZWRfX/+KWhzAuxj7O
 9MwqxgLcI96zGbvarIJiT9vjbE4kHbW3l4pl6+WW6XQLUuuKb0hxNHxTYd4dwUwcMcwuVFh7FWV
 vr+H8wKnuHfeKZnYfhGZzqYaSb7em4zKh2M1g52MZbkPoNZW5PXdWfX7YZXtVSc7eooVx+6YXI8
 I+f6LzpvfjHYpywS8wkdCiUJHxzchfhEgiK2rqd6YsIHLf56kHPlqqWjf8aFUgXYvQCCAf3eUgQ
 yO45qWScpuDNTYKY1Daye/w2gbrKgss2DL3cmSmI8dd6raZN1SmN+I8nk3qQxwx0b+wnanL938D
 ruX6nxdjych5kjBaUpz/r9Ml8hii0dV0stqdYj28L7dfhN03m4SERt/BIiEU/uwaPHT8K8sN4nR
 LfKhv408BSicSiSyAwnoTLMUeOsrMa1RgtJdN90qz8NrNOrn0FMt59/Q01OL9RzvKRQyCkFV+Vu
 63ugoTUc3Tdpe4qB+vQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0816e0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=igHOnw3Yc1Eq9CvWKzsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 94ULpRjtyx6UK3Z89VO4_fB1vqzTvG2c
X-Proofpoint-GUID: 94ULpRjtyx6UK3Z89VO4_fB1vqzTvG2c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160067



On 5/12/2026 9:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Hardware backpowering flaw during system suspend due to uncoordinated W_DISABLE# GPIO and M.2 power supply.
> - [Medium] Missing `pinctrl` definitions for newly added GPIOs.
> - [Low] Devicetree schema violation for the fixed regulator node name.
> --
> 
Hi,

Thank you for the review.

I will address issues 2 and 3 in v4 by adding pinctrl definitions for both
GPIOs and renaming the regulator node to follow the schema requirements.

Regarding issue 1 (the suspend/resume power sequencing concern), I will
provide detailed context about the current situation when responding to
other review comments.

Regards,
Qian

> commit ea2590eabdbe9514777a7849913aa724f8e8c30b
> Author: Qian Zhang <qian.zhang@oss.qualcomm.com>
> 
> arm64: dts: qcom: arduino-monza: add WLAN enable and rfkill GPIO
> 
> This patch adds support for the QCNFA765 M.2 PCIe WLAN module by modeling
> GPIO56 as a fixed regulator for wlan_en, and GPIO54 as an rfkill-gpio node.
> The regulator is linked to the PCIe node to provide power sequencing.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> index ca14f0ea4dae6..e0ffe87bba90c 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
>> @@ -153,6 +153,25 @@ vreg_nvme: regulator-3p3-m2 {
> [ ... ]
>> +	rfkill-wlan {
>> +		compatible = "rfkill-gpio";
>> +		label = "wlan";
>> +		radio-type = "wlan";
>> +		shutdown-gpios = <&tlmm 54 GPIO_ACTIVE_HIGH>;
> 
> If the bootloader leaves the pin in an alternate function or undefined state,
> the kernel might fail to control the RF kill state reliably.
> 
> Does this node require pinctrl properties to ensure GPIO 54 is muxed correctly
> and has the appropriate bias and drive strength?
> 
> Additionally, the PCIe controller's vddpe-3v3-supply is disabled by the
> pcie-qcom driver during system suspend, dropping power to the M.2 slot.
> However, the rfkill-gpio driver lacks PM suspend/resume callbacks.
> 
> If the radio is unblocked, the SoC will continue driving GPIO 54 HIGH during
> suspend while the M.2 module is unpowered.
> 
> Could this inject a logic HIGH into the unpowered module, causing current
> leakage that prevents deep sleep states or damages the hardware?
> 
> Would it be better to synchronize the power sequence to safely deassert the
> W_DISABLE# pin before dropping power, perhaps using the pwrseq-pci framework?
> 
>> +	};
>> +
>> +	wlan_reg_3v3: wlan-3v3-regulator {
> 
> This isn't a bug, but the node name wlan-3v3-regulator appears to violate the
> fixed-regulator device tree schema.
> 
> According to Documentation/devicetree/bindings/regulator/fixed-regulator.yaml,
> fixed regulator node names should match the pattern
> ^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$.
> 
> Should this be renamed to something like regulator-wlan-3v3?
> 
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "wlan_en";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		vin-supply = <&vdc_3v3>;
>> +		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
> 
> Similar to the rfkill node, does this regulator need a pinctrl reference to
> configure GPIO 56 properly?
> 

