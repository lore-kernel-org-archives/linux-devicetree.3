Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE153B83F9
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733362; cv=none; b=unGg1rW8CE0OUobZDmpXoWEGZGLORx2rP10vZbobzLAs+CcLT7eY2OjwLDlgqTz4A/GJqiYac6uqQyX0UlTSpua4xyunXBn9VfhDHvovNlALsK27qJFGMBarniqkz1Z2ByO7Uo3FG8GK365axhPjgLQAdgDKPZ2VfVZoIRY9c4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733362; c=relaxed/simple;
	bh=sgp6leAQ6Ci8MctwGXn9I1MP9GjojIjqv6SjG5rRokA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKrqMF5sdSqpRM3UK5xJd6ZhRDdvXpGywEZXpGD4OJg35lN0Jlqe7YPyVZ8K/gYqoDa6Us54NF0qR9u3OPXger3ABUkBU7jVYtBQjRYgsxuL7rgc0RsCCUtMDOwNyxfXkCuJVMFKwqPX6ayrQXtGKqNHWX3UQsgLI+6EdCMxTTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=itSrMuku; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLW01ubs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="itSrMuku";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLW01ubs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S61X4097203
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LFBmbkwRv75Iy81ol2HJDDtE2esfJUZGfO3cwhjIHpE=; b=itSrMukurVYXg9o4
	4UVsL6z6cfqgfpu160pvfbMDDB7cBEtDuYuaEcycbwrRQBqC+mxBds2Ciu3khbIo
	Np74v+6RTgA0qy6HJoRcZuFkxU417yopTqNjPIjSXjEhHzJxoe9oSc9Qfrqap797
	ooVOvBynN5V2W1HOoMtReMTvaY8gze+MHxv4MJWnFDxTOV5E8QZCFmBviRISmLFl
	FKOtqLTHJGBgVJ1VNZIta9tr6rffACeWCwBLfFsnO2w1GbW37pyO+bB/z4wcaa3w
	UyjUbYWeK0g44MBiBKBaqC77ejlPnK9otEN7KhGeF0FmIDTXeEMdVbgy/zS/5Hz/
	Nt4huA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcetymf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 08:35:58 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so901462a12.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 01:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733358; x=1788338158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LFBmbkwRv75Iy81ol2HJDDtE2esfJUZGfO3cwhjIHpE=;
        b=PLW01ubsd2niRbAlyOxbu5eQMlQZJpEIZmFX8ge0eFtwivt16Ub6IqgiLJe8Oma6Lx
         Fhn6ZZ9/bQC4djacVKMYzq812yaL4NyJAeS1zgxL8zPxb9W7D4NdV0q//dQZdhofldvJ
         AXYXJC+rgaJVZEaCSvkp5Nh8hp9543ZN9vYKrz5MP5IhyQU1pblJUnzlks02GJV3p7S7
         kdIGQdTotcFwKHswFiHXoHlBtsIESxfrQtV1FMuv1Oo7pyRcDIy+FpO6REdofjcA2zBb
         gJd/I43pm+nj/x5jKhFgMhBAXUlK2VvjhURvnaZpX/jJE130zO5D+Bd/tbZnyu45N53v
         458Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733358; x=1788338158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFBmbkwRv75Iy81ol2HJDDtE2esfJUZGfO3cwhjIHpE=;
        b=ixcV1yJ/OatQ6fPFRWWEqFbSBluv401aW0FpcYIYu433AkOQAuB15VEkJDHgmarXK9
         YjJpJ7Db9qT4Rb2WcwqaPwsVMt8z9WL41Uzs58Cs82daKBlu1b+dSSdDl23+O7f6XCkp
         97lA1g7Mbsbtov90KNwvTLxwVlBiNKv3pMn69jYSbj2JzXg4S6/rSI0YNOkdV5pWUjXN
         VZC7/wlOnNxbWgHIUlGVI0fLb1rl22YGOFiAWzisYiyONkp4Y/MbdS0h4cjsYikkv4EQ
         L/hOhYckM4mYkAJvY4s7Nv6TlqpBgyH2RNlpz37d9MKjf16tP/skpyBYbaVSaSoY1UYc
         n10A==
