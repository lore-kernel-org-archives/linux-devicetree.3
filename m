Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4972C1595
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775411015; cv=none; b=oR21d6rL4W9Uktd1pPPj0ZnmV6Vok7/EwgykXqcbV3A4MqmeZdakqjg8kXGWZvUEfmBNm/fY0sFMOUEIe/SJivR5y9cJiOkpkfSq7lFQoXfMELYxXCtSwR9CFYe0Z3F1rgXmA+70WkGWlzmQrth7b1Ry/meVZwiTFQhGiawo6d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775411015; c=relaxed/simple;
	bh=8AYutSBNxhirdm3vl5U5Yr1kjyfiBwdfnW4VEpUAZYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4rZT5hEg1PgW/7I0+g9afgTEYgdz7JIuy7eWut2Z62yJMP86UoRfzSU7+I1E7IxVqh5sGNAJvDWPqC/hy/B6fONLWIcMLCsS/+5kREIwmURul8ZPH15556D2FRbnftvbDae/jEiH0h/N38O1Ahu3WXB9yrI3DhylsZ49GzzC2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbX/eEvT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tz8AhwQ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbX/eEvT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tz8AhwQ0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635B8xi71287818
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 17:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=; b=LbX/eEvTnzwEFLhU
	I2s5KZPMTioOBcoSRTafPGPgyBceUg//BkyPEuwVpYAPn+r9cIhcI07XxkD7HeOM
	FwlsVgPg3IeA1kyYCV/CDz/dyWHsHqcLD5xckXYDMqIlfgHpqzoMZm/iN3gvNIRZ
	AfYLCSdzqFfUSSyDuEBgs0+Aj6WRCYA4WQrnHeTddq/XeRdc1fUh0wJLFVw/8dUm
	pMSleD8xogqw3Y/H/ztrB6x06i/3+5gGPvPVUfvclpmSHpHbXeP98b7KGzXWsfos
	b9i3Xg8WrL/1hjwH2xTxannEB3IcB9MeqSoiXUuIgFTBqr3TMDZ6e5Q5hxBdsmqd
	U49fDQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfk4ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 17:43:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b242cbb97aso25849585ad.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 10:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775411012; x=1776015812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=;
        b=Tz8AhwQ0LqSRofKTLpyD2IvZhN6EBOBQBw6SndqQ6WqA8wA+jk3AIfTACHZhw/eBMw
         ij/CVPOtWaobZPw+cAMc8GWSQwRRUyWkjDc958sMW2btLJq5sPJaL4GutqGADQr4QuKe
         9ayoLUlVM8rWvlPVVEM4UVG5LVcdKMzrQirycewKDPohWHjtuhIG4IEUGwSxSDKnA4nr
         U6efDJFp+FA+Xp8z3OsL9xTFoCF/IUdrWg0slI1pjCwBuniKJm7liDEGMWcK+szocL2+
         Uub7bHUnZcWz/oQzg2Aa+3Qnvfitq+UZSw22cogSf+mVzr37WtfQ+c/XzTtFtV5tYXGg
         PJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775411012; x=1776015812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XkM+2yAjpoUaiYNjVRvr//cDFi3N0pFQu5koKYf3aI=;
        b=UU69lgEhOG+fsPP9EijWXvTUT+d3C3uMCgMkhJDdjdM5wlRX0vbP7q1uP8ckTjSQnu
         s8caEfM8Nlqk3pa9P52cq7PTg0qS5LhXPnyEyHQ8t0E/PbOsa3bWKU3yBijueQMlbAd3
         pwlH3Bkr6Jl/8S1FJnrYMNOelSH8+0R2KUkEKHISxxq9FWK6z2Otb220/q6V3wlrzY1J
         3H2TaFgB1rH6NA+h8CUdzO8ZU6i/GHege5s5nursIWc0rWRhSarvHk+Wix2RGmQU4Cv5
         p+TzqfJgeLuQllI7KtEL9ElTkyeHBLJZ9GMtC0cQTTs0XipIDcuhxuf1DNwvSb1OIeHN
         n5sw==
