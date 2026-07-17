Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B4243F0AB
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262638; cv=none; b=DL0pUPX9NtXACwKzrRI9icHjkBZcj+7iJth737M6XRuKfW3MY884n2DRwktIm9YTj6NHChubtNZbcB8aWgtHdqPoJNP6ee6beAuXBY3rixhWjNHFeXUopjbvrqdjLV+inxa8BMGn3T0G1RJNSbcFXq3LZGaigCKgHbRzLa3G32Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262638; c=relaxed/simple;
	bh=bRhRJoDbvRIpvR8Zp3ea3t7M5m0hot77h+R8kxfek+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SBXSI17tSBlpiA+zRIaRqjkPVF3QOw180UXVfcprtl/y5HKDAj8BAp3vQrVNNTAK2tsNFPfKtZASJpNeMw9BVkknAedot74yuYSIMCsAQl5ac1/Xwfe2juZKPtH7LsM/JHSTsANBzq+AVNm+/PicA8EQURTlq5uate/NW4zcA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYeHK2Df; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YAxFkXGA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYeHK2Df";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YAxFkXGA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33xCH595045
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqsvS+05HWX/nEg3DGCHQLhe/f2y6cE52lrve4O/gH4=; b=NYeHK2DfxWMGExa4
	WRe/ad3aNIdUc5WRK49/3c6gZg6epZ17TZXz4xGDFVZzcT1UmsFFHxNwRjX4+xUP
	XlpD2yZzVnlt8NfiTEGhUDjHIC/iIP/hJRVY+KeCJBKWWzkBghjF5mazpO31tbcx
	2ABBlJFFpti3bV4cBRuchcuwEuYhiVAYcwgEPpXYx6OVizHsE0tS1bjKpMn0eVcp
	syroR99Vtbsqf950ihWd0ed8nX5y0eL8zWEhKMcK57k9bm0d326EZM2GSK+eC/G+
	xlLWjT2gv88DwjiK4t0PBRsi91WWkEIYchOEUHinTezdvRCsTiAwXMb2Pxf3UQkl
	9JNkqQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1bbgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 04:30:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so9721467a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 21:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784262634; x=1784867434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqsvS+05HWX/nEg3DGCHQLhe/f2y6cE52lrve4O/gH4=;
        b=YAxFkXGAKWaGXqSHPL9UtUYyXTaBZcFRvwWBcN11Kl5TxjPQYfNvh2OFOyFQN9MkdF
         A6JR6TvmPd8A2MbQDz0pfcK9mtLc95xbHU8CnfF5it5gqIoaAn+wiKLe23yE0m79FIpl
         /RUI/NXb9iJqPMR1uC7EhUEcb4fCmf382XBQBLXLcnyw+7aycKMW+m97JeDV/eaqG+In
         rMJZzj11LyRIxgh584nbWZZGal+sIZYg0hsh/070aEHISyoQ7JFBLpWCLujh/kEdesd5
         cuuH8VMN0Ei4MR6s6hpMAy3OU8NqpeJc1nntsZnJ+TET8OpV8qAv6UB6iHmSE1fRwmxm
         fjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784262634; x=1784867434;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqsvS+05HWX/nEg3DGCHQLhe/f2y6cE52lrve4O/gH4=;
        b=AIMcdJ17h0vIbnT8ERq0OEhAnSVrccp9Vdy+XgWtOFj4xhDgMkjlJJk2FDabzDvhwl
         18vIfgAl2J+IaEaNiE2qSFNRVTHe3z2ENXL+HRGeSQ4ZlhJf1cQR+PFAZbZBFQMhGyqj
         DIoFigkxgXcSVVeepdBFyQ0x+5Wopg1AgKmJ/nVH1PzSISTsxIgZonpcz0a3TsOHd7ea
         J8XfWoL6QB01nN7N1xlF25BR7C88QX7OE33f5ypm0/qNFzNE6U+W3aKHZz/xgPtOF65x
         ovSQVkdkyYxOjNQBHwHF36mnpOmwGlTBjF6aaGDCuN/F5NfzH/LP7raVBjRRlqF2AUa/
         TPjA==
X-Forwarded-Encrypted: i=1; AHgh+Rqno12x7lSlDzAH1lNuPlMIBS/LzR3xKQIDdzXEkCWe8ZmJnaVrO4zJcn4uzmuXdJPjHt5yZOKv4nHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxCSKGFuOtk5480nuWqM5JBZsZc6Egk9ly9roJDSKqoYDHDzeeR
	7gvkpZTObM8xQlKb9erWJXCkpKO7Qaa9xbYTgWzv5yXhtoaNF9d11LZoQigi16KEGA0LO6JUVnw
	UhZjcpnXCfVg317O7SS/uqvdP8gq0AQUW1Fob02SJ0FxbU2RsSA430ntdfsiqkyjt