X-Forwarded-Encrypted: i=1; AHgh+RolmqAms2L49F3EQPItE+1681y6IS59BiAtO/iEH2nKoXZCEOc4/vwj9Q3Ru/Eir/gQhvJVrCi+9qys@vger.kernel.org
X-Gm-Message-State: AFuF++ljC3AOP2t3lwESONSBuizHU45TbW4rtE5J9/mQIdaacBmyDzqs
	OOUueXSCv64KAU5ruZAk8cwtyZgq/lqlnLOU0cwQwVKWn8897l2aLtKfa/9DIW53fkmtSRiWqu6
	f4VCO3qC8MUnZ0cQmrCqTDqr3uscp+mGrcy5MS0BE74oJYakBXH73CWGGHg+uMqtK
X-Gm-Gg: AR+sD12RQ/wN4pisMJesuj9XdqYzq84q1lPnmtQxslQu8E52Khuo4KhpAOc3ymg/lb4
	9JwJeoO0BALhaJDn8G1HMQHbwg9iJYzRR43226XmWrlkPcCbLEy2Yrtpf/F1MV7Y9ls/mzHOGXL
	HSypytLaagNbQ4oQzmlqs4Gm+z6QFc3z6Xn5HQ9E1x3pEPg+c1La/O+Va/+2sxnEEGc7rWl8MUH
	2nMKUfUboX9nvPu2EdRdK9KBeo0gyOV71YeKkbVxnw9wAUujAzRwSb5w15A/8pF7YNtBmDLDeEV
	91ZNVfvBtvUZuyOD+H1SKCtIRwmXc50g0zuAInTahabFTe5cGjVex99u8Hs/7rsWOGAEvGJvKES
	847IXhayIZjZ6K9l0seqmlpcxTfmw7WmzR0fWHpY=
X-Received: by 2002:a05:6a21:4514:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3cf7607aa02mr10635908637.5.1787733357937;
        Wed, 26 Aug 2026 01:35:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:4514:b0:3c3:88a5:83db with SMTP id adf61e73a8af0-3cf7607aa02mr10635787637.5.1787733357443;
        Wed, 26 Aug 2026 01:35:57 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9e5fb1sm10935309eec.25.2026.08.26.01.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:35:56 -0700 (PDT)
Message-ID: <9c1dddb8-5f1b-4b7c-b810-64cbd6f7ccac@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 14:05:50 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] ASoC: qcom: Add Shikra QAIF support
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260824063627.3595610-9-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ea56e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ucsujeaMqt6kVaRVrNoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfX6nHAN2jkPs57
 NwSlqWpaINEAIksBfWMIcJt6XYwxvB+RxlsIXubr1AM6mNEQkH4OaAC8RnP29txEGzL9gv6ZeCS
 Jr6yo3XZGsjWxAvneMu8L0GQhg5/Kms=
X-Proofpoint-ORIG-GUID: nNnsgadVo54cIGJcyvct4vnQSPSHiGiP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MCBTYWx0ZWRfXx6cPkAIz+BVd
 FdXEJYcjbY7WtPB9fiXEPCJm6cMd4B3sXUCRKG+whNzfCuD69E2lv6ceKPjJscGr/jKkb0KsH3f
 wSwGHLuGL5xiTmoKLNds21hQOaECpoe/DiTlLyjz5tMoLADCnt6xGjel+ogjOxROlx3JRhZuz/T
 M7KAkQi7G9HGUSqFF2kwr7PCxj1ZohrwvZri/Gq4PDlgQbrYTf50WW0PJzdGJgRzBkfDKxkJXHw
 gTypjAljNlvQ+tgfjuITXmrw3mGcV3WVsJgltOGnrrB8g3An3YkHJOXrvLFsqeAWALOCCW0WNMD
 KeGaokMJrnXfd1sRMPZNytZwmlp0kFDxRTVeC+X1T4pkgy3cbZHkwJ1DXD29LTcKbar6P8Cz4Td
 TIbITGcZWwE8pX5iuYge4liSKR4R8isox6minIYoqPcKVLuCc6NmlBXYTAmFYruJcxuyY2obBYX
 mTAiJYsn+4sJy8OCwjg==
X-Proofpoint-GUID: nNnsgadVo54cIGJcyvct4vnQSPSHiGiP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260070



