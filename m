Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141130C343
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345986; cv=none; b=KTTuo/rtt1SyiiLbGAkiyyP7Sjk3H3bePxuQ6p1OIxDVqPQBABIC8pgBu75LhGBIC3W9WpMOepqbO/rbB7X0Wjmz8Gb0tmc0YJ/IkGhZbto66ftnrs3I1XBzBUwzLlV1ZrTatrdwuPdbf43O5ZNPf5Un86iPAwma1aTceK1HICw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345986; c=relaxed/simple;
	bh=gFRcuHiALvBlgLPFrHWDwQ6NWE2JVslqLJiDx1PZaWA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Cf556L4wPJQ8RoHYl1y2CQbvpMw9W/c7XoFssXtga4WebtsJSzQpZJkJCG8NKW9CGx4pGRg3E95yMteWv+kS75IvEQ5qBGuJXzDjAPQmcL/RQldAUkalJJ8JNJQSv95IGqJPotlO2tEanAXgPy4h8x5qjeAzBfRoCEsc5YNVNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hahpJf8w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbTwCk7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hahpJf8w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbTwCk7M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJPV369080
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 13:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbuCeh7NRimGxV0fHiKlrbeT81K42zJvCmDy4KDqFM8=; b=hahpJf8wHun6alo+
	DBzJOHYGrcSjYPpmogtbg1l/nBNo1v+MIKkdfrwa3i/OHMbA0FJucVttnsvw0YyB
	ets80SRHPwaISS+plAp5D4sLBnEX2asXnBwProMfPvvsR9aia/viUcV2IVEm6UI2
	qZ4UfK0ETb8JVQ6AVFhLlYTOZ3I04b5N5h3zIqQ+8pnDJB4Yd0ORy7Od8KkB0NAQ
	DO7/RbYrCbYoT8mNzYvasskXFz6d7ZoNj7BTSXWtYZ6o/EmERWnDMJ6rsiRgb+nm
	JcIpanbEu5t7psfrz7Gvl8ssaZ4yN3X17ve0vAdVdzGloD7rk5bJEl1WgOkBv51K
	SQqR7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99ct5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 13:53:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e606e8f3eso236658185a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783345982; x=1783950782; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbuCeh7NRimGxV0fHiKlrbeT81K42zJvCmDy4KDqFM8=;
        b=DbTwCk7MiP3CTlX8X2uOkvXHqUsUKHV4NIt7qGXFx/kvw3bEFr56ChYCW+Dj+Tkx5w
         AmloeF619d89yyPwFOWc2YRHb0LKCTM179diHjSdnvzvVtyC3jPZC6jiAh500cDHqG3h
         7RO4zTpOS/Kx7Nh87+9VzNtmQ34BQ/GZ/sr169qsjjGn6AU5++sOg/uXuHiOKLDQdCHV
         pdx7Z6zXHOQwZXD8vpAck8uNLIaBQuPQmtvoFUDLI1ogTxyVpnoK7PS5ua0ghte1dzAT
         anFW8nWIq/QEXKg7JC1h3BwezMNEK9ImqF38SFmbIn+EcKtSwdz9gN/a2PbjABq2q9Iv
         C/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345982; x=1783950782;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbuCeh7NRimGxV0fHiKlrbeT81K42zJvCmDy4KDqFM8=;
        b=Q/KRshIap6wmG7sTNQtE+Nh5opSt7tDCDHmV/R1XF6iy8V23SW243IG3JtC+BFzOWR
         rdXx/qyt0kTIVFE8xHYR3ThQsQjTWSvfQ6Yxn4sZizscOz0hOct8L2zARvsVDqAFQiUY
         TF2fguh/sIRB+/Wcuop9XnBd1OA/Cpsmkw+vVrtAjXLUJR5kQlG8sJJDalbvEoB7RpBy
         RjrDxvb/U3p3MetN/1urVzZI5gYga2OM5gKLPOe/7bcOsJMyzQ8kKNuTeu1/HgB7MnCh
         MI9lOS6sihsxyKIumlrEANsaOY8OaeUGKtXmrNPeE8OGlfD1rxfDmanNIOtlOhEcAjkZ
         Foow==
X-Forwarded-Encrypted: i=1; AHgh+RrzKyoqEu2NbpySFLMTekT9dtba9dE4bDplUcBvuWaiBWoQN+7px7zWEf+J12cYC0jKAsiEi37HeI/t@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjMdWdFcX16gpsI4cBI5SEs329UEO+koxhNu8fWjD8WCHoWbX
	HWrkGBXkYV59vBuE4vNy6nTskLMSUccA1qQZ/FuRWb14CBQ+I7xiTn+0Kk4JYyitc3RzSKYrV8K
	hGOg647OUIaoPGChDgB+qKDQqxhcr3wOkkLqgSW+07ZbhT3bEAvBnEf9vjnZy/fPH
