Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55685405C51
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820611; cv=none; b=oD9CIyprQ4HORvRq4BohGkZfaRytt3IhFh2S6JoLYyhuD6S6hqi+DmjPC1a3dUoYJwk1DJTGdz0uiPKNDDoAH81LgAlnH7kRBVlWfRyICWOF/h6/RqPGC75ffoskefDpB9TKuLkbMeB21bHfl92H88EjsQeTtBW10kLR84lJS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820611; c=relaxed/simple;
	bh=zEhJKASbHR0/Z2Z5DjxxVOO8x82eneS7xE2fv7Wa3n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uRWgOYJbTzWRLIieGjx4SQeoi4elTEGOexgrHIOIqcQSDnb3yJd3HzvpBaNq6Yh7fRovqdi3hbeK+jDMitcvw+kR4iLvnoM3woWGWSL4354SF61HMGvwkohyudULCPM2maSKOGsg1E9kokJ8H6XDWKluTdAFtH1JwDZ3KEYhaf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBpHRlHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWFGoT2y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBpHRlHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWFGoT2y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH11ZY2022534
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yETUXvOsByL/NAMvrYeNRE4JXbzDCXQucw27T2MpDcY=; b=IBpHRlHNOLYvSVh3
	OgiE6aeRlXsMHZWPe21H62GNLKm+F9GOrfx2/ezWggOZDWC7LW8lfyqZ6D3rXpYc
	wYpxzaNaaTBRVt8II2QaN5bjnC6nS8OkLwi9J7QG7W1Q9WDAg6jknARbD+cD04BP
	0LIC3DeTKSHetzfoCLg2sGDCU6Pj1he5eYknV4dWV7/k0Cqpj4o2ME2sqCq8SA3q
	LN8HlZfoUR9+EMojyrCbw90dxf3p1mcR/BkVjpJZ5IgnODaB4oJIUUSF8S0rjx+m
	JT1PFBH/ShxhfVBExnIUc7YD3dJUcgwuIzXLBSM9QbMTEVVpnYRq/P3oKHWsfx6q
	+UhWdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edefugttf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 18:36:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d51ffb59so9793131cf.3
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779820608; x=1780425408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yETUXvOsByL/NAMvrYeNRE4JXbzDCXQucw27T2MpDcY=;
        b=jWFGoT2yQMU06dFztgjwtKh6NcJ8JapGUJLR45EaDbbVLseLp7LoPOmnnFp9vMfvnz
         52Ga6YEd0fao2O+QBMomouYeDr9iNRwNOs019UrJ2G39JuAEnIaYkdT9rcFBY19O+yNj
         kF+DYr5/xd9ZvWng8QXcpP53YRplNj6P17/vaffPAoKeV5GVyNSrInfsgt3eZqcxUMsk
         T8xKrhJUwF7kaAgfPdKU9zh82Rm2sImCOXE3R34xH56NLkEz+1rPlLVeKELJdx+06/2X
         agsiqsIFdc2HxOpa3v4kBLu7cOx5fCzed7T4hnXbfvEmruIMX83nqUi8G105h0Wn53oZ
         HExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820608; x=1780425408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yETUXvOsByL/NAMvrYeNRE4JXbzDCXQucw27T2MpDcY=;
        b=oRhSLpy/ZeOrE+HiKEKYhC3AjA8xo2x4mE6wL+0ZNmONg13xn4giZ18r40zaSRsNQY
         ISTD940PKnLL+JhYpyVRLSx+f40ipTBcfy5x5oMpRQgz+/DmnOByczAk2Yvd6faR/9DH
         Q/LfQ0hZrDD6Hh0gPX8c0j7y/fGXgmx+YPJVvOoSU5dDL6Y+KV9Mei0jKxiUiVTnFd2r
         MWjydDp8XsXqTqNszeU1Thi3UF3gcSC0V729bK8a/ciSnUa6BtBKB6Aho9+RXzrsG7+L
         tFlLBuFDfIXt+PE+Anr2GO8sy/NMgEsxsx94K3u7u3ky1krPLUKFDkSvKAvMkonfra58
         KScg==
