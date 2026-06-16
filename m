Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AC13624CE
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614878; cv=none; b=fkPHkprjtJYfGrAaeffsZLhh/ZT3QJqaoqpvz/o1Sey2Zdc6+yUF+4VcpQw3uw+hOgK7pxkIDBXeYa3cyVNI95repQMotsG53VHq67sVANi55gObekVope7eEq1zT4A5XM+tE+NnO76BQCJezUs7vchW641FUMqmu0IfzI8mK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614878; c=relaxed/simple;
	bh=Q8PscY4i6kAs8tZLAGdIxK2jkw8Fv57hBjZQXqTsrQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5O5/xeYOxXrUY9DV1t8tgJz8hqLmo6jgG7qxNX2pdupXfLwDeZSYeIuFL1+IJ4xy1S9tupdUcaatDPAjDZGRpQRQob3uMqct8QoQGGLgsAas0RLcRY53KUjZ85ASYtOwEphvrybcr3gnBdRkdWvlEc0Mbz5e7J0dNTASKg5Uqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SCWelObh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TSexLVey; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SCWelObh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TSexLVey"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACUA23474747
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=; b=SCWelObhU+e4RqRp
	PelWXjWnP9k4r9ezD3r+jPsn868RocnGdlsSMZcltEQW8oKuWBqetyHLduXl5nLr
	MGTotqNaaXq12eJJROhiPpVKg5CqurQWfcU04Nyh9pLjh7emRE6E1Ffs0sQsuTIX
	X/Zibhl3+cIVb3ZXErAMafVb2iVBScjMqyVI5TOQfdzCE2xo5fvx9x2JwvCWZHot
	j+pP29W2EO87Uqf0eShnnJC9MTsc9epjHcDtvcR0AkUoWW/1rjBpqBnXjDhnJzd0
	Una6LObqY9Z2fyDBjmxeMGqXWuqW3bUsXXO3tSsJOPO93TGbtwciHQejAAIyAfXQ
	1CgCvg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52t498-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 13:01:16 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6e0426fd3so2202231a34.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781614876; x=1782219676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=;
        b=TSexLVeyk6dLIP/91dY9Wj3bq864vfZPtRKfo4t/RgNSaXfU3OyNtj7+94Fcplc/Qi
         1C8EN6SjOwQ+CuVSEG8kPMB5lZccGWjiGz99SgaQ92S3QzDdxXJbu53ZLx7foT8JKrD/
         4UzK1zmPC4pKdcm26ic3cAc1shd4zDaHKOvC7nzIruOBdOCdGqBYHFavSY8hA5enPqMs
         tNFftXP0IsIS92Ehk52t2FBzU6DYxa2odSKhUgEbfKGUM4iXdBlmsHyiGrQXgAL0W+4R
         VQmzq0nUWuufR9O9ui4jboYWyRIS7ysTNVafz7o7RrDuAdIoglCwCMJtwojvHBLYYbU/
         FOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614876; x=1782219676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PbG6qpebkxF5tqbMEKSZ7WqKDcIxGrR5pgwEO5vnHs=;
        b=hJd4YjCZXJV24e5Q8goychnQd8B7S2gJf100bBa9ZS825WgLiL62P+lySzXZiZC2aC
         uF6uAvJbwXEvU8y2hBKEPN5sx2i/W0zmlRg0DeqND1JE547CrSTE4512LxaPcYypSdQe
         TSNHSa+yvjPmMd+zAnhs6Vo7/wijQlKIrgVLrsA+nBxt15rx8ZAHHE1JywkEgtp8UM8k
         wbPdjPBETTSDd7Jy7zF+RhIYb67ZH0ICXv+OIK0ruINy558IPv4urSKd2VdNZ/1g3vDq
         FRTNvMDs2dq5+3BDt6/eJca7sJmVhRxtvlSIaFedevwZNQE9Gdcw6Dh+5Y+XnRMjftwz
         ytUQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E4ej8ds3WbQX8yuHlsN33eA/CnJgIACi871iE9gpDkU3OJU8weSc3P3c77UI+sKtS6SxBmBzlsw/M@vger.kernel.org
X-Gm-Message-State: AOJu0YzSs0VldYovC9mgx0aFM5xbfwHWjOOTzyqZBELmf9HqAo+8upO+
	nAsNAZ8INV9skyqF/jT8qmsHHtvo+B4ZoEHOWpPdvkz2V2RSHnwecPEqbxU3lSuPirxSOWTp8Bl
	pVPcuEyj5jmgsCxgm3YZtTsbp7nBnMiBgwRDHzcY2AizxwHfvg489ibB5iRU2VSer