X-Gm-Gg: AfdE7ck22IJKp/hqsiaCh/RtRE4QMfiMXpu7+OJkDYWfx/S8sMRhV6zgGk/mKjU36hV
	t+E4TqPfpnl5Oty0FwSsbSbY+4NL9Rld3pA4CEecHsTsNE9731wQ4I5GD9sltdjRUzNAOKjG7d4
	rONH3o+Y03wTeDt08nQgZqRxDVg+YBsr5hDHY+vhtx8G2Fui7A7/HkM/Gjm1oKCrtTo5SZj/PbD
	D0kg6daRt1ZgukRvuB7XQH6C5fHpbLekyioGRGXRRT+5QK39U7AGdDKmdhXnZQHXwZV21/OW0kv
	jTEpYgIt7PH1ohN1pa+Nb3pgVnFqhgOZXXbn7fUrZkEy+rqaKazM0i3fLyHIVyuQB4gbJkE0S7/
	+heT366bMoqX6UVNIx76x+rxmGKifKpO1AAjUl6oY69kPT32bNlIjrhp8wbFUbjTYPx+BQdfYAQ
	==
X-Received: by 2002:a05:620a:44c7:b0:916:15c3:cc6b with SMTP id af79cd13be357-92ebb596df2mr85337585a.55.1783345981580;
        Mon, 06 Jul 2026 06:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:44c7:b0:916:15c3:cc6b with SMTP id af79cd13be357-92ebb596df2mr85311285a.55.1783345977865;
        Mon, 06 Jul 2026 06:52:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm24852803f8f.3.2026.07.06.06.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:52:57 -0700 (PDT)
Message-ID: <92397fd7-e149-432c-9ec8-b2cd31af7f04@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:52:56 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260702-qcom_spel_driver_upstream-v3-0-434d50f0c5b0@oss.qualcomm.com>
 <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260702-qcom_spel_driver_upstream-v3-3-434d50f0c5b0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LoVx9hZyIj75iqGaPk08Onoav4f4JAdV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX/UGrZzpfB44W
 vurO3yBvZuDy9V3JAe4Mgudk3OXOMFDDYTbaPGDpLX+bUINS1yRhNVXyKMKn3BUkbewLKXYqmG5
 mfOR5BeT6CCnExeZdATGsS/McO1Swl8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX0xejHCT6v3Q9
 7TQiHcTvqQXm7X1xwa8H1mb6olLHjQG4SA3+lv79grh+XMkM1NuWnDarWzH7zj9UnXLiqBucL7r
 8uDnlnkU8n85Khhrdb9VT9eO2g/gAoypheuvPabrH+cEcQWgv1907gEHzjHdrWV80nn4ktzyH+u
 /jPGZdnKVRuwPzgptK705KZkczaFvFZkw05AaxdydUWWQYp37LMiT8d1Q+CNOSLKFCZFsnMhuMx
 h7V5yXMhKIesf8bjDxIcQhvgUkmHlR+RBJdcv3p2dG9zK9W7HEtV/3HNN8eoe1HaScayhrHdZ+R
 D5PGv43so8f4voGIq/Qckjbfzavtn1DSQY32XZBSGr3XSlV/PcDXXVmW9qbWqUqF/5FWLjzC8CA
 I2lKQsBNDZY0TONNYjxYnlmKYk68sGMoZH0trtTFX5NR//54Un8Pm4GskUq9517oF85FUEHlUJu
 BqPTDFjL9Y9YsTK8LEw==
X-Proofpoint-GUID: LoVx9hZyIj75iqGaPk08Onoav4f4JAdV
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bb33e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JckHBLQJYJ3fdDYo7dwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141


Hi Manaf,

I've commented this patch but I've more comments which should be 
addressed after taking into account the ones below.

On 7/2/26 19:22, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.

Could you elaborate a bit more the description in order to make easier 
the understanding of the code ?

> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>   MAINTAINERS                  |   1 +
>   drivers/powercap/Kconfig     |  13 +
>   drivers/powercap/Makefile    |   1 +
>   drivers/powercap/qcom_spel.c | 803 +++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 818 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44e90b2d5e85..5e716662782c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22374,6 +22374,7 @@ L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/power/limits/power-limit-controller.yaml
>   F:	Documentation/devicetree/bindings/power/limits/qcom,glymur-spel.yaml
> +F:	drivers/powercap/qcom_spel.c
>   
>   QUALCOMM TEE (QCOMTEE) DRIVER