X-Forwarded-Encrypted: i=1; AJvYcCW6sKgC6EuwKMnPqC+PTmFWZERzEAlVBTiFrVTaek5D5vKqsHedxsyXmdNWsVQGtdvTbXYat/Rum4Jg@vger.kernel.org
X-Gm-Message-State: AOJu0YzqyKhOucHeUMqsgegQKYkJJeKM/sfFJGQkN2T4UfScTCCrNApY
	+EsGpCemyBB09uMArfYsUkYGqjeiclqLP04ROgCi7dKL9iuBbAv3EeHkXHT//LctaiUYD1QVEV/
	g/m/+QXrXo3r453stLKQ4cdcK63jDCKwHqZtepeu51FpuQiTqjpoi7+l4YqumGiH0
X-Gm-Gg: AeBDieuFKQok2Y1+5LnQksdK0KOz2bjbKR7eMDyfv/o3uNCMk1Y4AXYmlCuUzkExP2j
	5UEeb99wcliAJE8E0P8O4+v8XF4qKAdYVeTf7aetBDPFnG2oas5n8/fT5ndBDylbHGn6I1/0H+U
	iCYyGr+va+5eq+nC9J+tLbhdqU6XC/F9leF6tqOjBqvDhQSfaQmwhvVtCxD6kjuARkZI9HNTgbC
	4frRgK+YkDxqBXFVI+NUMSbKsRLmmS72bIBC2HSfMqWIB2Z3IyBhFzaCNqK0eNDil2eX+fFQh15
	9wPvwK9nSH2m6HPDo/iZAqPFMOHkSr6W/284xoHygcrw+s+klUck5RPj+ov+mfwa7oGKlRCMiXG
	KUAHdUbOYG02v6q34IRyXpy0B4z9yhMZGB7N30VgVwLfmgmkkEXjD
X-Received: by 2002:a17:902:e547:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b2818329f3mr106632555ad.28.1775411012012;
        Sun, 05 Apr 2026 10:43:32 -0700 (PDT)
X-Received: by 2002:a17:902:e547:b0:2ae:6092:8d93 with SMTP id d9443c01a7336-2b2818329f3mr106632465ad.28.1775411011488;
        Sun, 05 Apr 2026 10:43:31 -0700 (PDT)
