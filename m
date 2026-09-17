Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F0B4C10E4
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661307; cv=none; b=E4L6N4NhtlwbdbvUqMlNrXkv9cRhxJxdtVTlfuRq4RRoeRG6kAotJj/YCLlcJ4/dNcpEpkl8oKg+TEVI8PHkNKxUXaXS/LpRXInRXG0j9gk1rfMS+dySmsXopQsS5Sl0SFhDrPxFnoa06ghE0L2lPdgnC6CsufaT2uIMwa3frrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661307; c=relaxed/simple;
	bh=JC7H+pm58E1n6/Bw2bKd0g05pNgc7ySxorvePFWsxGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3y+A7AQc3038TjplMKgdtcwinw7B2CgBMkdNjpB4kXBMwEBxP7clh+7AtMxdL6iKoacSqkAuQHQvaa43JffWO7smFoVsIpR1Yyp/MqHOJbghD3b3r9QafW8xs7FpFuyb3wN+OPgC+C8hTUEZIGunuLQdYQAgn0DiODDluxWRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwMISGum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cIiyibc8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwMISGum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cIiyibc8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDioNc1137781
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=; b=PwMISGumlDQw7ola
	XatjSPFVjAFjgAnxCCRdSt0X/+CBgsmAzIpKQ+EJejBJIC+7zdQDlkGMR7Pt3sxn
	nfhlztJSxKjgOlcm0SLduaUZO9d3ZE/4qibCJISJruOY4MPqq1XQJDddfC7YxCGn
	c6kLBaCg1rVGUudqE1OfE/X/k4Rq1/Nyhbnumt6PJVOdWONV24e4e42GAYOsUJsw
	UcXFwe2WMST0lVIno6xN5od651yVP0esrujxqrvjzSz3asQ6krSmYvJ0XJzqEm+R
	mWUb1WYa1dp3Cf0666LGl6jTwb7zOuby7DVWbiMhhH6vGFdv7M93WzAXxr542DZi
	m4uHyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw3332-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 16:08:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9393ac4961fso124203885a.2
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789661303; x=1790266103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=;
        b=cIiyibc8EaOHmGYF4c+iqvu9AFwEJjPmg6q6xK0seu5tBACBw31lo13derFaF/Enm1
         wmhu4wWzzcBAWiA6/HcRa9XyO9noF7IpfNp9R06Da3O7FlececenY4ay+QXn5SVxDET0
         792pJjD8LykSvkpgBa7Em/G96uTN0wv33oM46FhPXnFTCkHg7LY1R5cAM6BmnIy35VKw
         LR+VsmahM7BBq9MSDZ1OqhDbNUarbXLfHD9APs7tEUtTFe3+YL9tmbpjD7ncfCTIY7ue
         6HQqVpy3xShkSRNOA6fO8UxjSAL714g5v5Pc/SQoxwVG7sJo69kC04clhkfyaVXOvh/L
         0q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789661303; x=1790266103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=de63mvokSx0mtHbiaRS5gUbMbE5xdFNiC2Y2uI3lIvQ=;
        b=lg1T8fSs8EoI18PwioXPINMt7M7iRWbHeQ65o393apqMG64rcXf1pgg+7867tek1mi
         IiNW/HH+jdluoHGJaOQExD0b+puvtOOTFI1OxNgP9IiqDJHFO0WhVBtnxbGFtzCCPc1z
         rWzFUTZShXpFOTB/nxeKtdG3hMEohRQEbpe/Pn/T90oftHk20ACZUGL1VvZWmiudIaZn
         FbfXX1DNqTqeUHKUipjJJAB3RkQ7U86VaFy1S1z2M8l71+sCv5QW6RCfN4X/v6k4tq6f
         C3XDOHf9J6munxQWuajJuv3sTLYxgE+OzMFuTRNX8noNe5XmESrUqSGKLrghFZz7E7xN
         1DwA==