[ ... ]

> +#define ENERGY_UNIT_SCALE		1000

You should have already a define for that in <linux/units.h>

> +#define SPEL_DOMAIN_NAME_LENGTH		16
> +
> +/* Domain types */
> +enum spel_domain_type {
> +	SPEL_DOMAIN_SYS,
> +	SPEL_DOMAIN_SOC,
> +	SPEL_DOMAIN_CL0,
> +	SPEL_DOMAIN_CL1,
> +	SPEL_DOMAIN_CL2,
> +	SPEL_DOMAIN_IGPU,
> +	SPEL_DOMAIN_DGPU,
> +	SPEL_DOMAIN_NSP,
> +	SPEL_DOMAIN_MMCX,
> +	SPEL_DOMAIN_INFRA,
> +	SPEL_DOMAIN_DRAM,
> +	SPEL_DOMAIN_MDM,
> +	SPEL_DOMAIN_WLAN,
> +	SPEL_DOMAIN_USB1,
> +	SPEL_DOMAIN_USB2,
> +	SPEL_DOMAIN_USB3,
> +	SPEL_DOMAIN_MAX,
> +};
> +
> +/* Power limit IDs */
> +enum spel_power_limit_id {
> +	POWER_LIMIT1,
> +	POWER_LIMIT2,
> +	POWER_LIMIT3,
> +	POWER_LIMIT4,
> +	POWER_LIMITS_MAX,
> +};
> +
> +/* Unit types for conversion */
> +enum unit_type {
> +	POWER_UNIT,
> +	ENERGY_UNIT,
> +	TIME_UNIT,
> +};
> +
> +/* Power limit operation types */
> +enum pl_ops_type {
> +	PL_LIMIT,
> +	PL_TIME_WINDOW,
> +};
> +
> +static const char * const pl_names[] = {
> +	[POWER_LIMIT1] = "pl1",
> +	[POWER_LIMIT2] = "pl2",
> +	[POWER_LIMIT3] = "pl3",
> +	[POWER_LIMIT4] = "pl4",
> +};
> +
> +/* Common domain names (can be shared across SoCs) */
> +static const char * const spel_domain_names[SPEL_DOMAIN_MAX] = {
> +	[SPEL_DOMAIN_SYS]	= "sys",
> +	[SPEL_DOMAIN_SOC]	= "soc",
> +	[SPEL_DOMAIN_CL0]	= "cl0",
> +	[SPEL_DOMAIN_CL1]	= "cl1",
> +	[SPEL_DOMAIN_CL2]	= "cl2",
> +	[SPEL_DOMAIN_IGPU]	= "igpu",
> +	[SPEL_DOMAIN_DGPU]	= "dgpu",
> +	[SPEL_DOMAIN_NSP]	= "nsp",
> +	[SPEL_DOMAIN_MMCX]	= "mmcx",
> +	[SPEL_DOMAIN_INFRA]	= "infra",
> +	[SPEL_DOMAIN_DRAM]	= "dram",
> +	[SPEL_DOMAIN_MDM]	= "mdm",
> +	[SPEL_DOMAIN_WLAN]	= "wlan",
> +	[SPEL_DOMAIN_USB1]	= "usb1",
> +	[SPEL_DOMAIN_USB2]	= "usb2",
> +	[SPEL_DOMAIN_USB3]	= "usb3",
> +};
> +
> +/* Glymur-specific domain register offsets */
> +static const u32 glymur_domain_offsets[SPEL_DOMAIN_MAX] = {
> +	[SPEL_DOMAIN_SYS]	= 0x40,
> +	[SPEL_DOMAIN_SOC]	= 0x00,
> +	[SPEL_DOMAIN_CL0]	= 0x5c,
> +	[SPEL_DOMAIN_CL1]	= 0x60,
> +	[SPEL_DOMAIN_CL2]	= 0x64,
> +	[SPEL_DOMAIN_IGPU]	= 0x08,
> +	[SPEL_DOMAIN_DGPU]	= 0x44,
> +	[SPEL_DOMAIN_NSP]	= 0x0c,
> +	[SPEL_DOMAIN_MMCX]	= 0x10,
> +	[SPEL_DOMAIN_INFRA]	= 0x18,
> +	[SPEL_DOMAIN_DRAM]	= 0x1c,
> +	[SPEL_DOMAIN_MDM]	= 0x48,
> +	[SPEL_DOMAIN_WLAN]	= 0x4c,
> +	[SPEL_DOMAIN_USB1]	= 0x50,
> +	[SPEL_DOMAIN_USB2]	= 0x54,
> +	[SPEL_DOMAIN_USB3]	= 0x58,
> +};
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
> +
> +/**
> + * struct spel_domain - SPEL power domain
> + * @power_zone:		Powercap zone
> + * @lock:		Mutex protecting register access
> + * @sp:			Parent sys domain
> + * @status_reg:		Energy counter register
> + * @name:		Domain name
> + * @id:			Domain type ID
> + */
> +struct spel_domain {
> +	struct powercap_zone power_zone;
> +	struct mutex lock; /* Protects register read/write operations */
 > +	void *sp;

It is a cyclic dependency sp<->sd. Please break it.

IMO it is acceptable to have a static global variable struct spel_system.

> +	void __iomem *status_reg;
> +	char name[SPEL_DOMAIN_NAME_LENGTH];
> +	enum spel_domain_type id;
> +};

