Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB532BEC5E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481298; cv=none; b=KollY0UrzF1cW9B6AkQuf+jb7jT3w4KgzknAzWlFj0FbHv4QWQaQt47WSap3iL3CtQlIplpCKPWt/6u+eUIRDFeyAFCjc4N6UfLmUdoYMVSgFQLU6lZzEZGNBXOgQK/jFMNLHtV8y0wU9KxOSUR6ER3V5ZzSXiywrToMia8b0+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481298; c=relaxed/simple;
	bh=rcW4M5v/jMxfIWNanbTmGmaMA1kZk3zTSWc+V4RtyFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r2dXnGmW1pUON7fOEBF+sipe7SaMr0PZGsQFNY23dk8aJHbvZWGjSX7hwMI0OdvwT0ZqNGdrBqDkT4F9zNDhOn97Nc1NOVAF5tJbRBH8CfFIQi6ZxJ+WCIRFC+i0VB0I1gLZRQcxkNOipfsCaipgBNJfV/KylFTeNgSf1hIupgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2/96vXI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QGPmZY/y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2/96vXI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QGPmZY/y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4G9eH017425
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=; b=B2/96vXIDEAkD0vT
	zMjmJgLYZeTPWU+ybjdDY3nv10APCFsCCw+sbiFErwhdK+/ZeimfbXlq0J3ko323
	JZ0e/wdZjsAroLkK6P34lcwmc3RBZZtsVuBrjOGrpN3N0DSdAxfiQHA3aMR4H8X2
	a1owqYQm40vy03SV2uioiMk5n4bvedXYjF2rIOm3ItIbuqs89vhom3ZOem/ZRVJW
	H/bbJaeYSLlpOfAKq9b7jWQ8faFBd6K0v1v5UC8r6F2DrweUoeoT3uJ4eh/78R2K
	yAyXWpERzKJnQGYzAnW6rGXmy7fPaASquR1EVkXul+Fl656RldhoS2dwxrGFfUDB
	Q5J5+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfrdtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:34:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3688be1cbcdso51928a91.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778481295; x=1779086095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=;
        b=QGPmZY/ynPUDu72d7zlYF+GYivIenONhshLvTQpXC8Grhne5ApkvB0sDo+Zm7yWHY6
         j4Ka+rtX2WzlBAVHc1C6/BDBNdx7DR1XOkBls/Y9mP5dEvDLqu7WSqc190atp6I1uGhy
         /DEOGA/CCTVTfXD3KCeR+XQnID3ETs24fzmNZkpk3gVHs7yYy593Cni9fn+KJ7P/AHIg
         3neWyw8MFbzu9ltbj404TDgZDZt8sqHl1H9MKYAHTFB44nsn5xwM7KYczbua1QPXAmPA
         KtF+qZI0XPLB/9omVZFSpPc1WhkB7YTZS5JUj9VgE1bOh6jpxjaIwzhtv47IkzO6oDcg
         yZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481295; x=1779086095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JR40/cuuQq5xGZuuu+KscHhHFJEl6gng4orwRde9dg=;
        b=qT3D12K3FdHrtcwxPGTux50jGX0tBrV+M/XIB4UMNqzJE7cIm19dzBhTEKNZgQO1/D
         lDdaH4baprg/0MpJgYqdTb0KBdhhJyyaR18zsU8DbO6snG5sxdd1xE8kiBR6Mqt7kSKU
         OmXGxQJ6/J3uihUDFLLk/n7GIwVFwPDmZcmJj1O3fWDjI1+DWuUqkAnZkFTr+uiue7+P
         4nWUxfhqIQkuokMaNokMDFAM8wlyUQaxWTBkKJ4+1NnFkUhbQboDPpU0mpPVwlYuRdc2
         phAIc1O7D9bGLCSzotpODevW+SXRPTlO3or1JzdR0VptbY7Fl8glugaazRr8d34MFqF4
         IaNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8AB3Tc47fr17vxqbFO+RxTEST+nnMoQ/dFz9JjkmlSyb4brqvhd9rnuj1J1S4RUeCqLvnP2CoHJ0o0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+LbNnUK8/e1PlftLEcnWp2uEBZXFYsWbwl4oUJ/mbwNZ0Bu9
	LtXvUYke9kVEwT8/JXyS9jiKXbXwsv1xLbkezeDsNhl+JfGgo910YCwcv31PVz3m8MPIIZfmOdb
	08SwsfxswHpfe5tvkyqBKWI3kyZDIanNRlvgNNqxwStmAyON4GxKg7CtJpMexPmyJ
X-Gm-Gg: Acq92OFQHu6t/XsImjyOwC8BzYSivyvVe/aRRuW8yn5EpmeubYY2gBFeojWnjQKc5tZ
	Tv26j3Cfrjo8mP2d4AM6Pcsx9SmvkLx4tog+s3/KbkehBmmfkR8QmeZ+S89UdJfrMQP2/QYY2q3
	6THZUjFuzZgnEFd3102Qvf6rXCyv1iOnAtZovUxwz2oAYaKYymfq6ZvDfX69j+XUAyJ/EDFZIge
	LC/pAVPf8lL4TzldTj+BhIGkhnk3GLEmLGwtU3Gtb88F23xESdCBjva2fIRadWwDrLGzURPFm6W
	sEZ8uwe5z1oTqJ0Y2eLhAngRkUoHx53NsHIcJgoDdK1RJKJuWkl45Rip0GtKuQi/okzA0cD6ZhH
	srXnuSwwoF/5FMN1QvIV0SjgCR8q87MHdaiEwoKMHQP7mtEVQtTMkRw==