X-Gm-Gg: Acq92OF8qn4U73VG9vfrNXzA9Cml/dmPkSVfrePjwGmrx9dhRD5pxjLIepWPmH3N0AN
	AUQXtSlHqzTEy4DcdZgntgFx9aefSn3yw3uqErLN7ri9lOxDGna81of7nxktsd+2DmLdMv7RUNj
	tDWG12wW1kDqAiFUTq6Ma/OFTC6i7PSksa0eiP5t569nPykQ+Ir/GICuOTBBXWGeZJVTXton019
	/C+20tWO3uHmbfwtHVmkPUP6D2h0+rp+ScJSgxFKDVQ6CiLlnUDQ37c0BP8N01/0JOjGPxLampa
	wTkEwB8rIRpoGTJYUfiWoSkWGgpUh9ABm+iU1CYxJlOAQZ+N4Z6b2rgT/VkErUnhkzqYbkyNoVh
	RAlrp4LcZYfSzXWBkjzXqtjCYUy6Wfy5Iys3wQk/Py0I6jA==
X-Received: by 2002:a05:6830:81d9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7e784678756mr7657923a34.1.1781614875503;
        Tue, 16 Jun 2026 06:01:15 -0700 (PDT)
X-Received: by 2002:a05:6830:81d9:b0:7dc:c92d:977d with SMTP id 46e09a7af769-7e784678756mr7657881a34.1.1781614874783;
        Tue, 16 Jun 2026 06:01:14 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b499dsm3484915e87.78.2026.06.16.06.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:01:13 -0700 (PDT)
Message-ID: <de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:01:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sarthak.garg@oss.qualcomm.com, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com
References: <20260227105055.2364348-1-monish.chunara@oss.qualcomm.com>
 <20260227105055.2364348-3-monish.chunara@oss.qualcomm.com>
 <2ra2apfephjl2au6wel25gbxoxyvohf2ysq4yzaufp3xb7mtoi@g5p6asbk2fqe>
 <aaWdjuqvhpJb1oSX@hu-mchunara-hyd.qualcomm.com>
 <3aaf273a-c7da-4740-a68a-49f5d2f5309f@oss.qualcomm.com>
 <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajFB7FVlqp3qCA0i@hu-mchunara-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzMiBTYWx0ZWRfX6DjwplX+u3Cs
 Svyw0u6CDNP1pFnlQr6uHAwb+ebnkdz83qVZHDslgI+qLh+QXwQt7zV1RcRJWPTX5N4U5TEJgBD
 lBlHolVvlKZRBseyVLFe6FUqDupB7ZQ=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a31491c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sLJ76Je8dalr12q184QA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzMiBTYWx0ZWRfX3lkJ5Ac9Sj6Q
 NUAOXDrDMMaeBbrREgcoWJCPhNFSY9r/fjqLIiOlUbzkeR7Dd9yAcuNpzR5ykjABDiFLRopMAVr
 zzcNbI06SpTCmKOXJjzusFOvUGe2iyJOqvVMGLIuk/jRTtsdMugoFOX9ghkjjBuvV4VDFmmer1y
 CcYtoa24I9lCwkFgbwI8Al6siSqCbB9Yxq6gxf0lPN6mPyP1qMbWi+MlQ2zAELGgwYDGtPrTbMS
 RDTFNHfsvZlcSDlfMcFa5Eu4v5UlbqxbFvm3vJcL53rhrtxGVso2W7SQ9ILghALoAWJzQ8s59Mn
 5/j7Gx/Sq6T//nvggd4XuINjSTNx6u3HcZwbpt5MGESRNTiQFrATWe74ubTNVksSmzwKIR0KArt
 dLN3ZCXToO71yakXpsmDEFWPy6cj7dQPhgDK8byjhqsRPQOmDqcsp8XhLR/8s1wQIf+S2lvhl2q
 33mB4BZIgLlCreEXK2g==
X-Proofpoint-ORIG-GUID: AB8Yj9ss9rA8LwwzcfPh7eKqCaVQ2nRB
X-Proofpoint-GUID: AB8Yj9ss9rA8LwwzcfPh7eKqCaVQ2nRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160132

