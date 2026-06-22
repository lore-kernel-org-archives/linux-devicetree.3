Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75319CCFA
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782126105; cv=none; b=KFOr2X4zAghliCq/EMTFY5VVyrWd6Cm/hqEmdpb24Vaasa2SoG/dMVNQDa8O1pmJcdMVmd+R137bLs8Psws2b9nImNAgm2jhKhoaWDNSqUWWs1NdKyJfSjZIHWNxfIpVffTL4OXS6d56IDAtrSRLunvKRvQ8QhmPScQZBnDnyTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782126105; c=relaxed/simple;
	bh=NDQUSnItSW38oUJTEm8zZeXFfK/1bxhGeF1F7VfHarA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U/qbcgOSgF0z4NpO2gmSFnNy2aO0nvDtzL+sWRd4vhAgKBQc51TV4j+kc9PniM9f9urFl7kMzVznfxqHGqQ/awFYyw/4jG7lFGK+26hoFu8+u6+Xh1DiAaAIplGFQo+zgs5T51tygfEZmKeSqrOoqUaztT1tTCxjfdljxoP9/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a7wLSAlG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tqq/lYPM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a7wLSAlG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tqq/lYPM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnWCJ2063091
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=; b=a7wLSAlGJ4kyyYYH
	cemNmeOIbU3IZNPy1FyLqpUR/mNR1hviUFtMuS1oDxwFA4Tkvj+e6JnDWI9oEkOq
	hSmX2LhrBQciyatQSJAHGUSI/QqStP716PSzPGFw8Q5DMbVxDxzgJ60OUb9PeuJc
	9/VYn2F2RNHYkZ4OHHqodJNqkjul8/WtRfV0n7Vbcefv9aYXtFWQYFufhmwtH9+K
	/jkUgEzTxIIgMl2OIsmwJwDo+hF75LyAJ2YIugFVpPp4J+xLA+7WRXlc93r+EwgJ
	h9+rW4wwRkJ/TQxjeFT1IGgMSzjU7w/OuB79rPt8+GQVCtX/JdsBmcRDZB2Srwu4
	SSWufQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32x838-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 11:01:43 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-489af8d6fadso691110b6e.3
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 04:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782126102; x=1782730902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=;
        b=Tqq/lYPMC3YN9gS0K00bePob1DTCoBnZeaMJ0pNWeygs14ICT4zBuodPynoyhrdXQK
         BBneBoyKFXROkRDVt2s+awC2dsa1MEsY3s+qdZ2jvo/Nbvx1mO986Al41L09HGE2g9+q
         L6nbGmhmAIS4EpzkI0nfuwqAXU/zmnU9mCmKvmpaKHZq5JRQSiqGqQsqH6eAUJibbZqi
         cvi9nzzot/gVoWY1JPBztXSNUhrxqv4ZLqHAgqllC/6R5eK7DHJFT2ffMdv0Fd/sGQwl
         j5F4tfwMx44TYfsHilVXIsYY/WW/diJ+0BJQIT5P5oNnO5fexJqJk5QfQIxQK+fvfSbW
         wcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126102; x=1782730902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AARN7G4QPvec8eqob/vF17xv4KWR384m4AJdD/OA+fM=;
        b=PcVoPp0CLGnvFZkv/U8AVMbgRxDQEBz9gRsshWEDg3TkkY/kLFThw3QRFH/9kz289S
         pgmy6d6OVOp8HaLRrZsxQvQQadjYKQbWXd1e/O3yKLUOg3oqGNBcYqA+98CF0l/6btEc
         xLJOcOQZrkcGZh13PG7Yfrxn2T0PwrE9mZrRoRoJFEYYgrV7X9oYcnu8TrfSrSTz83eY
         Dn4IpAjyeMDwhx7iVoZiZ+zah1GZwf4Rb0fbrRC5UK+Qx9trKapVoomx17Y24WJPOapR
         rMPbHWAPnW+7Cvv8u7Yq4f3zCvQjPwnuWUiConTb3GhRn2jtF983GWrR0he1K9GY78hM
         9ZnA==
X-Forwarded-Encrypted: i=1; AFNElJ//qLm6R/T1FayGAeP+OCO1SDLNk8cfrs0MYNLXxjvVqwmi3hIsKHTQzevdUkhrCnFTQskvtPj0UzhW@vger.kernel.org
X-Gm-Message-State: AOJu0YyiRLMGpEKCAQehw/PTbDbFhr4YyuZQpQU7k7LUPWa3DPjMRazJ
	Uj0BgEjg0pMBnh67pPwNPBjss1XmFVlOw95rAPwBwjCMHdTNCAtu/+MijK6yZFmG/TDF0x7ZEZU
	7TUJfEWHNNnDGPYfj+jpTai2JIG8enFcW4R122M4NKUcLU+KCUbeNdP2ZQZ6FQgnp