X-Forwarded-Encrypted: i=1; AFNElJ+2YWN1Y6El+Uwo7zyNFsTgbmyLRjR/3IABFXtd3ZuMgESSlNBhVzg7P/IjAqDV0sMrYe7+Gbswbrt5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4rBvluL376Eb9rG6GsgGnPvioi80p9Q4JniVIW/OfA4eswIC4
	ENOxLLPMor+DrLMRKbGjHaDkzvlkvFg5hOE9vH4R1+dEGw4YrVVxqlJNJ1NcL10zHmUBxzpJX5K
	vCLNyPO3GZ0SYGhg/DGL6cXcO+Asb2hc9bl8W39k6Er6QKSBIUd5tJa2rBzjuL9xe
X-Gm-Gg: Acq92OGiJeOimwiQK7R/Baid26xjUUbpFwamzKRuZwxcAa4gXz/FYmc7L0owj93nIRq
	LAP+NDGIRzV1I/9TUWpDCqX90X3xGjhTiy6P+G6dQhYPNq8R0Z3MsTTjLo8x6UjBD1zt64/jx18
	t/loOUuspEDTapYFtKVZ/L0WMQCq374bb519TBWjNm1D0JMwqNfSiw1iSE+Rr/g8EHu2BxmSWCO
	86S3vswIaJHOTZNMiE5BDTsjMPXuDpVT/Q7oTNjS+JJ8M4PEgT1BrKKHOhEnBnIh9lZAjvVnoAq
	mZHdrsg12FfBg4rhf9eQXbrnp9QArEvsBXtS7U0s44hXW45jEXuJ2Nfkv/SZ4BvIhrNYtBJpRCI
	2t2WQHhzAcj2gd28ibpIbl5dCn82hU0yphGSQnz9Ka6+90UydJtZQHBdBAQIYlROrwzUSnh95+f
	e2Pi3rHwL8
X-Received: by 2002:a05:622a:5a97:b0:516:df5b:432b with SMTP id d75a77b69052e-516df5b49fcmr209849521cf.27.1779820607699;
        Tue, 26 May 2026 11:36:47 -0700 (PDT)
X-Received: by 2002:a05:622a:5a97:b0:516:df5b:432b with SMTP id d75a77b69052e-516df5b49fcmr209848861cf.27.1779820606982;
        Tue, 26 May 2026 11:36:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4907e7c1e24sm1607475e9.23.2026.05.26.11.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 11:36:46 -0700 (PDT)
Message-ID: <a1b599f9-44a8-4cd6-b4ea-5c28eef9f221@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:36:45 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2MyBTYWx0ZWRfX2pfyaEN3CScu
 Bpjye9tB2Q13fhoDp5EIsxQ0ZRZBM/ryZW4LkILS9rSgfU/XCpDSuGhycmUK2YS6za3NYd5hSTR
 tAFdr+10j2ZygeyUXqRkJrz6mS0c99ScCKX5llewwN59ZTO57ZAohX3+Wa47H/4G/BX5yEt2OgO
 OOCOHXasZbiV6Gc+Pby8KLvZ87nLsjoBT++6+0y4xzLhv3tyyRe+muKKB1yU5AitpRASgSGDRhc
 yX83jq72AQWbLKZJal+/roAepmWI8D44Es8Tmum8OTx77vCPInks7cN4UK5XOAzYc3mr2ikoObr
 zASS8JptULFIIo1IjFs7VCzceVfHJ9RiuluKzLKRP86f8V0ExnTyzx1QxDTU1kfoiIs6VtA5prF
 zf9GzKagwDGNYoUSbloVoRYNH53Y2PMBDkNijZFNm+rpMclPCd51RHr/YTMAr/uTeeMPFzIiN/7
 aM2i9OgHba7Uz+Pw6EQ==
X-Proofpoint-GUID: 5664T-J6BNJDNG_hlQlzl-5Wmw-zuDLa
X-Proofpoint-ORIG-GUID: 5664T-J6BNJDNG_hlQlzl-5Wmw-zuDLa
X-Authority-Analysis: v=2.4 cv=cPnQdFeN c=1 sm=1 tr=0 ts=6a15e840 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=d7Wn-mttVCXQ6RS2d3wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260163