X-Forwarded-Encrypted: i=1; AKwUvBzrW0XgjlpqctyCHVyEAll2jzxI72ZIIl+Y+9mAnCOTwj51F/S8Q4TUprwcGfUhM/0qnco1cjOM03gH@vger.kernel.org
X-Gm-Message-State: AFuF++luKyWiUVAVFN0YjwEU2IPIwShkFwNqwSeGt4qbQ1xXdm7cJce0
	n57aztaJ2qbCeNETcFoP99LmymsbJpX4EkTGQkSZCAgNr8ycHJSkDlBg1pbgmrvbQGykDJ+F+ms
	+LNaOGNUlTUgeJAHMmiYkE3TP7S7GZieOTNF3pwqRLtKOZHpieFPyPGVOc1NGCL6T
X-Gm-Gg: AYBFou24zyi9YUTUnwmcESPidh8RFpbMjtpuPalXzKO4U4HqM7fV29u4b0IIPo4FWdX
	XTfpQeUkMDeRUgbBlvFWYjX9xvBgbVX4mvR5Kyd5AdHPOjxnal2hhDBYek/saTNsiuFqAlnKMbu
	ovX4kxj3Ym1shlOAzKamG9MBgfNUSto7OcHcS9g93dUa4gxcbDizSPzb8gjTaOMVkIiLYsgJAz8
	wnZRUnGjyXNMq0GL2Tl1yGM6Of1gB2cmGDsk0H/jEevLUnVz36oVA5tsV+6nQMpjdWuFZr9WfbI
	vZP32C12VIV5kM/iEvxFm+Svwlt8SMUSsCEBmUX193zPMJKb+78uOxOv9UiZQymP5NgtousyA1t
	fb89Pjm7oVIVAkYpgMQpMC7QP/YA=
X-Received: by 2002:a05:620a:2a08:b0:939:ff11:5328 with SMTP id af79cd13be357-93bb791aa13mr1214288485a.24.1789661302501;
        Thu, 17 Sep 2026 09:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:939:ff11:5328 with SMTP id af79cd13be357-93bb791aa13mr1214277985a.24.1789661301792;
        Thu, 17 Sep 2026 09:08:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf2797csm15865882f8f.16.2026.09.17.09.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 09:08:21 -0700 (PDT)
Message-ID: <a9ad0ebd-2b6f-45fe-9ea9-c24ad7a30bae@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:08:20 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oldhOEVOYdmDp2t6X547Do9t9zTA3CGW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyOCBTYWx0ZWRfX4IS6Ua7gM0hW
 MqDdSI+ex4zNYniysWuVS9bYzpv3p5O2VMFedbscUOgoku6UplIevAVXbjeWyeFxBPAPe0Tn8tt
 8FXXZzrdCT+DhovqtJoS/Tgtm4fM4cxQAIxs9OZFUlBR49vJWJN9zLqem/jslJg5jJqWi4Issan
 c0wAfMflsZQmmwo85qe7Y9ygJ7E9RrUK71wzT+zEWEQQyBng2O7Bl2ju/szDaGXKnGFi2JV1V2z
 OywZC4fhjIm+iOg7mdkaHTGGwTqeBSuH7DUkvEzWaLGAtqwwCrm0N/XiblNbK2oa1hQYDJ5orbE
 EX8dKdmtCyI49ZIGwMAwJapuG44OmsV/6BaFsFKoBLSgYEX+iJO3LrEknOg1a9nExZ+I4qGaSv6
 dfZ9Rw9WrdK0Abe+Nhu7Za7Yw+UGKDJZKdMH76ThPp+mie8AmHs3rDKXJkvqyeMGi+/amsQTQBm
 f1qsM2v76bkHK47RgPg==
X-Proofpoint-GUID: oldhOEVOYdmDp2t6X547Do9t9zTA3CGW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyOCBTYWx0ZWRfX9/vX9lkwmyyw
 zXZADtGmH/cI27YGFuUkcEOaA4DDcPvx6Z+geEidXyGKB09yrsitoxzEkTDS4p0220QIIkKIm1J
 3VKkqsjX2jiLl8b7sHPl0KDX/hV5nOE=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac1077 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Kn2qpGTL2itX_U7O_l0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170228

On 9/17/26 2:57 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Attach the DT vote clocks to runtime PM and resume the device before
> programming the rate generator registers, so register accesses happen
> only after the LPASS votes are active.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>

Lgtm,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