X-Received: by 2002:a17:90b:2884:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-3664c8db9acmr14006580a91.3.1778481294806;
        Sun, 10 May 2026 23:34:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2884:b0:366:159a:c1ba with SMTP id 98e67ed59e1d1-3664c8db9acmr14006506a91.3.1778481294151;
        Sun, 10 May 2026 23:34:54 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ebe0e8sm97390245ad.76.2026.05.10.23.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 23:34:53 -0700 (PDT)
Message-ID: <c4e77fdb-e789-b739-f1dc-591be17673d3@oss.qualcomm.com>
Date: Mon, 11 May 2026 12:04:47 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 09/16] media: iris: Add framework support for AR50_LITE
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
References: <20260507-iris-ar50lt-v1-0-d22cccedc3e2@oss.qualcomm.com>
 <20260507-iris-ar50lt-v1-9-d22cccedc3e2@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260507-iris-ar50lt-v1-9-d22cccedc3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01788f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=USSJgBeZPGwVCPz7ayEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4xSw3pkQUuWkDBRd_75o4GQQnq5P1Pmv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA3MCBTYWx0ZWRfX03+ReGmT5vbD
 x3ZiZnxggNu1wq8f9U5bQvMBa7HwsEoCoMHDhH0bv90WBxbuUMYx8RYxjHR38DDkcyGsgBuNcP/
 BwaKT1ic+tErMpQUWiCd0MhJS4d0ffAscFxCKXbevJP44+eoEYYyU96t3AXhiLLVt6AKJUQFXB0
 vldHjPhWs6EwDHKgABVX5Ce6w0/Caq201mJSzQI6wsyZTy2NxtkP7xRRL4FUNaXloFwv6Qo7+PD
 ugIROMLQ0s47eVh3WL18CA8U8EascdL4Sak0N27MlQhby6CbTN1wfJcngdX6gsLqb2ONre39IRc
 8bwrm2v2Paa5N9TbbHkvmR7yrWgQ7d5lKnhxxJFkRuV4pIPGDQNkjyOjwYxMX79gGkAtNNLL5kq
 qWpnUF/wGD+bQwwfVWxtR9BfTgaTZdowCsLiqMu02/w/cdt+hE++CUaAw4L19aTifh07V5srvjm
 jBnJnOkyGrfC5Z1rWtw==
X-Proofpoint-ORIG-GUID: 4xSw3pkQUuWkDBRd_75o4GQQnq5P1Pmv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110070


On 5/7/2026 12:12 PM, Dmitry Baryshkov wrote:
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
>  drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 156 +++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_common.c |   3 +-
>  drivers/media/platform/qcom/iris/iris_vpu_common.h |   1 +
>  5 files changed, 162 insertions(+), 1 deletion(-)
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
> index e1dc226066c1..4a0895bf5720 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -63,6 +63,7 @@ enum platform_clk_type {
>  	IRIS_VPP0_HW_CLK,
>  	IRIS_VPP1_HW_CLK,
>  	IRIS_APV_HW_CLK,
> +	IRIS_THROTTLE_CLK,
>  };
>  
>  struct platform_clk_data {
> @@ -283,6 +284,7 @@ struct iris_platform_data {
>  	u32 tz_cp_config_data_size;
>  	u32 num_vpp_pipe;
>  	bool no_aon;
> +	bool no_rpmh;
>  	u32 wd_intr_mask;
>  	u32 icc_ib_multiplier;
>  	u32 max_session_count;
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> new file mode 100644
> index 000000000000..688b57291a81
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
> @@ -0,0 +1,156 @@
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
> +	if (ret && ret != -ENOENT)
> +		goto err_disable_hw_ahb_clock;
> +

Why the additional ret != -ENOENT check here? This function is hooked via
iris_vpu_ar50lt_ops and IRIS_THROTTLE_CLK is explicitly defined in the
qcm2290_data clock table, making it a mandatory clock for this platform.
Is there any other platform that uses this same vpu hook but does not have the
throttle clock?

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
> +static u64 iris_vpu_ar50lt_calc_freq(struct iris_inst *inst, size_t data_size)
> +{
> +	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
> +	struct v4l2_format *inp_f = inst->fmt_src;
> +	u32 mbs_per_second, mbpf, height, width;
> +	unsigned long vpp_freq, vsp_freq;
> +	u32 fps = DEFAULT_FPS;
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
> +const struct vpu_ops iris_vpu_ar50lt_ops = {
> +	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
> +	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
> +	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
> +	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
> +	.calc_freq = iris_vpu_ar50lt_calc_freq,
> +	.set_hwmode = iris_vpu_set_hwmode,
> +	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
> +	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
> +	.disable_arp = iris_vpu_ar50lt_disable_arp,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index b8300195a43b..f3607c0ca847 100644
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
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 71d96921ed37..f00e2de5fa53 100644
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
>