On 6/16/26 2:30 PM, Monish Chunara wrote:
> On Mon, Mar 23, 2026 at 03:15:09PM +0100, Konrad Dybcio wrote:
>> On 3/2/26 3:24 PM, Monish Chunara wrote:
>>> On Fri, Feb 27, 2026 at 10:03:10PM +0200, Dmitry Baryshkov wrote:
>>>> On Fri, Feb 27, 2026 at 04:20:54PM +0530, Monish Chunara wrote:
>>>>> The monaco EVK board supports either eMMC or SD-card, but only one
>>>>> can be active at a time.
>>>>>
>>>>> Enable the SD Host Controller Interface (SDHCI) on the monaco EVK board
>>>>> to support SD Card for storage via a device tree overlay. This allows
>>>>> eMMC support to be enabled through a separate overlay when required.
>>>>>
>>>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>> ---
>>>>>  arch/arm64/boot/dts/qcom/Makefile             |  4 ++
>>>>>  .../boot/dts/qcom/monaco-evk-sd-card.dtso     | 72 +++++++++++++++++++
>>>>>  2 files changed, 76 insertions(+)
>>>>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>>> index 317af937d038..c86242a1631d 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>> @@ -46,6 +46,10 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
>>>>> +
>>>>> +monaco-evk-sd-card-dtbs := monaco-evk.dtb monaco-evk-sd-card.dtbo
>>>>> +dtb-$(CONFIG_ARCH_QCOM) += monaco-evk-sd-card.dtb
>>>>> +
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
>>>>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
>>>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>> new file mode 100644
>>>>> index 000000000000..a0bc5c47d40b
>>>>> --- /dev/null
>>>>> +++ b/arch/arm64/boot/dts/qcom/monaco-evk-sd-card.dtso
>>>>> @@ -0,0 +1,72 @@
>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>> +/*
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>> + */
>>>>> +
>>>>> +/dts-v1/;
>>>>> +/plugin/;
>>>>> +
>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>> +
>>>>> +/ {
>>>>> +        vmmc_sdc: regulator-dummy {
>>>>
>>>> No dummy regulators, please.
>>>
>>> ACK, these will be renamed as per the schematic. Since these are direct supplies
>>> on hardware, used fixed-regulator configuration.
>>>
>>>>
>>>>> +                compatible = "regulator-fixed";
>>>>> +
>>>>> +                regulator-name = "vmmc_sdc";
>>>>> +                regulator-min-microvolt = <2950000>;
>>>>> +                regulator-max-microvolt = <2950000>;
>>>>> +        };
>>>>> +
>>>>> +        vreg_sdc: regulator-sdc {
>>>>> +		compatible = "regulator-gpio";
>>>>> +
>>>>> +		regulator-name = "vreg_sdc";
>>>>> +		regulator-type = "voltage";
>>>>> +		regulator-min-microvolt = <1800000>;
>>>>> +		regulator-max-microvolt = <2950000>;
>>>>> +
>>>>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
>>>>> +		states = <1800000 1>, <2950000 0>;
>>>>> +
>>>>> +		startup-delay-us = <100>;
>>>>> +        };
>>>>> +};
>>>>> +
>>>>> +&sdhc_1 {
>>>>> +	vmmc-supply = <&vmmc_sdc>;
>>>>> +	vqmmc-supply = <&vreg_sdc>;
>>>>> +
>>>>> +	pinctrl-0 = <&sdc1_state_on>, <&sd_cd>;
>>>>> +	pinctrl-1 = <&sdc1_state_off>, <&sd_cd>;
>>>>> +	pinctrl-names = "default", "sleep";
>>>>> +
>>>>> +	cap-sd-highspeed;
>>>>> +	no-1-8-v;
>>>>> +
>>>>> +	bus-width = <4>;
>>>>> +	cd-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
>>>>> +	no-mmc;
>>>>> +	no-sdio;
>>>>> +
>>>>> +	status = "okay";
>>>>> +};
>>>>> +
>>>>> +&sdhc1_opp_table {
>>>>
>>>> Why? Is it specific to the device or to the chip? In the latter case,
>>>> please define a separate table in the monaco.dtsi and switch to it here.
>>>>
>>>
>>> As per the previous review, it was suggested to use an existing table. But yes,
>>> this is specific to the Host controller and the corresponding voltage corners on
>>> the chip and can be defined as a separate entity for SD card use-case.
>>
>> The SDC programming guide I have access to does not seem to have bene
>> updated for any recent chips. Are you sure these different corners are
>> *actually* valid? The clock-side documentation doesn't mention that
>>
> 
> There seems a gap in the clock documentation. This is being communicated to the
> corresponding stakeholders. However, the corners mentioned are as per the
> reference platform and will be updated in the subsequent series based on the
> updates from the clock-plan PoC as required.

Thanks for chasing this down

Konrad