X-Gm-Gg: AfdE7clv9Aq5ggBBMVqzExNronIpNqTg5qXI4SsSRSLEymK0vPWM/qoZzUj7M7V01fy
	ay7WL9D9racXlag8XhRlUwgklqimiDpxjOFsdLumsBc616BTeDlD1FBkCEyGg1+qqQNNvFlswq2
	InIyC0OKMWVqmKW5Q8SgliCQfMLkmA1e9h+QtvMJ3gEFMyF91WrF1Veg69spRIiiRCHSCOJbaFB
	n4/gzg4ARnvWHWUeuKjMxMzHGvNvtlmhA6lkWlRJglDDkB8SJwMpk04ScGLKGNUK4GbV7jGs19j
	vjzm3ETEv2yH798QyOfdFmP6FGGXfgfxt1AgGCvvQvP3NYwJh5bvk20g+Wmo6YZPEJnKP/P3BiL
	CnwyQ0uCLP5sWJDhMmartldIVL1XKYqsV0VI=
X-Received: by 2002:a05:6808:4f22:b0:48b:f341:1148 with SMTP id 5614622812f47-48bf34123afmr3761712b6e.3.1782126102394;
        Mon, 22 Jun 2026 04:01:42 -0700 (PDT)
X-Received: by 2002:a05:6808:4f22:b0:48b:f341:1148 with SMTP id 5614622812f47-48bf34123afmr3761687b6e.3.1782126101919;
        Mon, 22 Jun 2026 04:01:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac98c9sm336066766b.29.2026.06.22.04.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:01:41 -0700 (PDT)
Message-ID: <e203221b-5de5-4cc3-b65a-a3545986a954@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:01:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260620-qcom_spel_driver_upstream-v2-0-a3ee6837c18f@oss.qualcomm.com>
 <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260620-qcom_spel_driver_upstream-v2-2-a3ee6837c18f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: g6bRaEKA6TXx_0RJYnI05nRtc1puE7Bz
X-Proofpoint-ORIG-GUID: g6bRaEKA6TXx_0RJYnI05nRtc1puE7Bz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX/vuZ3VKt00KR
 ry6a1x2QH1nEISc5LoAb2pPyx49wTsVXI44q6R+avT3HCA1WEc+nnQP+bWb1RauIY0FQlufnvcg
 EWGUu+/F77T9rvxpAXLF+25xiPKRruk=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a391617 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=02jEIrHkWd2Y-gyNavAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX4fSgOhJGq+YL
 3kFcwSs90JdHjJMrouPGUSctZ5vY206V/bZooq0+1k5E/4Ob2xVZhNP5PasnyQsJVDTkZ2K66Rj
 4MCqKVUXaMko8gA3WjO0zQg/u4Sld13RgpvbgxX85AW1mftmgwOFaKeIoi2K0nM5idjVYxdrUlW
 oPJOfUkG2smZZso+beN78jyN+RESmA5XMs1wkbbRrN+MGETNqk/ktbW2jCFtCLNtrW7j8dift67
 sD5TFJziUssMG7NTWElyWSwTen3CaIn/Wzr6/XfHXZ/ToUX4reHzEcOPZnzL0+OrxU0sIvQV3S6
 dDHZe2IYioodZF/spiG8vj+aQCi3qG+gP8RSvgODyzwL9kdRG545Glze2ikY1NA9d77TZQWjT/6
 ezrE93ynFd9cN29NyTuJxbLb8NDR2/Tom9J9ZCKisYmM5+TsZYQKw5FWxlNRU3WsIzIFBVw6/a8
 82IZZZy7RVaYLmrvxFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220108

On 6/19/26 10:39 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/powercap.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>

Please ensure all the includes are necessary

> +
> +/* SPEL register bitmasks */
> +#define ENERGY_STATUS_MASK		GENMASK(31, 0)
> +
> +#define POWER_LIMIT_MASK		GENMASK(14, 0)
> +#define POWER_LIMIT_ENABLE		BIT(31)
> +
> +#define TIME_WINDOW_MASK_L		GENMASK(14, 0)
> +#define TIME_WINDOW_MASK_H		GENMASK(22, 16)

Is BIT(15) not part of this?

[...]