Received: from [192.168.29.179] ([49.43.224.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd07sm104541985ad.72.2026.04.05.10.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 10:43:31 -0700 (PDT)
Message-ID: <49d6b663-89e8-4cae-854b-08ba4dd9268c@oss.qualcomm.com>
Date: Sun, 5 Apr 2026 23:13:24 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: qcom: add the TLMM driver for the Nord
 platforms
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-2-4864f400c700@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE4MCBTYWx0ZWRfX74qj2dy6zlQd
 F2Yq4bvHgKlhRjlxKnyTVLy/lbocvLPu9sazfS266d93Kbt/UAAGqucraHDmrwEUAOQwVrbhsZN
 Q6CBYPLklHsrit9uzEY6goZhrHuTNhdXO+XwYgK08iyNt+tQCD2UQVfYbVCm0OJ3wLzUasY8k+i
 2PU+k7an8q5i7edL2/NgNHTdiJIyDmtapzzzGUkJiMyzm4vhb/p+OWfZwkKmKjOElMaOus1QP/+
 7loyKm49uLLXJbN06Gz6gGE82WLADNL2nN0kJqCoZnma+Y36+zKtFbZCQwqlNaGSHb0rfhCDUXR
 XoIThsX0QIDscfoWj0BTU9XEtMkDr2me5hpnOrRoy+wZx5Dmdih5DN6d/b3hQVWf1RYW+ukv4Sa
 TRkbhGxjNIj7cqz8DjoacPlniorBdt73acNDohlQAM0D4ckHyTgRmEMWXmh+X3Dlbp9Senhngzp
 AMyaZQUIf7MQ3aCTYwg==
X-Proofpoint-ORIG-GUID: XNTj_X9RWROpbDGQv9zrlYTxUF2JHD5A
X-Proofpoint-GUID: XNTj_X9RWROpbDGQv9zrlYTxUF2JHD5A
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d29f45 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=oIx2Y1K4xXJD395LZaDjnw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=mS-AFIv6WIZp_N3KX8YA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050180



On 4/3/2026 6:57 PM, Bartosz Golaszewski wrote:
> Add support for the TLMM controller on the Qualcomm Nord platform.
> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |    7 +
>  drivers/pinctrl/qcom/Makefile       |    1 +
>  drivers/pinctrl/qcom/pinctrl-nord.c | 3297 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3305 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
> index 6df6159fa5f89f9f0470e700b4698dc8849ed515..6698e2a50b2f67b1aadb4a840339e769c92f95f8 100644
> --- a/drivers/pinctrl/qcom/Kconfig.msm
> +++ b/drivers/pinctrl/qcom/Kconfig.msm
> @@ -261,6 +261,13 @@ config PINCTRL_SA8775P
>  	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
>  	  TLMM block found on the Qualcomm SA8775P platforms.
>  
> +config PINCTRL_NORD
> +	tristate "Qualcomm Technologies Inc NORD (SA8797p) pin controller driver"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
> +	  TLMM block found on the Qualcomm NORD platforms.
> +
>  config PINCTRL_SAR2130P
>  	tristate "Qualcomm Technologies Inc SAR2130P pin controller driver"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
> index a8fd12f90d6e6f8e139097cc0a81d6f178f09000..ba6e9408373ff4327bb0c092f1f30889998503a1 100644
> --- a/drivers/pinctrl/qcom/Makefile
> +++ b/drivers/pinctrl/qcom/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_MDM9607)	+= pinctrl-mdm9607.o
>  obj-$(CONFIG_PINCTRL_MDM9615)	+= pinctrl-mdm9615.o
>  obj-$(CONFIG_PINCTRL_MILOS) += pinctrl-milos.o
>  obj-$(CONFIG_PINCTRL_MILOS_LPASS_LPI) += pinctrl-milos-lpass-lpi.o
> +obj-$(CONFIG_PINCTRL_NORD)	+= pinctrl-nord.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-gpio.o
>  obj-$(CONFIG_PINCTRL_QCOM_SPMI_PMIC) += pinctrl-spmi-mpp.o
>  obj-$(CONFIG_PINCTRL_QCOM_SSBI_PMIC) += pinctrl-ssbi-gpio.o
> diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..82e519abaf75771817a0f811c6af80c4f98e93ed
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-nord.c
> @@ -0,0 +1,3297 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.

This should be a year-less copyright as per internal guidance.

Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-msm.h"
> +
> +#define REG_SIZE 0x1000
> +#define PINGROUP(id, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11)    \
> +	{                                                             \
> +		.grp = PINCTRL_PINGROUP("gpio" #id,                   \
> +					gpio##id##_pins,              \
> +					ARRAY_SIZE(gpio##id##_pins)), \
> +		.ctl_reg = REG_SIZE * id,                             \
> +		.io_reg = 0x4 + REG_SIZE * id,                        \
> +		.intr_cfg_reg = 0x8 + REG_SIZE * id,                  \
> +		.intr_status_reg = 0xc + REG_SIZE * id,               \
> +		.intr_target_reg = 0x8 + REG_SIZE * id,               \
> +		.mux_bit = 2,                                         \
> +		.pull_bit = 0,                                        \
> +		.drv_bit = 6,                                         \
> +		.egpio_enable = 12,                                   \
> +		.egpio_present = 11,                                  \
> +		.oe_bit = 9,                                          \
> +		.in_bit = 0,                                          \
> +		.out_bit = 1,                                         \
> +		.intr_enable_bit = 0,                                 \
> +		.intr_status_bit = 0,                                 \
> +		.intr_target_bit = 5,                                 \

Similar to pinctrl-kaanapali.c, Nord platform have these bit positions as,

 .intr_wakeup_present_bit = 6,
 .intr_wakeup_enable_bit = 7,
 .intr_target_bit = 8,       


> +		.intr_target_kpss_val = 3,                            \
> +		.intr_raw_status_bit = 4,                             \
> +		.intr_polarity_bit = 1,                               \
> +		.intr_detection_bit = 2,                              \
> +		.intr_detection_width = 2,                            \
> +		.funcs = (int[]){                                     \
> +			msm_mux_gpio, /* gpio mode */                 \
> +			msm_mux_##f1,                                 \
> +			msm_mux_##f2,                                 \
> +			msm_mux_##f3,                                 \
> +			msm_mux_##f4,                                 \
> +			msm_mux_##f5,                                 \
> +			msm_mux_##f6,                                 \
> +			msm_mux_##f7,                                 \
> +			msm_mux_##f8,                                 \
> +			msm_mux_##f9,                                 \
> +			msm_mux_##f10,                                \
> +			msm_mux_##f11 /* egpio mode */                \
> +		},                                                    \
> +		.nfuncs = 12,                                         \
> +	}
> +
> +#define SDC_QDSD_PINGROUP(pg_name, ctl, pull, drv)                   \
> +	{                                                            \
> +		.grp = PINCTRL_PINGROUP(#pg_name,                    \
> +					pg_name##_pins,              \
> +					ARRAY_SIZE(pg_name##_pins)), \
> +		.ctl_reg = ctl,                                      \
> +		.io_reg = 0,                                         \
> +		.intr_cfg_reg = 0,                                   \
> +		.intr_status_reg = 0,                                \
> +		.intr_target_reg = 0,                                \
> +		.mux_bit = -1,                                       \
> +		.pull_bit = pull,                                    \
> +		.drv_bit = drv,                                      \
> +		.oe_bit = -1,                                        \
> +		.in_bit = -1,                                        \
> +		.out_bit = -1,                                       \
> +		.intr_enable_bit = -1,                               \
> +		.intr_status_bit = -1,                               \
> +		.intr_target_bit = -1,                               \
> +		.intr_raw_status_bit = -1,                           \
> +		.intr_polarity_bit = -1,                             \
> +		.intr_detection_bit = -1,                            \
> +		.intr_detection_width = -1,                          \
> +	}
> +
Remove unused #define SDC_QDSD_PINGROUP.

> +#define UFS_RESET(pg_name, offset)                                   \
> +	{                                                            \
> +		.grp = PINCTRL_PINGROUP(#pg_name,                    \
> +					pg_name##_pins,              \
> +					ARRAY_SIZE(pg_name##_pins)), \
> +		.ctl_reg = offset,                                   \
> +		.io_reg = offset + 0x4,                              \
> +		.intr_cfg_reg = 0,                                   \
> +		.intr_status_reg = 0,                                \
> +		.intr_target_reg = 0,                                \
> +		.mux_bit = -1,                                       \
> +		.pull_bit = 3,                                       \
> +		.drv_bit = 0,                                        \
> +		.oe_bit = -1,                                        \
> +		.in_bit = -1,                                        \
> +		.out_bit = 0,                                        \
> +		.intr_enable_bit = -1,                               \
> +		.intr_status_bit = -1,                               \
> +		.intr_target_bit = -1,                               \
> +		.intr_raw_status_bit = -1,                           \
> +		.intr_polarity_bit = -1,                             \
> +		.intr_detection_bit = -1,                            \
> +		.intr_detection_width = -1,                          \
> +	}
> +
> +#define QUP_I3C(qup_mode, qup_offset) \
> +	{                             \
> +		.mode = qup_mode,     \
> +		.offset = qup_offset, \
> +	}
> +

Same, Remove unused #define QUP_I3C.

Thanks,
Maulik