Instead of having a spel_domain_names[] declared with the enum where the 
name is copied in the name field above, it would be simpler and safer to 
do that with the struct spel_domain itself.

Also add the offset instead of a separate array.

struct spel_domain {
	...
	const char *name;
	...
	unsigned char offset;
};

struct spel_domain spel_domains[] = {
	{ .name = "sys", .offset = 0x40 },
	{ .name = "soc", .offset = 0x00 },
	{ .name = "cl0", .offset = 0x5c },
	{ .name = "cl1", .offset = 0x60 },
	{ .name = "cl2", .offset = 0x64 },
	...
};

#define NUM_SPEL_DOMAINS ARRAY_SIZE(spel_domains)

In addition, I suggest to describe the hierarchy directly when defining 
the structures:

struct spel_domain {
	...
	struct spel_domain *parent;
	...
};

struct spel_domain spel_domains[] = {
	{ .name = "sys", .offset = 0x40 },
	{ .name = "soc", .offset = 0x00, .parent = &spel_domains[0] },
	{ .name = "cl0", .offset = 0x5c, .parent = &spel_domains[1] },
	{ .name = "cl1", .offset = 0x60, .parent = &spel_domains[1] },
	{ .name = "cl2", .offset = 0x64, .parent = &spel_domains[1] },
	...
};

It will facilitate the initialization.