> ---
>  drivers/clk/qcom/Kconfig        |  14 ++++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/lpass-va-csr.c | 140 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 155 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e2..32172f2dfe3c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2116,6 +2116,20 @@ config CLK_GFM_LPASS_SM8250
>  	  Support for the Glitch Free Mux (GFM) Low power audio
>            subsystem (LPASS) clocks found on SM8250 SoCs.
>  
> +config QCOM_CLK_LPASS_HEARTBEAT_PULSE
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	depends on COMMON_CLK
> +	depends on ARM64 || COMPILE_TEST
> +	select REGMAP_MMIO
> +	default m if ARCH_QCOM
> +	help
> +	  Qualcomm LPASS VA CSR block contains the rate generator hardware
> +	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
> +	  This driver models the rate generator as a clock provider so
> +	  that consumers can enable or disable it via the common clock
> +	  framework, and it can be used to synchronize the start of DMAs
> +	  and Codec Interfaces or as a periodic wakeup source for the DSP.
> +
>  config SM_VIDEOCC_8450
>  	tristate "SM8450 Video Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index a6c676f68b79..66c8501c21a3 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CLK_ELIZA_GPUCC) += gpucc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_TCSRCC) += tcsrcc-eliza.o
>  obj-$(CONFIG_CLK_ELIZA_VIDEOCC) += videocc-eliza.o
>  obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
> +obj-$(CONFIG_QCOM_CLK_LPASS_HEARTBEAT_PULSE) += lpass-va-csr.o
>  obj-$(CONFIG_CLK_GLYMUR_CAMCC) += camcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_DISPCC) += dispcc-glymur.o
>  obj-$(CONFIG_CLK_GLYMUR_EVACC) += evacc-glymur.o
> diff --git a/drivers/clk/qcom/lpass-va-csr.c b/drivers/clk/qcom/lpass-va-csr.c
> new file mode 100644
> index 000000000000..3c87c3319f15
> --- /dev/null
> +++ b/drivers/clk/qcom/lpass-va-csr.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>
> +#include <linux/pm_clock.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-branch.h"
> +#include "clk-regmap.h"
> +
> +#define LPASS_RATE_GEN_CTRL		0xd000
> +#define LPASS_RATE_GEN_COUNTER_0	0xd004
> +#define LPASS_RATE_GEN_DELAY		0xd010
> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct clk_regmap hb;
> +};
> +
> +static int lpass_va_csr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct lpass_va_csr_data *data = of_device_get_match_data(dev);
> +	struct lpass_va_csr *csr;
> +	struct clk_init_data init = {
> +		.name = "lpass_heartbeat_pulse",
> +		.ops = &clk_branch_simple_ops,
> +	};
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int ret;
> +
> +	csr = devm_kzalloc(dev, sizeof(*csr), GFP_KERNEL);
> +	if (!csr)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	regmap = devm_regmap_init_mmio(dev, base,
> +				       &lpass_rate_gen_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to init regmap\n");
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable PM runtime\n");
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to get vote clocks\n");
> +
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(regmap, LPASS_RATE_GEN_COUNTER_0, data->counter_0);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	ret = regmap_write(regmap, LPASS_RATE_GEN_DELAY, data->delay);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	csr->hb.regmap = regmap;
> +	csr->hb.enable_reg = LPASS_RATE_GEN_CTRL;
> +	csr->hb.enable_mask = LPASS_RG_CTRL_EN;
> +	csr->hb.hw.init = &init;
> +
> +	ret = devm_clk_register_regmap(dev, &csr->hb);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb.hw);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id lpass_va_csr_dt_match[] = {
> +	{ .compatible = "qcom,hawi-lpass-va-csr", .data = &hawi_csr_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lpass_va_csr_dt_match);
> +
> +static struct platform_driver lpass_va_csr_driver = {
> +	.driver = {
> +		.name = "qcom-lpass-va-csr",
> +		.of_match_table = lpass_va_csr_dt_match,
> +	},
> +	.probe = lpass_va_csr_probe,
> +};
> +
> +module_platform_driver(lpass_va_csr_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LPASS VA CSR heartbeat pulse clock provider");
> +MODULE_LICENSE("GPL");
> 

