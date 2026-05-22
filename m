Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104B407CEC
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460088; cv=none; b=H6Ig/TDCfsQ3HVrci3vvdUOoeorrDRS3B6PBgUI/73pdzXb6dzyWtq3DGaLVy5z7Se7ipB67r1Co9BvlU12YD/0I0GNxOgkBTDUuQeH+AzVhYJry2BJ6LTINMAVPD1/8GoDIMkJIedG/tpsTQ0CYQbtGp11hV1mytEb7mc9Si1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460088; c=relaxed/simple;
	bh=IcFROUShVBIgeGJfb2Z5AWQn533juwvp5zLQxg+1oY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2G4MczYUn1B9Y7vDnHNlXV5UJcRtlESMq4UOK6f4Dx2yQkw0qRaQHwOMFJteTWoaH6hIdqv5ziBzXidIgBKJrvyyqtAVnvkZU6bnGFLUrOHgonivnJYFi4FsIh0m25d2/XeTb5Q0SOMfRzrojVLTr22Dor42cV3Tb91nUmJMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iKoFTCqS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7se2hgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iKoFTCqS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7se2hgb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8RZ1h2765100
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=; b=iKoFTCqSXvCgnqfQ
	wePkIcOBt143vhk+Uq5WxLeW5XnBrzyplItZOV/RZRBzsx9Ea8eZvKnmA7WZ6Vei
	mDQYIWItIsr5ovkwKOojFKaa1Z8riLeEVe65FS+NqQ0TH2bNImDJcq/Gt6vc3eua
	x3Lwf5TMHtEkITBiAhd0RFQ+1CsX7JgdQow09iL05Rp8TvHK7pj2C5uXAYH1sB7a
	S0XdwBR/oO3Lba26wFDz4EwDbS0vrBWxs1oOQePtHZbaixx3zIGfAs87DSRdsJ/V
	2UNDi+IOtV9L+g2QZf/hWsvW2wsDsjnh9Mv+TGeejDSB9XicXjF+4WdUMiEicNpf
	WvxxIQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea3u7wc25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 14:28:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so4817168b3a.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779460082; x=1780064882; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=;
        b=E7se2hgbNJ0tuEV+F5BFdgqChjimZQtELU5/NjrUVGNxSmNLw4mFNPKfr2hngjx/1s
         qAi5bJ55Xs4MWhoEX4owfuYWKZ2myPDFG15qClmvFijDHDYO1RmvIWiUwQT81gBIl2h4
         bVFAsD+fy3KZkMMA+ozSyBtxbhZTYZPGmorjfMr8dSi6aEsrqoN/037lLJA0KBIhGcgw
         86xbeguArv1c+2icr5KNDMe4VPy9lQTwYgXoiyHVzg3ONd23ksEx2pr0ZosWYE2kI/2o
         o70zu/9em8QAs+FHXBKPwilOSx/6Qto1VHg1joVYM6ylLcX6+aHNQqyt4Y9x/cHfJfN5
         saIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779460082; x=1780064882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDhAoltlaw1s+bb8wQYhsM+Av96Qttuem2tUfK7aq0A=;
        b=F6BOKqGkWgtiEm+RG2Gii0khtqhj4+/Zc0Mb4lPs6Pf3xMYLfdXLmvj/I6P/bnVMnZ
         sCNt35/RCR+caLmayObWLnxMfpF9k9SUaqlACjr1OUhZmNaoUmOAS4lVX686b0pk6YUz
         SrzCxv25UvMJfU4mm6T1FE4gbgntRJ3kzrPCVN4z4YVsvoqhejVsb2+qjDYSRcxzPfHJ
         PxpF+FHLIsIQhhwv2PVDRj2CiOVeJ6KTia4okKtG5HOPXOAwloC/zul2Km1jUdsycWco
         Zxpnvfqtjefd8JU+oqW89G0NE0oZzvSYz92SrQit8Zk61xT1EutXkKXzB1aJQDNbvS2w
         NUVw==
X-Forwarded-Encrypted: i=1; AFNElJ+td3jcR6We+IUkqG9WOCH2YvlSYQQwSUTXgf7uWEvRfzDY44hwY0PmVruw+UVxUEIrVtiKQxLFcTTL@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIeP9WyWsvGO3AkKAO0W9kq49eorKS5gLOPNo/kjMRPfqdXmZ
	SM+ey3DVRAFspKapAB+xNw7geIWy/yKXua8EjkWTgAvPGJpScwnPEGKnWNJr6fkYRFcmuJbQtyC
	VodRqSkbS+6v0+Jad8d2vNaHzstXal+YVeyf1k2lpl12b8kQnrdFg++Ay5Hv04ZOd