X-Gm-Gg: AfdE7cn9hrpJPoKAxveiAu8LaqtrGbutzVC2Mu0C+BqTFC0VUgpAkxjMWZN7yyXQYwe
	Nk196MbITPdIwjyexGWk6+7ZXTWqJxzBI/+sqVcOfHM4bOh+oxmmz95VnVA5WxDZJ4qPtzqCoq1
	0ZcbRoDbi6TZSk6aqjaSJM5Tp8vlLAea62B/SnTzT66fP9Y+0Yl4ZV5lwUakFoZpQFl0sh52XFO
	Xh6I93SY028vJfQoIEc6fIYPIPt7D5dSXPrVgEx1fSOzDGtza6E5nz4ypwaGcvLk9yZqEGqxhSE
	7uQ8//D2MRFzlH4Ras/RULp/TPM3c4syN6AVEkq9dLqD0JToiBVxQpFWu0crHlquhH8ohr6fdsu
	G8ihIpcBlbcAlfvF6Ga9YSPsBCe4MJ3PH
X-Received: by 2002:a05:6300:2289:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c3ad9e4365mr1032484637.66.1784262634073;
        Thu, 16 Jul 2026 21:30:34 -0700 (PDT)
X-Received: by 2002:a05:6300:2289:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c3ad9e4365mr1032433637.66.1784262633343;
        Thu, 16 Jul 2026 21:30:33 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm956176c88.9.2026.07.16.21.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:30:32 -0700 (PDT)
Message-ID: <b9285a2b-af62-2df1-9a09-84ff11e59fde@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:00:26 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 11/18] media: iris: Add framework support for AR50_LITE
 video core
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-11-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59afeb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hfOqj8d2bOtOs8zcLwsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfX0OBdRoeriMYF
 fJTOHGIBa6uJjovEc90JAQWZPMqKzzn7tk3k7n5xc9VR4pOvqQKRzGb8n8UKm+zjv5oQUfEZUtC
 X1nJbStDTJ33UGCdRhPH8ekt8bA/7/V7xsmQyuQDCcm6Vp945B7/1uhSgpKsrXkftZfiKt6qe2i
 IVvrJWlo6izKYGi2xBpe68yeTLVqGTfGIa7r+8p+uVKv7qESbdussZpWIVL4Xu2JXkg8d5wkpwC
 ZJ6rS9+KXhvEROgJ732K7j0k6H3CsBj+5puwMugH91wTFuxhgF0Ga2nkISQv1pWZezLCQ13oZNI
 zcX5zIPK9LJzt9G0COTxF/ZHTrgspFLM0wqmjUIVIeLERqGZUu1kmMVw4gPDGnQTAe/grHf8Je7
 G4J7/7nSu/aXdeG+IblDkGHeNk5HEQS+YFuZWr3+3DXiQihr3Q56SejgHU7ZvBZ/6nKYBtxqINX
 T6M+JxoPCgaUqLE/26Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfX1nb4JC/dtHcC
 a/wZC1/yvZmpt95XjIz0JcenkCWN0ClkT0r+caQRo3X7FXQqZfncCdQwJyJsNFjCSOddb4bYQdX
 wtH5sKXivZIHORmB3YnHRcBIM+ow20A=
X-Proofpoint-GUID: N9l9CEpTkjFaXBdJ4MohLwk92xHXwJfw
X-Proofpoint-ORIG-GUID: N9l9CEpTkjFaXBdJ4MohLwk92xHXwJfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170040