On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> Provide the Shikra DMA-to-DAI mappings, DMA and SHRAM layout, clock
> names, DAI driver data and power-management hooks required by the QAIF
> driver. Add the Kconfig symbol and Makefile entries needed to build the
> new variant.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>   sound/soc/qcom/Kconfig       |  10 +
>   sound/soc/qcom/Makefile      |   3 +
>   sound/soc/qcom/qaif-shikra.c | 425 +++++++++++++++++++++++++++++++++++
>   3 files changed, 438 insertions(+)
>   create mode 100644 sound/soc/qcom/qaif-shikra.c
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index e6e24f3b9922..b7088b1e5cad 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -71,6 +71,16 @@ config SND_SOC_QCOM_COMMON
>   config SND_SOC_QCOM_SDW
>   	tristate
>   
> +config SND_SOC_QCOM_QAIF
> +	tristate "Qualcomm QAIF audio interface support"
> +	depends on COMMON_CLK
> +	select REGMAP_MMIO
> +	help
> +	  Say Y or M to enable the Qualcomm Audio Interface (QAIF) driver
> +	  for the Shikra audio platform. QAIF is a DMA-based audio
> +	  subsystem that moves PCM data between memory and external serial
> +	  audio interfaces (AIF) and internal codec interfaces (CIF).
> +
>   config SND_SOC_QDSP6_COMMON
>   	tristate
>   
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 985ce2ae286b..cf50b7a24bcf 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -47,3 +47,6 @@ obj-$(CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS) += snd-soc-qcom-offload-utils.o
>   
>   #DSP lib
>   obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
> +
> +snd-soc-qcom-qaif-y := qaif-cpu.o qaif-platform.o qaif-shikra.o
> +obj-$(CONFIG_SND_SOC_QCOM_QAIF) += snd-soc-qcom-qaif.o
> diff --git a/sound/soc/qcom/qaif-shikra.c b/sound/soc/qcom/qaif-shikra.c
> new file mode 100644
> index 000000000000..484ffaa5b304
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-shikra.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-shikra.c -- ALSA SoC CPU-Platform DAI driver for QTi QAIF
> + */
> +
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include "qaif.h"
> +
> +static const struct qaif_dmaidx_dai_map shikra_mi2s_dma_dai_map[] = {
> +	{ QAIF_MI2S_AIF0, QAIF_DMA_IDX0 },
> +	{ QAIF_MI2S_AIF1, QAIF_DMA_IDX1 },
> +	{ QAIF_MI2S_AIF2, QAIF_DMA_IDX2 },
> +	{ QAIF_MI2S_AIF3, QAIF_DMA_IDX3 },
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_tdm_dma_dai_map[] = {
> +	{ QAIF_TDM_AIF0, QAIF_DMA_IDX0 },
> +	{ QAIF_TDM_AIF1, QAIF_DMA_IDX1 },
> +	{ QAIF_TDM_AIF2, QAIF_DMA_IDX2 },
> +	{ QAIF_TDM_AIF3, QAIF_DMA_IDX3 },
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_cif_rx_dma_dai_map[] = {
> +	{ QAIF_CDC_DMA_RX0, QAIF_DMA_IDX0 },
> +	{ QAIF_CDC_DMA_RX1, QAIF_DMA_IDX1 },
> +};
> +
> +static const struct qaif_dmaidx_dai_map shikra_cif_va_dma_dai_map[] = {
> +	{ QAIF_CDC_DMA_VA_TX0, QAIF_DMA_IDX0 },
> +	{ QAIF_CDC_DMA_VA_TX1, QAIF_DMA_IDX1 },
> +};
> +
> +static struct snd_soc_dai_driver shikra_qaif_cpu_dai_driver[] = {
> +	{
> +		.id = QAIF_MI2S_AIF0,
> +		.name = "MI2S AIF Zero",
> +		.playback = {
> +			.stream_name = "MI2S AIF Zero Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.capture = {
> +			.stream_name = "MI2S AIF Zero Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_MI2S_AIF1,
> +		.name = "MI2S AIF One",
> +		.playback = {
> +			.stream_name = "MI2S AIF One Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.capture = {
> +			.stream_name = "MI2S AIF One Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_MI2S_AIF2,
> +		.name = "MI2S AIF Two",
> +		.playback = {
> +			.stream_name = "MI2S AIF Two Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.capture = {
> +			.stream_name = "MI2S AIF Two Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_MI2S_AIF3,
> +		.name = "MI2S AIF Three",
> +		.playback = {
> +			.stream_name = "MI2S AIF Three Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.capture = {
> +			.stream_name = "MI2S AIF Three Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_TDM_AIF0,
> +		.name = "TDM AIF Zero",
> +		.playback = {
> +			.stream_name = "TDM AIF Zero Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.capture = {
> +			.stream_name = "TDM AIF Zero Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_TDM_AIF1,
> +		.name = "TDM AIF One",
> +		.playback = {
> +			.stream_name = "TDM AIF One Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.capture = {
> +			.stream_name = "TDM AIF One Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_TDM_AIF2,
> +		.name = "TDM AIF Two",
> +		.playback = {
> +			.stream_name = "TDM AIF Two Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.capture = {
> +			.stream_name = "TDM AIF Two Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_TDM_AIF3,
> +		.name = "TDM AIF Three",
> +		.playback = {
> +			.stream_name = "TDM AIF Three Playback",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.capture = {
> +			.stream_name = "TDM AIF Three Capture",
> +			.formats	= SNDRV_PCM_FMTBIT_S16 |
> +					  SNDRV_PCM_FMTBIT_S24 |
> +					  SNDRV_PCM_FMTBIT_S32,
> +			.rates		= SNDRV_PCM_RATE_8000_192000,
> +			.channels_min	= 1,
> +			.channels_max	= 8,
> +		},
> +		.ops = &asoc_qcom_qaif_aif_cpu_dai_ops,
> +	}, {
> +		.id = QAIF_CDC_DMA_RX0,
> +		.name = "CDC DMA RX0",
> +		.playback = {
> +			.stream_name = "WCD Playback0",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = QAIF_CDC_DMA_RX1,
> +		.name = "CDC DMA RX1",
> +		.playback = {
> +			.stream_name = "WCD Playback1",

No dai for WCD capture (or) it's missing in this patch.


Best Regards,
Rafi.

> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 2,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = QAIF_CDC_DMA_VA_TX0,
> +		.name = "CDC DMA VA_TX0",
> +		.capture = {
> +			.stream_name = "DMIC Capture0",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 4,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	}, {
> +		.id = QAIF_CDC_DMA_VA_TX1,
> +		.name = "CDC DMA VA_TX1",
> +		.capture = {
> +			.stream_name = "DMIC Capture1",
> +			.formats = SNDRV_PCM_FMTBIT_S16,
> +			.rates = SNDRV_PCM_RATE_48000,
> +			.rate_min	= 48000,
> +			.rate_max	= 48000,
> +			.channels_min	= 1,
> +			.channels_max	= 4,
> +		},
> +		.ops	= &asoc_qcom_qaif_cif_dai_ops,
> +	},
> +};
> +
> +static int shikra_qaif_get_dma_idx(unsigned int dai_id)
> +{
> +	const struct qaif_dmaidx_dai_map *map;
> +	int i, size;
> +
> +	switch (dai_id) {
> +	case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
> +		map = shikra_mi2s_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_mi2s_dma_dai_map);
> +		break;
> +	case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
> +		map = shikra_tdm_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_tdm_dma_dai_map);
> +		break;
> +	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> +		map = shikra_cif_rx_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_cif_rx_dma_dai_map);
> +		break;
> +	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> +		map = shikra_cif_va_dma_dai_map;
> +		size = ARRAY_SIZE(shikra_cif_va_dma_dai_map);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < size; i++) {
> +		if (map[i].dai_id == dai_id)
> +			return map[i].dma_idx;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int shikra_qaif_alloc_stream_dma_idx(struct qaif_drv_data *drvdata,
> +					    int direction,
> +					    unsigned int dai_id)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	int dma_idx, index;
> +
> +	dma_idx = shikra_qaif_get_dma_idx(dai_id);
> +	if (dma_idx < 0)
> +		return dma_idx;
> +
> +	switch (dai_id) {
> +	case QAIF_MI2S_AIF0 ... QAIF_MI2S_AIF12:
> +	case QAIF_TDM_AIF0 ... QAIF_TDM_AIF12:
> +		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
> +			dma_idx : v->wrdma_start + dma_idx;
> +		if (index >= QAIF_MAX_AIF_DMA_IDX)
> +			return -EINVAL;
> +		if (test_and_set_bit(index, &drvdata->aif_dma_idx_bit_map))
> +			return -EBUSY;
> +		break;
> +	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> +	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> +		index = (direction == SNDRV_PCM_STREAM_PLAYBACK) ?
> +			dma_idx : v->codec_wrdma_start + dma_idx;
> +		if (index >= QAIF_MAX_CIF_DMA_IDX)
> +			return -EINVAL;
> +		if (test_and_set_bit(index, &drvdata->cif_dma_idx_bit_map))
> +			return -EBUSY;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return index;
> +}
> +
> +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
> +					   int index,
> +					   unsigned int dai_id)
> +{
> +	if (qaif_is_aif_port(dai_id))
> +		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> +	else
> +		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> +	return 0;
> +}
> +
> +static const struct qaif_variant shikra_qaif_data = {
> +	.ee = 0,
> +
> +	.num_rddma = 4,
> +	.num_wrdma = 4,
> +	.wrdma_start = 4,
> +
> +	.num_codec_rddma = 4,
> +	.num_codec_wrdma = 4,
> +	.codec_wrdma_start = 4,
> +	.num_intf = 4,
> +
> +	.rddma_reg_base = 0x8000,
> +	.rddma_stride = 0x1000,
> +	.codec_rddma_reg_base = 0xc000,
> +	.codec_rddma_stride = 0x1000,
> +
> +	.wrdma_reg_base = 0x11000,
> +	.wrdma_stride = 0x1000,
> +	.codec_wrdma_reg_base = 0x15000,
> +	.codec_wrdma_stride = 0x1000,
> +
> +	.rddma_irq_reg_base = 0x19000,
> +	.rddma_irq_stride = 0x1000,
> +	.codec_rddma_irq_reg_base = 0x191A0,
> +	.codec_rddma_irq_stride = 0x1000,
> +
> +	.wrdma_irq_reg_base = 0x19078,
> +	.wrdma_irq_stride = 0x1000,
> +	.codec_wrdma_irq_reg_base = 0x19290,
> +	.codec_wrdma_irq_stride = 0x1000,
> +
> +	.qxm_type = QAIF_QXM0,
> +	.rd_len = 512,
> +	.rddma_shram_len = 64,
> +	.rddma_shram_start_addr = {0, 256},
> +	.wr_len = 512,
> +	.wrdma_shram_len = 64,
> +	.wrdma_shram_start_addr = {0, 256},
> +
> +	.clk_name		= (const char * const []) {
> +					"lpass_config",
> +					"lpass_core_axim",
> +					"bus",
> +				},
> +	.num_clks		= 3,
> +
> +	.dai_driver		= shikra_qaif_cpu_dai_driver,
> +	.num_dai		= ARRAY_SIZE(shikra_qaif_cpu_dai_driver),
> +
> +	.dai_bit_clk_names	= (const char * const []) {
> +					"aif_if0_ibit",
> +					"aif_if1_ibit",
> +					"aif_if2_ibit",
> +					"aif_if3_ibit",
> +				},
> +	.aif_full_cycle_en	= (const bool []) { false, false, false, false },
> +	.aif_ctrl_data_oe	= (const bool []) { false, false, false, false },
> +	.aif_loopback_en	= (const bool []) { false, false, false, false },
> +	.alloc_stream_dma_idx	= shikra_qaif_alloc_stream_dma_idx,
> +	.free_stream_dma_idx	= shikra_qaif_free_stream_dma_idx,
> +	.get_dma_idx		= shikra_qaif_get_dma_idx,
> +};
> +
> +static const struct of_device_id shikra_qaif_cpu_device_id[] = {
> +	{ .compatible = "qcom,shikra-qaif-cpu", .data = &shikra_qaif_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, shikra_qaif_cpu_device_id);
> +
> +static struct platform_driver shikra_qaif_cpu_platform_driver = {
> +	.driver = {
> +		.name = "shikra-qaif-cpu",
> +		.of_match_table = shikra_qaif_cpu_device_id,
> +		.pm = pm_ptr(&asoc_qcom_qaif_pm_ops),
> +	},
> +	.probe = asoc_qcom_qaif_cpu_platform_probe,
> +};
> +module_platform_driver(shikra_qaif_cpu_platform_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm Audio Interface (QAIF) Shikra variant driver");
> +MODULE_AUTHOR("Harendra Gautam <harendra.gautam@oss.qualcomm.com>");
> +MODULE_LICENSE("GPL");