On 5/19/26 12:49, Manaf Meethalavalappu Pallikunhi wrote:
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
>   MAINTAINERS                  |   1 +
>   drivers/powercap/Kconfig     |  13 +
>   drivers/powercap/Makefile    |   1 +
>   drivers/powercap/qcom_spel.c | 787 +++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 802 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c63f147e8c54..5c7542754ab6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22238,6 +22238,7 @@ M:	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/power/limits/qcom,spel.yaml
> +F:	drivers/powercap/qcom_spel.c
>   
>   QUALCOMM PPE DRIVER
>   M:	Luo Jie <quic_luoj@quicinc.com>
> diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
> index 03c4c796d993..e3a47c653499 100644
> --- a/drivers/powercap/Kconfig
> +++ b/drivers/powercap/Kconfig
> @@ -93,4 +93,17 @@ config DTPM_DEVFREQ
>   	help
>   	  This enables support for device power limitation based on
>   	  energy model.
> +
> +config QCOM_SPEL
> +	tristate "Qualcomm SPEL Powercap driver"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  This enables support for the Qualcomm SoC Power and Electrical
> +	  Limits (SPEL) hardware, which allows power limits to be
> +	  enforced and monitored on Qualcomm SoCs.
> +
> +	  SPEL provides energy monitoring and power capping for multiple
> +	  domains including system, SoC, CPU clusters, GPU, and various
> +	  other subsystems.
> +
>   endif
> diff --git a/drivers/powercap/Makefile b/drivers/powercap/Makefile
> index 5ab0dce565b9..8235fb9d3df6 100644
> --- a/drivers/powercap/Makefile
> +++ b/drivers/powercap/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_INTEL_RAPL) += intel_rapl_msr.o
>   obj-$(CONFIG_INTEL_RAPL_TPMI) += intel_rapl_tpmi.o
>   obj-$(CONFIG_IDLE_INJECT) += idle_inject.o
>   obj-$(CONFIG_ARM_SCMI_POWERCAP) += arm_scmi_powercap.o
> +obj-$(CONFIG_QCOM_SPEL) += qcom_spel.o
> diff --git a/drivers/powercap/qcom_spel.c b/drivers/powercap/qcom_spel.c
> new file mode 100644
> index 000000000000..fed5647959a5
> --- /dev/null
> +++ b/drivers/powercap/qcom_spel.c
> @@ -0,0 +1,787 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm SPEL (SoC Power and Electrical Limits) Driver
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitmap.h>
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
> +
> +/* SPEL register bitmasks */
> +#define ENERGY_STATUS_MASK		0xFFFFFFFF
> +
> +#define POWER_LIMIT_MASK		0x00007FFF
> +#define POWER_LIMIT_ENABLE		BIT(31)
> +
> +#define TIME_WINDOW_MASK_L		0x00007FFF	/* bits [14:0] */
> +#define TIME_WINDOW_MASK_H		0x007F0000	/* bits [22:16] */
> +
> +#define ENERGY_UNIT_OFFSET		16
> +#define ENERGY_UNIT_MASK		0xF0000
> +
> +#define TIME_UNIT_OFFSET		8
> +#define TIME_UNIT_MASK			0xF00
> +
> +#define POWER_UNIT_OFFSET		0
> +#define POWER_UNIT_MASK			0x7
> +
> +#define LIMITS_CAPABILITY_OFFSET	0x20
> +#define ENERGY_RPT_UNIT_OFFSET		0x04
> +
> +#define ENERGY_UNIT_SCALE		1000
> +
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
> +	NR_POWER_LIMITS,
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
> +static const char *pl_names[NR_POWER_LIMITS] = {
> +	[POWER_LIMIT1] = "pl1",
> +	[POWER_LIMIT2] = "pl2",
> +	[POWER_LIMIT3] = "pl3",
> +	[POWER_LIMIT4] = "pl4",
> +};

Do you want to use NR_POWER_LIMITS instead of ARRAY_SIZE() ?

Please unify the naming NR_POWER_LIMITS -> POWER_LIMITS_MAX

> +static const char *const spel_domain_names[] = {
> +	"sys", "soc", "cl0", "cl1", "cl2", "igpu", "dgpu", "nsp",
> +	"mmcx", "infra", "dram", "mdm", "wlan", "usb1", "usb2", "usb3",
> +};
> +
> +/* Domain register offsets in node base */
> +static const u32 domain_offsets[SPEL_DOMAIN_MAX] = {
> +	[SPEL_DOMAIN_SYS]	= 0x40,
> +	[SPEL_DOMAIN_SOC]	= 0x00,
> +	[SPEL_DOMAIN_CL0]	= 0x5C,
> +	[SPEL_DOMAIN_CL1]	= 0x60,
> +	[SPEL_DOMAIN_CL2]	= 0x64,
> +	[SPEL_DOMAIN_IGPU]	= 0x08,
> +	[SPEL_DOMAIN_DGPU]	= 0x44,
> +	[SPEL_DOMAIN_NSP]	= 0x0C,
> +	[SPEL_DOMAIN_MMCX]	= 0x10,
> +	[SPEL_DOMAIN_INFRA]	= 0x18,
> +	[SPEL_DOMAIN_DRAM]	= 0x1C,
> +	[SPEL_DOMAIN_MDM]	= 0x48,
> +	[SPEL_DOMAIN_WLAN]	= 0x4C,
> +	[SPEL_DOMAIN_USB1]	= 0x50,
> +	[SPEL_DOMAIN_USB2]	= 0x54,
> +	[SPEL_DOMAIN_USB3]	= 0x58,
> +};