> +/**
> + * struct spel_system - SPEL system
> + * @domains:		Array of domains
> + * @power_zone:		Parent powercap zone
> + * @node_base:		Base address for node registers
> + * @constraint_base:	Base address for constraint registers
> + * @config_base:	Base address for config registers
> + * @control_type:	Powercap control type
> + * @dev:		Device pointer for logging
> + * @limits:		Supported power limits per domain
> + * @power_unit:		Power unit in microWatts (common for all domains)
> + * @energy_unit:	Energy unit in nanoJoules (common for all domains)
> + * @time_unit:		Time unit in microseconds (common for all domains)
> + */
> +struct spel_system {
> +	struct spel_domain *domains;
> +	struct powercap_zone *power_zone;

This power_zone is not needed

> +	void __iomem *node_base;
> +	void __iomem *constraint_base;
> +	void __iomem *config_base;
> +	struct powercap_control_type *control_type;
> +	struct device *dev;
> +	int limits[SPEL_DOMAIN_MAX];

If the limit is an attribute of the spel_domain instead of an array 
here, the resulting code should be simpler to read and understand.

> +	unsigned int power_unit;
> +	unsigned int energy_unit;
> +	unsigned int time_unit;
> +};
> +
> +#define power_zone_to_spel_domain(_zone) \
> +	container_of(_zone, struct spel_domain, power_zone)
> +
> +static bool is_pl_valid(struct spel_domain *sd, int pl)
> +{
> +	struct spel_system *sp = sd->sp;
> +
> +	return !!(sp->limits[sd->id] & BIT(pl));
> +}
> +
> +static int get_pl_ops_offset(struct spel_domain *sd, int pl, enum pl_ops_type pl_op)
> +{
> +	for (int i = 0; i < ARRAY_SIZE(constraints); i++) {
> +		const struct spel_constraint_info *ci = &constraints[i];
> +
> +		if (ci->domain_id == sd->id && ci->pl_id == pl) {
> +			switch (pl_op) {
> +			case PL_LIMIT:
> +				return ci->limit_offset;
> +			case PL_TIME_WINDOW:
> +				return ci->time_window_offset;
> +			default:
> +				return -EOPNOTSUPP;
> +			}
> +		}
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
> +			   u64 value, int to_raw)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u64 units, scale;
> +
> +	switch (type) {
> +	case POWER_UNIT:
> +		units = sp->power_unit;
> +		scale = 1;
> +		break;
> +	case ENERGY_UNIT:
> +		units = sp->energy_unit;
> +		scale = ENERGY_UNIT_SCALE;
> +		break;
> +	case TIME_UNIT:
> +		units = sp->time_unit;
> +		scale = 1;
> +		break;
> +	default:
> +		return value;
> +	}
> +
> +	if (to_raw)
> +		return DIV_ROUND_CLOSEST_ULL(value * scale, units);
> +
> +	value *= units;
> +	return div64_u64(value, scale);
> +}
> +
> +static int spel_read_pl_data(struct spel_domain *sd, int pl,
> +			     enum pl_ops_type pl_op, bool xlate, u64 *data)
> +{
> +	struct spel_system *sp = sd->sp;
> +	void __iomem *reg_addr;
> +	u64 value;
> +	int offset;
> +
> +	if (!is_pl_valid(sd, pl))
> +		return -EINVAL;
> +
> +	offset = get_pl_ops_offset(sd, pl, pl_op);
> +	if (offset < 0)
> +		return offset;
> +
> +	guard(mutex)(&sd->lock);
> +
> +	reg_addr = sp->constraint_base + offset;
> +	value = readl(reg_addr);
> +
> +	switch (pl_op) {
> +	case PL_LIMIT:
> +		value = FIELD_GET(POWER_LIMIT_MASK, value);
> +		if (xlate)
> +			*data = spel_unit_xlate(sd, POWER_UNIT, value, 0);
> +		else
> +			*data = value;
> +		break;
> +	case PL_TIME_WINDOW:
> +		/* Decode time window: bits [22:16] are upper 7 bits, [14:0] are lower 15 bits */
> +		value = (FIELD_GET(TIME_WINDOW_MASK_H, value) << 15) |
> +			FIELD_GET(TIME_WINDOW_MASK_L, value);
> +		if (xlate)
> +			*data = spel_unit_xlate(sd, TIME_UNIT, value, 0);
> +		else
> +			*data = value;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int spel_write_pl_data(struct spel_domain *sd, int pl,
> +			      enum pl_ops_type pl_op, unsigned long long value)
> +{
> +	struct spel_system *sp = sd->sp;
> +	void __iomem *reg_addr;
> +	u64 reg_val, new_val;
> +	int offset;
> +
> +	if (!is_pl_valid(sd, pl))
> +		return -EINVAL;
> +
> +	offset = get_pl_ops_offset(sd, pl, pl_op);
> +	if (offset < 0)
> +		return offset;
> +
> +	guard(mutex)(&sd->lock);
> +
> +	reg_addr = sp->constraint_base + offset;
> +	reg_val = readl(reg_addr);
> +
> +	switch (pl_op) {
> +	case PL_LIMIT:
> +		new_val = spel_unit_xlate(sd, POWER_UNIT, value, 1);
> +		if (new_val > FIELD_MAX(POWER_LIMIT_MASK))
> +			return -EINVAL;
> +
> +		FIELD_MODIFY(POWER_LIMIT_MASK, &reg_val, new_val);
> +
> +		/*
> +		 * Enable/Disable PL based on the value:
> +		 * - If value is 0, disable the PL (clear enable bit)
> +		 * - If value is non-zero, enable the PL (set enable bit)
> +		 */
> +		FIELD_MODIFY(POWER_LIMIT_ENABLE, &reg_val, new_val ? 1 : 0);
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
> +
> +		/* Read-modify-write to preserve other bits */
> +		FIELD_MODIFY(TIME_WINDOW_MASK_H, &reg_val, new_val >> 15);
> +		FIELD_MODIFY(TIME_WINDOW_MASK_L, &reg_val, new_val & FIELD_MAX(TIME_WINDOW_MASK_L));
> +		writel(reg_val, reg_addr);
> +
> +		/*
> +		 * Time window register update doesn't trigger firmware interrupt.
> +		 * Write to the PL register with current value to trigger the interrupt.
> +		 */
> +		offset = get_pl_ops_offset(sd, pl, PL_LIMIT);
> +		if (offset >= 0) {
> +			reg_addr = sp->constraint_base + offset;
> +			reg_val = readl(reg_addr);
> +			writel(reg_val, reg_addr);
> +		}
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int spel_get_energy_counter(struct powercap_zone *power_zone, u64 *energy_raw)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	u64 value;
> +
> +	value = readl(sd->status_reg);
> +
> +	*energy_raw = spel_unit_xlate(sd, ENERGY_UNIT, value, 0);
> +
> +	return 0;
> +}
> +
> +static int spel_get_max_energy_counter(struct powercap_zone *pcd_dev, u64 *energy)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(pcd_dev);
> +
> +	*energy = spel_unit_xlate(sd, ENERGY_UNIT, ENERGY_STATUS_MASK, 0);
> +
> +	return 0;
> +}
> +
> +static int spel_release_zone(struct powercap_zone *power_zone)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +
> +	/*
> +	 * Free the domains array when the last zone (SYS domain) is released.
> +	 * This ensures proper cleanup even if sysfs files are held open during unbind.
> +	 */
> +	if (sd->id == SPEL_DOMAIN_SYS) {
> +		struct spel_domain *domains = sd;
> +
> +		/* Destroy all mutexes before freeing the domains array */
> +		for (int i = 0; i < ARRAY_SIZE(spel_domain_names); i++)
> +			mutex_destroy(&domains[i].lock);
> +
> +		kfree(domains);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spel_find_nr_power_limit(struct spel_domain *sd)
> +{
> +	int nr_pl = 0;
> +
> +	for (int i = 0; i < ARRAY_SIZE(pl_names); i++) {
> +		if (is_pl_valid(sd, i))
> +			nr_pl++;
> +	}
> +
> +	return nr_pl;
> +}
> +
> +static const struct powercap_zone_ops zone_ops = {
> +	.get_energy_uj = spel_get_energy_counter,
> +	.get_max_energy_range_uj = spel_get_max_energy_counter,

Is reset_energy_uj() supported ?

I thought the SPEL allowed power monitoring, right ?

What about get_power_uw() / get_max_power_range_uw() ?

> +	.release = spel_release_zone,
> +};
> +
> +static int spel_constraint_to_pl(struct spel_domain *sd, int cid)
> +{
> +	int id = 0;
> +
> +	for (int i = 0; i < ARRAY_SIZE(pl_names); i++) {
> +		if (is_pl_valid(sd, i) && id++ == cid)
> +			return i;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int spel_set_power_limit(struct powercap_zone *power_zone, int cid,
> +				u64 power_limit)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	int id;
> +
> +	id = spel_constraint_to_pl(sd, cid);
> +	if (id < 0)
> +		return id;
> +
> +	return spel_write_pl_data(sd, id, PL_LIMIT, power_limit);
> +}
> +
> +static int spel_get_power_limit(struct powercap_zone *power_zone, int cid,
> +				u64 *data)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	u64 val;
> +	int ret, id;
> +
> +	id = spel_constraint_to_pl(sd, cid);
> +	if (id < 0)
> +		return id;
> +
> +	ret = spel_read_pl_data(sd, id, PL_LIMIT, true, &val);
> +	if (!ret)
> +		*data = val;
> +
> +	return ret;
> +}
> +
> +static int spel_set_time_window(struct powercap_zone *power_zone, int cid,
> +				u64 window)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	int id;
> +
> +	id = spel_constraint_to_pl(sd, cid);
> +	if (id < 0)
> +		return id;
> +
> +	return spel_write_pl_data(sd, id, PL_TIME_WINDOW, window);
> +}
> +
> +static int spel_get_time_window(struct powercap_zone *power_zone, int cid,
> +				u64 *data)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	u64 val;
> +	int ret, id;
> +
> +	id = spel_constraint_to_pl(sd, cid);
> +	if (id < 0)
> +		return id;
> +
> +	ret = spel_read_pl_data(sd, id, PL_TIME_WINDOW, true, &val);
> +	if (!ret)
> +		*data = val;
> +
> +	return ret;
> +}
> +
> +static const char *spel_get_constraint_name(struct powercap_zone *power_zone,
> +					    int cid)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	int id;
> +
> +	id = spel_constraint_to_pl(sd, cid);
> +	if (id >= 0 && id < ARRAY_SIZE(pl_names))
> +		return pl_names[id];
> +
> +	return NULL;
> +}
> +
> +static const struct powercap_zone_constraint_ops constraint_ops = {
> +	.set_power_limit_uw = spel_set_power_limit,
> +	.get_power_limit_uw = spel_get_power_limit,
> +	.set_time_window_us = spel_set_time_window,
> +	.get_time_window_us = spel_get_time_window,
> +	.get_name = spel_get_constraint_name,
> +};
> +
> +static void spel_init_domains(struct spel_system *sp)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(spel_domain_names); i++) {
> +		struct spel_domain *sd = &sp->domains[i];
> +
> +		sd->sp = sp;
> +		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
> +			 spel_domain_names[i]);
> +		sd->id = i;
> +		sd->status_reg = sp->node_base + glymur_domain_offsets[i];
> +
> +		/* PL1 is always supported (required for powercap registration) */
> +		sp->limits[i] = BIT(POWER_LIMIT1);
> +	}
> +}
> +
> +static void spel_update_unit(struct spel_system *sp)
> +{
> +	u32 value, shift;
> +
> +	/* Read power_unit and time_unit from offset 0x0 */
> +	value = readl(sp->config_base);
> +
> +	/*
> +	 * Unit calculation: 1 / (2^shift)
> +	 * Masks limit: TIME_UNIT (4 bits, max 15), POWER_UNIT (3 bits, max 7).
> +	 */
> +	shift = FIELD_GET(POWER_UNIT_MASK, value);
> +	sp->power_unit = 1000000 / (1 << shift);
> +
> +	shift = FIELD_GET(TIME_UNIT_MASK, value);
> +	/*
> +	 * Convert to microseconds: base unit is 1ms, divided by 2^shift.
> +	 */
> +	sp->time_unit = 1000 / (1 << shift);
> +
> +	/* Read energy_unit from ENERGY_RPT_UNIT_OFFSET */
> +	value = readl(sp->config_base + ENERGY_RPT_UNIT_OFFSET);
> +
> +	/*
> +	 * Unit calculation: 1 / (2^shift)
> +	 * Masks limit: ENERGY_UNIT (4 bits, max 15).
> +	 */
> +	shift = FIELD_GET(ENERGY_UNIT_MASK, value);
> +	sp->energy_unit = ENERGY_UNIT_SCALE * 1000000 / (1 << shift);

May be check power_unit/time_unit/energy_unit before leaving the 
function to make sure they are greater than zero as they are used to 
divide ?

> +	dev_dbg(sp->dev, "Units: energy=%dnJ, time=%dus, power=%duW\n",
> +		sp->energy_unit, sp->time_unit, sp->power_unit);

Check what can be used from units.h for all conversions done in this 
function

> +}
> +
> +static void spel_detect_powerlimit(struct spel_domain *sd)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u32 capabilities;
> +
> +	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
> +
> +	/*
> +	 * Detect power limits from hardware capabilities.
> +	 * Start from index 1 (POWER_LIMIT2) since PL1 is always enabled in spel_init_domains().
> +	 */
> +	for (int i = 1; i < ARRAY_SIZE(pl_names); i++) {
> +		for (int j = 0; j < ARRAY_SIZE(constraints); j++) {
> +			const struct spel_constraint_info *ci = &constraints[j];
> +
> +			if (ci->domain_id == sd->id && ci->pl_id == i) {
> +				if (capabilities & ci->supported_mask)
> +					sp->limits[sd->id] |= BIT(i);
> +				break;
> +			}
> +		}
> +	}
> +}
> +
> +static int spel_init_system(struct spel_system *sp, struct device *dev)
> +{
> +	/* Read unit configuration (common for all domains) */
> +	spel_update_unit(sp);
> +
> +	sp->domains = kcalloc(ARRAY_SIZE(spel_domain_names),
> +			      sizeof(struct spel_domain), GFP_KERNEL);

	devm_kcalloc() ?

> +	if (!sp->domains)
> +		return -ENOMEM;
> +
> +	spel_init_domains(sp);
> +
> +	for (int i = 0; i < ARRAY_SIZE(spel_domain_names); i++) {
> +		struct spel_domain *sd = &sp->domains[i];
> +
> +		mutex_init(&sd->lock);
> +		spel_detect_powerlimit(sd);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spel_register_powercap(struct spel_system *sp)
> +{
> +	struct spel_domain *sd;
> +	struct powercap_zone *power_zone;
> +	int nr_pl, ret;
> +
> +	/* Register SYS domain as parent zone */
> +	sd = &sp->domains[SPEL_DOMAIN_SYS];
> +	nr_pl = spel_find_nr_power_limit(sd);
> +
> +	power_zone = powercap_register_zone(&sd->power_zone,
> +					    sp->control_type, sd->name,
> +					    NULL, &zone_ops, nr_pl,
> +					    &constraint_ops);
> +	if (IS_ERR(power_zone)) {
> +		dev_err(sp->dev, "Failed to register power zone %s\n",
> +			sd->name);
> +		return PTR_ERR(power_zone);
> +	}
> +	sp->power_zone = power_zone;

Why is this power_zone needed ?

> +
> +	/* Register other domains as children */
> +	for (int i = 0; i < ARRAY_SIZE(spel_domain_names); i++) {
> +		struct powercap_zone *parent;
> +
> +		if (i == SPEL_DOMAIN_SYS)
> +			continue;
> +
> +		sd = &sp->domains[i];
> +
> +		/* SOC is child of SYS, others are children of SOC */
> +		if (i == SPEL_DOMAIN_SOC)
> +			parent = sp->power_zone;
> +		else
> +			parent = &sp->domains[SPEL_DOMAIN_SOC].power_zone;
> +
> +		nr_pl = spel_find_nr_power_limit(sd);
> +		power_zone = powercap_register_zone(&sd->power_zone,
> +						    sp->control_type,
> +						    sd->name, parent,
> +						    &zone_ops, nr_pl,
> +						    &constraint_ops);
> +
> +		if (IS_ERR(power_zone)) {
> +			dev_err(sp->dev, "Failed to register power_zone %s\n",
> +				sd->name);
> +			ret = PTR_ERR(power_zone);
> +			/* Unregister in reverse order: children first, then SOC, then SYS */
> +			for (int j = i - 1; j >= 0; j--)
> +				powercap_unregister_zone(sp->control_type,
> +							 &sp->domains[j].power_zone);
> +			return ret;
> +		}
> +	}
 > +
> +	return 0;
> +}
> +
> +static int spel_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct powercap_control_type *ct;
> +	struct spel_system *sp;
> +	int ret;
> +
> +	sp = kzalloc_obj(struct spel_system);
> +	if (!sp)
> +		return -ENOMEM;
> +
> +	sp->dev = dev;
> +
> +	/* Map config registers (units, capabilities) */
> +	sp->config_base = devm_platform_ioremap_resource_byname(pdev, "config");
> +	if (IS_ERR(sp->config_base)) {
> +		ret = PTR_ERR(sp->config_base);
> +		goto err_free_sp;
> +	}
> +
> +	/* Map constraint registers (power limits) */
> +	sp->constraint_base = devm_platform_ioremap_resource_byname(pdev, "constraints");
> +	if (IS_ERR(sp->constraint_base)) {
> +		ret = PTR_ERR(sp->constraint_base);
> +		goto err_free_sp;
> +	}
> +
> +	/* Map spel domain registers (energy counters) */
> +	sp->node_base = devm_platform_ioremap_resource_byname(pdev, "nodes");
> +	if (IS_ERR(sp->node_base)) {
> +		ret = PTR_ERR(sp->node_base);
> +		goto err_free_sp;
> +	}
> +
> +	sp->control_type = powercap_register_control_type(NULL, "qcom-spel",
> +							  NULL);
> +	if (IS_ERR(sp->control_type)) {
> +		dev_err(dev, "Failed to register control type\n");
> +		ret = PTR_ERR(sp->control_type);
> +		goto err_free_sp;
> +	}
> +
> +	/* Save control_type before it might be freed by spel_release_zone() */
> +	ct = sp->control_type;
> +
> +	/* Initialize system and domains */
> +	ret = spel_init_system(sp, dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize system\n");
> +		goto err_unregister_control;
> +	}
> +
> +	ret = spel_register_powercap(sp);
> +	if (ret) {
> +		dev_err(dev, "Failed to register powercap zones\n");
> +		/*
> +		 * If SYS zone was registered, err_cleanup inside spel_register_powercap
> +		 * already unregistered all zones and spel_release_zone freed sp->domains.
> +		 * If SYS was never registered (sp->power_zone == NULL), free manually.
> +		 */
> +		if (!sp->power_zone)
> +			kfree(sp->domains);
> +		kfree(sp);
> +		powercap_unregister_control_type(ct);
> +		return ret;
> +	}
> +
> +	platform_set_drvdata(pdev, sp);
> +
> +	return 0;
> +
> +err_unregister_control:
> +	powercap_unregister_control_type(ct);
> +err_free_sp:
> +	kfree(sp);
> +	return ret;
> +}
> +
> +static void spel_remove(struct platform_device *pdev)
> +{
> +	struct spel_system *sp = platform_get_drvdata(pdev);
> +	struct powercap_control_type *ct = sp->control_type;
> +
> +	/*
> +	 * Unregister in reverse order: children first, then SOC, then SYS.
> +	 */
> +	for (int i = ARRAY_SIZE(spel_domain_names) - 1; i >= 0; i--)
> +		powercap_unregister_zone(ct, &sp->domains[i].power_zone);
> +
> +	powercap_unregister_control_type(ct);
> +
> +	kfree(sp);
> +}
> +
> +static const struct of_device_id spel_of_match[] = {
> +	{ .compatible = "qcom,glymur-spel" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, spel_of_match);
> +
> +static struct platform_driver spel_driver = {
> +	.probe = spel_probe,
> +	.remove = spel_remove,
> +	.driver = {
> +		.name = "qcom_spel",
> +		.of_match_table = spel_of_match,
> +	},
> +};
> +
> +module_platform_driver(spel_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SPEL Powercap Driver");
> +MODULE_LICENSE("GPL");
> 