> +/* Domain configuration */
> +static const struct spel_domain_info domain_info[SPEL_DOMAIN_MAX] = {
> +	[SPEL_DOMAIN_SYS]	= { "sys", 0x40 },
> +	[SPEL_DOMAIN_SOC]	= { "soc", 0x00 },
> +	[SPEL_DOMAIN_CL0]	= { "cl0", 0x5c },
> +	[SPEL_DOMAIN_CL1]	= { "cl1", 0x60 },
> +	[SPEL_DOMAIN_CL2]	= { "cl2", 0x64 },
> +	[SPEL_DOMAIN_IGPU]	= { "igpu", 0x08 },
> +	[SPEL_DOMAIN_DGPU]	= { "dgpu", 0x44 },
> +	[SPEL_DOMAIN_NSP]	= { "nsp", 0x0c },
> +	[SPEL_DOMAIN_MMCX]	= { "mmcx", 0x10 },
> +	[SPEL_DOMAIN_INFRA]	= { "infra", 0x18 },
> +	[SPEL_DOMAIN_DRAM]	= { "dram", 0x1c },
> +	[SPEL_DOMAIN_MDM]	= { "mdm", 0x48 },
> +	[SPEL_DOMAIN_WLAN]	= { "wlan", 0x4c },
> +	[SPEL_DOMAIN_USB1]	= { "usb1", 0x50 },
> +	[SPEL_DOMAIN_USB2]	= { "usb2", 0x54 },
> +	[SPEL_DOMAIN_USB3]	= { "usb3", 0x58 },
> +};

I would expect that the names are going to stay common, but the offsets
will be different. This array should probably be called
glymur_domain_info[]. We may have another LUT just for names of indices
(i.e. [SPEL_DOMAIN_xxx] = "xxx")

> +
> +/**
> + * struct spel_constraint_info - Power limit constraint information
> + * @limit_offset:	Register offset for power limit value
> + * @time_window_offset:	Register offset for time window
> + * @supported_mask:	Bit mask in capability register
> + * @domain_id:		Domain this constraint applies to
> + * @pl_id:		Power limit ID (PL1, PL2, etc.)
> + */
> +struct spel_constraint_info {
> +	u32 limit_offset;
> +	u32 time_window_offset;
> +	u32 supported_mask;
> +	enum spel_domain_type domain_id;
> +	int pl_id;
> +};
> +
> +/* Constraint configuration */
> +static const struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1c, 0x7c, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SoC domain constraints */
> +	{ 0x00, 0x60, BIT(4), SPEL_DOMAIN_SOC, POWER_LIMIT1 },
> +	{ 0x04, 0x64, BIT(5), SPEL_DOMAIN_SOC, POWER_LIMIT2 },
> +	{ 0x08, 0x68, BIT(6), SPEL_DOMAIN_SOC, POWER_LIMIT3 },
> +	{ 0x0c, 0x6c, BIT(7), SPEL_DOMAIN_SOC, POWER_LIMIT4 },
> +};

Is this specific to Glymur, or SPEL-wide?

[...]

> +/**
> + * struct spel_system -	SPEL system

odd tab after '-'

[...]

> +	case PL_LIMIT:
> +		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
> +		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))
> +			return -EINVAL;
> +		reg_val = (reg_val & ~POWER_LIMIT_MASK) | FIELD_PREP(POWER_LIMIT_MASK, new_val);

FIELD_MODIFY()

> +
> +		/*
> +		 * Enable/Disable PL based on the value:
> +		 * - If value is 0, disable the PL (clear enable bit)
> +		 * - If value is non-zero, enable the PL (set enable bit)
> +		 */
> +		if (new_val == 0)
> +			reg_val &= ~POWER_LIMIT_ENABLE;
> +		else
> +			reg_val |= POWER_LIMIT_ENABLE;

Likewise


> +
> +		writel(reg_val, reg_addr);
> +		return 0;
> +
> +	case PL_TIME_WINDOW:
> +		/*
> +		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
> +		 */
> +		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
> +		if (new_val > TIME_WINDOW_MAX)
> +			return -EINVAL;
> +		/* Read-modify-write to preserve other bits */
> +		reg_val = (reg_val & ~(TIME_WINDOW_MASK_H | TIME_WINDOW_MASK_L)) |
> +			  FIELD_PREP(TIME_WINDOW_MASK_H, new_val >> 15) |
> +			  FIELD_PREP(TIME_WINDOW_MASK_L, new_val);

Also here

[...]

> +static void spel_detect_powerlimit(struct spel_domain *sd)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u32 capabilities;
> +	int i, j;
> +
> +	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
> +
> +	/*
> +	 * Detect power limits from hardware capabilities.
> +	 * Start from index 1 (POWER_LIMIT2) since PL1 is always enabled in spel_init_domains().
> +	 */
> +	for (i = 1; i < ARRAY_SIZE(pl_names); i++) {

int i = POWER_LIMIT2

(yeah, nowadays you can finally declare the iterator inside the loop
in the kernel)

Konrad