Same comment

> +/**
> + * struct spel_constraint_info - Power limit constraint information
> + * @limit_offset:	Register offset for power limit value
> + * @time_window_offset:	Register offset for time window
> + * @supported_mask:	Bit mask in capability register

Where is 'supported_mask' initialized?

> + * @domain_id:		Domain this constraint applies to
> + * @pl_id:		Power limit ID (PL1, PL2, etc.)

[ ... ]

> +
> +/**
> + * struct spel_domain - SPEL power domain
> + * @power_zone:		Powercap zone
> + * @lock:		Mutex protecting register access
> + * @sp:			Parent system
> + * @status_reg:		Energy counter register
> + * @pl_name:		Power limit names
> + * @name:		Domain name
> + * @id:			Domain type ID
> + */
> +struct spel_domain {

[ ... ]

> +	struct spel_system *sp;

[ ... ]

> +struct spel_system {
> +	struct spel_domain *domains;

[ ... ]

> +};

There is a cyclic dependency between struct spel_system <-> struct 
spel_domain. Could it be solved ?

> +#define power_zone_to_spel_domain(_zone) \
> +	container_of(_zone, struct spel_domain, power_zone)
> +
> +/* Helper functions */
> +static bool is_pl_valid(struct spel_domain *sd, int pl)
> +{
> +	if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
> +		return false;

The call to this function is strange. It is like you don't trust your 
own code.

> +	return sd->pl_name[pl] ? true : false;
> +}
> +

[ ... ]

> +
> +	switch (pl_op) {
> +	case PL_LIMIT:
> +		value &= POWER_LIMIT_MASK;
> +		if (xlate)
> +			*data = spel_unit_xlate(sd, POWER_UNIT, value, 0);
> +		else
> +			*data = value;
> +		break;
> +	case PL_TIME_WINDOW:
> +		/* Decode time window: bits [22:16] are upper 7 bits, [14:0] are lower 15 bits */
> +		value = ((value & TIME_WINDOW_MASK_H) >> 16 << 15) |
> +			(value & TIME_WINDOW_MASK_L);

[ ... ]

> +		reg_val = (reg_val & ~POWER_LIMIT_MASK) | new_val;
> +

[ ... ]

> +		if (new_val == 0)
> +			reg_val &= ~POWER_LIMIT_ENABLE;
> +		else
> +			reg_val |= POWER_LIMIT_ENABLE;
> +		break;

[ ... ]

> +	case PL_TIME_WINDOW:
> +		/*
> +		 * Encode time window: upper 7 bits to [22:16], lower 15 bits to [14:0]
> +		 * Time window register is separate from limit register (different offset),
> +		 * so we write only the time window bits without preserving any enable bit.
> +		 */
> +		new_val = spel_unit_xlate(sd, TIME_UNIT, value, 1);
> +		reg_val = (((new_val >> 15) & 0x7F) << 16) |
> +			  (new_val & 0x7FFF);


The trend today is to use the FIELD_* macros for bits ops

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(reg_val, reg_addr);
> +	return 0;
> +}
> +
> +/* Powercap zone operations */
> +static int spel_get_energy_counter(struct powercap_zone *power_zone, u64 *energy_raw)
> +{
> +	struct spel_domain *sd = power_zone_to_spel_domain(power_zone);
> +	u64 value;
> +
> +	value = readl(sd->status_reg);

nit: seems an line in between would help for the readability

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

nit: missing line

> +	return 0;
> +}
> +
> +static int spel_release_zone(struct powercap_zone *power_zone)
> +{
> +	return 0;
> +}
> +
> +static int spel_find_nr_power_limit(struct spel_domain *sd)
> +{
> +	int i, nr_pl = 0;
> +
> +	for (i = 0; i < NR_POWER_LIMITS; i++) {
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
> +	.release = spel_release_zone,
> +};
> +
> +/* Constraint operations */
> +static int spel_constraint_to_pl(struct spel_domain *sd, int cid)
> +{
> +	int i, j;

'j' name is misleading because it is usually used for nested 'for' blocks

> +	for (i = POWER_LIMIT1, j = 0; i < NR_POWER_LIMITS; i++) {

Do not rely on POWER_LIMIT1 because if someday it is moved in the enum, 
all the code assuming it is zero will be broken

> +		if (is_pl_valid(sd, i) && j++ == cid)
 > +			return i;> +	}
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
> +	if (id >= 0)
> +		return sd->pl_name[id];
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
> +	for (i = 0; i < SPEL_DOMAIN_MAX; i++) {
> +		struct spel_domain *sd = &sp->domains[i];
> +
> +		sd->sp = sp;
> +		snprintf(sd->name, SPEL_DOMAIN_NAME_LENGTH, "%s",
> +			 spel_domain_names[i]);
> +		sd->id = i;
> +		sd->status_reg = sp->node_base + domain_offsets[i];
> +
> +		/* PL1 is always supported (required for powercap registration) */
> +		sp->limits[i] = BIT(POWER_LIMIT1);
> +		sd->pl_name[POWER_LIMIT1] = pl_names[POWER_LIMIT1];
> +	}
> +}
> +
> +static int spel_check_unit(struct spel_system *sp)
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
> +	shift = (value & POWER_UNIT_MASK) >> POWER_UNIT_OFFSET;
> +	sp->power_unit = 1000000 / (1 << shift);
> +
> +	shift = (value & TIME_UNIT_MASK) >> TIME_UNIT_OFFSET;
> +	sp->time_unit = 1000000 / (1 << shift);
> +
> +	/* Read energy_unit from ENERGY_RPT_UNIT_OFFSET */
> +	value = readl(sp->config_base + ENERGY_RPT_UNIT_OFFSET);
> +
> +	/*
> +	 * Unit calculation: 1 / (2^shift)
> +	 * Masks limit: ENERGY_UNIT (4 bits, max 15).
> +	 */
> +	shift = (value & ENERGY_UNIT_MASK) >> ENERGY_UNIT_OFFSET;
> +	sp->energy_unit = ENERGY_UNIT_SCALE * 1000000 / (1 << shift);
> +
> +	dev_dbg(sp->dev, "Units: energy=%dnJ, time=%dus, power=%duW\n",
> +		sp->energy_unit, sp->time_unit, sp->power_unit);
> +
> +	return 0;
> +}
> +
> +static void spel_detect_powerlimit(struct spel_domain *sd)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u32 capabilities;
> +	int i, j;
> +
> +	capabilities = readl(sp->config_base + LIMITS_CAPABILITY_OFFSET);
> +
> +	/* Detect power limits from hardware capabilities */
> +	for (i = POWER_LIMIT2; i < NR_POWER_LIMITS; i++) {

For my understanding, why is it starting at POWER_LIMIT2 ?

> +		for (j = 0; j < ARRAY_SIZE(constraints); j++) {
> +			struct spel_constraint_info *ci = &constraints[j];
> +
> +			if (ci->domain_id == sd->id && ci->pl_id == i) {
> +				if (capabilities & ci->supported_mask) {
> +					sp->limits[sd->id] |= BIT(i);
> +					sd->pl_name[i] = pl_names[i];

So, that explains the is_pl_valid()

Please do not use duplicated array with non-NULL pointer checks

Or sd->pl_name[] contains all the *valids* power limits, so its size is 
different than (or equal to) pl_names. Or it is a fixed array with a 
structure containing a flag telling if it is enabled or not.

No need to duplicate the array

> +				}
> +				break;
> +			}
> +		}
> +	}
> +}
> +

[ ... ]

> +static void spel_remove(struct platform_device *pdev)
> +{
> +	struct spel_system *sp = platform_get_drvdata(pdev);
> +	int i;
> +
> +	if (!sp)
> +		return;

Why test if the value is correct? There is no reason it changed after 
'probe' was successful

> +
> +	/* Unregister in reverse order: children first, then SOC, then SYS */
> +	for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
> +		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
> +
> +	powercap_unregister_control_type(sp->control_type);
> +}
> +
> +static const struct of_device_id spel_of_match[] = {
> +	{ .compatible = "qcom,spel" },
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