On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> Add power sequence for ar5lt core.
> Add register handling for ar50lt by hooking up vpu op with ar50lt
> specific implemtation or resue from earlier generation wherever
> feasible.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |   1 +
>  .../platform/qcom/iris/iris_platform_common.h      |   2 +
>  drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
>  drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
>  6 files changed, 164 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 48e415cbc439..f1b204b95694 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_vpu2.o \
>               iris_vpu3x.o \
>               iris_vpu4x.o \
> +             iris_vpu_ar50lt.o \
>               iris_vpu_buffer.o \
>               iris_vpu_common.o \
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index accc1627defd..6a189489369f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -74,6 +74,7 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_THROTTLE_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -315,6 +316,7 @@ struct iris_platform_data {
>  	u32 tz_cp_config_data_size;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
> +	bool no_rpmh;
>  	u32 wd_intr_mask;
>  	u32 icc_ib_multiplier;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index dd2eeae0d9eb..5419a5096b00 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -12,38 +12,12 @@
>  
>  #include "iris_vpu_register_defines.h"
>  
> -static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
> -{
> -	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> -	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 mbs_per_second, mbpf, height, width;
> -	unsigned long vpp_freq, vsp_freq;
> -	u32 fps = inst->frame_rate;
> -
> -	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> -	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> -
> -	mbpf = NUM_MBS_PER_FRAME(height, width);
> -	mbs_per_second = mbpf * fps;
> -
> -	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
> -
> -	/* 21 / 20 is overhead factor */
> -	vpp_freq += vpp_freq / 20;
> -	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
> -
> -	/* 10 / 7 is overhead factor */
> -	vsp_freq += ((fps * data_size * 8) * 10) / 7;
> -
> -	return max(vpp_freq, vsp_freq);
> -}
> -
>  const struct vpu_ops iris_vpu2_ops = {
>  	.power_off_hw = iris_vpu_power_off_hw,
>  	.power_on_hw = iris_vpu_power_on_hw,
>  	.power_off_controller = iris_vpu_power_off_controller,
>  	.power_on_controller = iris_vpu_power_on_controller,
> -	.calc_freq = iris_vpu2_calc_freq,
> +	.calc_freq = iris_vpu2_calculate_frequency,
>  	.set_hwmode = iris_vpu_set_hwmode,
>  	.set_preset_registers = iris_vpu_set_preset_registers,
>  	.interrupt_init = iris_vpu_interrupt_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..e084a5b49f2e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/iopoll.h>
> +#include <linux/reset.h>
> +
> +#include "iris_instance.h"
> +#include "iris_vpu_common.h"
> +
> +#include "iris_vpu_register_defines.h"
> +
> +#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
> +
> +#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
> +
> +#define CPU_CS_VCICMD					0xa0020
> +#define CPU_CS_VCICMD_ARP_OFF			0x1
> +
> +static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
> +{
> +	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
> +}
> +
> +static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
> +{
> +	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
> +}
> +
> +static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
> +{
> +	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
> +}
> +
> +static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
> +{
> +	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return 0;
> +}
> +
> +static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
> +{
> +	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
> +	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +}
> +
> +static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_ctrl_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
> +	if (ret)
> +		goto err_disable_axi_clock;
> +
> +	return 0;
> +
> +err_disable_axi_clock:
> +	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
> +err_disable_ctrl_clock:
> +	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +	if (ret)
> +		return ret;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
> +	if (ret)
> +		goto err_disable_power;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
> +	if (ret)
> +		goto err_disable_hw_clock;
> +
> +	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
> +	if (ret)
> +		goto err_disable_hw_ahb_clock;
> +
> +	return 0;
> +
> +err_disable_hw_ahb_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
> +err_disable_hw_clock:
> +	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
> +err_disable_power:
> +	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
> +
> +	return ret;
> +}
> +
> +const struct vpu_ops iris_vpu_ar50lt_ops = {
> +	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
> +	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
> +	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
> +	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
> +	.calc_freq = iris_vpu2_calculate_frequency,
> +	.set_hwmode = iris_vpu_set_hwmode,
> +	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
> +	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
> +	.disable_arp = iris_vpu_ar50lt_disable_arp,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 41498f94480e..d64e7745a63d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
>  	}
>  
>  	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
> -	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
> +	if (!core->iris_platform_data->no_rpmh)
> +		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
>  
>  	return 0;
>  }
> @@ -422,6 +423,32 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
>  	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
>  }
>  
> +u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct v4l2_format *inp_f = inst->fmt_src;
> +	u32 mbs_per_second, mbpf, height, width;
> +	unsigned long vpp_freq, vsp_freq;
> +	u32 fps = inst->frame_rate;
> +
> +	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
> +	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
> +
> +	mbpf = NUM_MBS_PER_FRAME(height, width);
> +	mbs_per_second = mbpf * fps;
> +
> +	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
> +
> +	/* 21 / 20 is overhead factor */
> +	vpp_freq += vpp_freq / 20;
> +	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
> +
> +	/* 10 / 7 is overhead factor */
> +	vsp_freq += ((fps * data_size * 8) * 10) / 7;
> +
> +	return max(vpp_freq, vsp_freq);
> +}
> +
>  u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
>  {
>  	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 71d96921ed37..a62b6184bde7 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
>  extern const struct vpu_ops iris_vpu33_ops;
>  extern const struct vpu_ops iris_vpu35_ops;
>  extern const struct vpu_ops iris_vpu4x_ops;
> +extern const struct vpu_ops iris_vpu_ar50lt_ops;
>  
>  struct vpu_ops {
>  	void (*power_off_hw)(struct iris_core *core);
> @@ -40,6 +41,7 @@ int iris_vpu_power_on(struct iris_core *core);
>  int iris_vpu_power_off_controller(struct iris_core *core);
>  void iris_vpu_power_off_hw(struct iris_core *core);
>  void iris_vpu_power_off(struct iris_core *core);
> +u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size);
>  int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
>  int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
>  void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