X-Gm-Gg: Acq92OHpSNg4ucxrReWWsQvuB4EU1c4SRoZxpb9HyigxnZRiVMTzLLZenq2FBaunFtH
	otJ2OAWMxWPIhl4Mp2q+UKV9EwDx0OCZ9QRipDHvLjsHR9vUp/oWfqifx5bofVesa6bV9Hyo3Pe
	XxmXvxHI2KxF0BhNQS4LZdGCZ9a3sSdAPlGoeDPr/bfsRK1NbcMVu1Cvn5N6tVSOb/in0OmfQ5q
	Sg//ZaYA3rT4x7k+4qSEAUd8/fuSdAnFYkKwsfmpWm/Zf1eL/BpGMBAZfITHmiM8xLcYM4TTI3R
	m/+eHDctr87p39iwbsmSOUdAWV6zReRFGVduTsGczLbYbPDGuP/gxz3oHXeD+wL0eenjk5taLDI
	KW4VxqI5GJLOunNQcXXElTwUfrKKwVUQd5Qj7EKEk9Syikvqk
X-Received: by 2002:a05:6a00:cc3:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8415f5a64e4mr4193236b3a.24.1779460081896;
        Fri, 22 May 2026 07:28:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc3:b0:82f:9985:d4a1 with SMTP id d2e1a72fcca58-8415f5a64e4mr4193196b3a.24.1779460081319;
        Fri, 22 May 2026 07:28:01 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd8127sm2039826b3a.50.2026.05.22.07.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 07:28:00 -0700 (PDT)
Message-ID: <b6d9cc45-0218-4186-88c1-73a2a57f5ab4@oss.qualcomm.com>
Date: Fri, 22 May 2026 19:57:56 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: Add Shikra CQ7790M SoM platform
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com,
        conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260519-shikra-dt-v2-3-c01b90fb4395@oss.qualcomm.com>
 <20260519120238.1C84CC2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260519120238.1C84CC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aIXAb79m c=1 sm=1 tr=0 ts=6a1067f2 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DQnpCjiGftk-ZKpXLgcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: kreP_-KeTjvO8o9gWZEerTo13CJe1VOn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE0NCBTYWx0ZWRfX1SKl8//dYARy
 tMq42L/FMlrG5nu/qMmJ14AUVH6GO4VWJuLkSzJiaq7pRObfcGefAISID8sfoWUu86WXEG29zr6
 sH2Du4+klh04eH9ac6bFPRczIE+BIj+FJkeTjINUMq6iBkcjY6bHUVlcqkMCLFUXE3ZMUicdVxg
 A5eOiBYi4ZL792iAZj63c0fx/EvrsXg84TlwqgPKg5oeQtwXEjQro6SBkeS1vZDNS2WHv3/+B2L
 2CpnxeAue2h7pavmcDvOROnHS7Nat+G11mChmgXxeQVhHSuvBHG81bNo7IOqccaL3gHSPXc9Zx6
 GtG0z0oRTc9BHspldYVgam0UA31F2bXSxcFGBSUKurrHa4vtKk+zmqBttfSqi0UE+Rz70WUnAGc
 EMv0FkSM4FGiLIg38+p3Wfgc2qn9dRDGHjUdEQvRQvRHh0sWvQQ4ni2jiY/f3SnCRcjW8DSI0pm
 jc715dHyJeHw4HqeFMA==
X-Proofpoint-ORIG-GUID: kreP_-KeTjvO8o9gWZEerTo13CJe1VOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220144

On 5/19/2026 5:32 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The SoM device tree partially defines PMIC regulators (LDOs) but completely omits their internal parent SMPS regulators (S3, S4) and the required supply linkage properties.
> - [High] The SoM integrates the PM4125 PMIC, but the device tree include for the PMIC's SPMI components (`pm4125.dtsi`) is missing.
> --
>
> commit 1edd30ea88da411f667f786ef5494cebf1420c78
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Add Shikra CQ7790M SoM platform
>
> This commit adds the device tree include for the CQ7790M variant of the
> Shikra System-on-Module. It includes the common shikra.dtsi and adds
> PM4125 PMIC regulator definitions specific to this variant.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> new file mode 100644
>> index 0000000000000..401e71720519d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> @@ -0,0 +1,112 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include "shikra.dtsi"
> The commit message mentions the SoM integrates the PM4125 PMIC, but is
> pm4125.dtsi supposed to be included here as well?
>
> Without including the PMIC's SPMI components (like pm4125_gpios,
> pm4125_pwrkey), it seems carrier boards won't be able to address or utilize
> these peripherals.

Will add in next revision.

>
>> +
>> +&rpm_requests {
>> +	regulators {
>> +		compatible = "qcom,rpm-pm2250-regulators";
>> +
>> +		pm4125_s2: s2 {
>> +			regulator-min-microvolt = <1000000>;
>> +			regulator-max-microvolt = <1200000>;
>> +		};
> Does this regulator node need to define the internal parent SMPS regulators
> like s3 and s4, as well as the vdd_X-supply linkage properties for the child
> LDOs?
>
> The driver drivers/regulator/qcom_smd-regulator.c expects supply mappings for
> pm2250 (e.g., vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12).
>
> Without representing this fixed internal power routing in the SoM's device
> tree, the core framework might not be able to correctly manage the parent
> supply voltages and states when child LDOs are toggled.

This can be ignored, refer discussion:
https://lore.kernel.org/all/20260519120238.1C84CC2BCB3@smtp.kernel.org/

Thanks
Komal

>
>> +
>> +		pm4125_l3: l3 {
>> +			regulator-min-microvolt = <624000>;
>> +			regulator-max-microvolt = <650000>;
>> +		};

