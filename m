Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC64491595
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944780; cv=none; b=D4vlLrL42WBXC4hwR6fC+5+6i9qwrmPxQXZnQaCPa3Lu/pEtucTYD2c6dShZ7bGxiQooaT78MZvJwTDs8o/0J/nPXyYK9T6H4AlR+cYyoGSKpEEltuZdVY/rGKtkL3U0OzeUU2zeYAF13NXVxUFhPMq8riiR/3hmDqLtPdHAeEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944780; c=relaxed/simple;
	bh=Eyr5OqRjprNlL76K5w1bPL8pRmKgTjZ85wV1wXgFVCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ/g9PLNUPNhqeAQC2QOFxSdIEU99hwaATKqx/3Ch7mRNrOy9a4A5szqEv1xyEJY143i0Yb9XV/fV9d5zRed2pDLY8qNbUob2iSTskt26mypye/MLZoFaAOiCIwSvl5i2EKP0IZ3B5Anfx5eo3e5mJl+66I6aY0qixPxUt/5Q28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSbJ5lfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V59pI6Ox; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSbJ5lfV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V59pI6Ox"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896WFIQ964976
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 09:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lW40KngNn6O0mLiyMZI/6xt1ruUd0a8URqI66rTSlAg=; b=TSbJ5lfVLwBJhUFp
	5ezcHn7DuTZC/9cw4uvhcSZBvnHjPKEhKKih+94qv6S5yrKSi5pX2/Zlr7hUewqR
	KqlYcE6ZyVqcdf35OaK6++cCWecapGcFfC1WSK1fa+UHyvy6wQws2GcKQlF8xSGc
	dmaIONj4870qOYU2GWQBCoIt1VRhylRr2bcgUWnqHXTQxRBu2AUMZ2ThQU3nuJQK
	8/XJpQ2eJTHd/UH9E21gN4vcB16nV5y+r3bMI87OvXJz29OaBAtW/Xi6TypdoMVD
	7Q1Sq5HAnX+X2Wv8C0pZ+zsz8lpSbd0DT17tP5qs7XgeDb1rqeM7+MRgLRQ/xxvN
	dFM2xg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha37q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 09:06:10 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a49f09233dso3725217b6e.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944770; x=1789549570; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW40KngNn6O0mLiyMZI/6xt1ruUd0a8URqI66rTSlAg=;
        b=V59pI6Ox2E+rWrwpiN3VVAuvs9hXHaRtI8mtb/quESGU4Z3g7rCyBEDvTxC5Mveyrt
         0Rb4zDBv/8NDgnPWvnS/CCIdpvXejIzzb9AiksMu34pWpLL/wVuyvShvKsRROGfuR2Ko
         7r+KGdF8rHgATzZuJq970DitzrjV8yETBAAMC/m2Yv3Hgce9yZwvlGgbOQAhZO19HFWR
         d5saZpY++oPNNdA0re8w2unqAV5or0AvTE6baEL2q3T+8KBt59VpJGENEkkiEMKrRplj
         ZJOuO7NiYMh/W3R7itPdfV+rgOvsFBShELgrjkGIuPhcGIDj2uoBt+6w2dEbac/NN6uz
         WSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944770; x=1789549570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lW40KngNn6O0mLiyMZI/6xt1ruUd0a8URqI66rTSlAg=;
        b=etjcNzUjG1ThtiU+56Y+26icEAKM2IAA6gB3yVeviYHcEiRv8MjpjHRD+9z7shMPLe
         DC9rUKbtTLnUqwGLR5738P2QERkKJviAxYEzL056utW50uQk1Dy8LN+aFlaOf1wWzzFJ
         FxLGU/nj0D+CyBe59jMFy8udZMj4r6jiE/gD/aso9Qq5x2xpUNBfTeI1JFK4O79Ieeq0
         RS385kqI2VnQ8PKSmjj+oF9u345lf9AVHnZrG3wux+fhtiuiW+b951OBb3avyPO77NEd
         43UalMUf/VrkkgjB1buFTsx7aPYTSRjUit/I9M0OXC+eHMRJEU95ZqUeJYPPCfFZAHSZ
         LFGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn5JXWnmo5SuZ8aEVGEoyrKX/WP3UN7cp2EXD8HrccNvp8oulTolfiwuHI8idqu6YAat9YkE/wctCq@vger.kernel.org
X-Gm-Message-State: AFuF++lm9sm9awv2IM2K5JWccBmADTfYdsdam7008I/S43CYW+2ZMNa/
	OeYmLxdYwW4ViTBeuyi7TkenrPTNfRYjmujcg8jzVyNlwPlWRlPke+gc7zRQDbF4aIMaFU7c7Vt
	G/6PFqi/JsTfJDAPw4Lg2mAIB+NP6a8aK272CIxj4sIr189kN2oe2Q274rf4Tn2/I
X-Gm-Gg: AYBFou2GXynzHVhKprOlLUPKMiXz6fKwbpFoUrvIv+wfeZOjt9XIIdBKnz67qzeshZm
	CztVDm56uS3bo/hknv0FJVfLNJsttrn4BQ1J2iIwurcVUlS0BB2N9dH7ryJWcAd6+OyCna42VB3
	n4+ERrbVbQIX7CpNvdeFrKko/BqSS4iL0DtaIrSgwWGxvacSy5XPvmAUAf0u7iVH693HT/Ts83f
	YTOLP2DUMl/QiNoTsIl+xXZmW1VkzmmCbvhuI7y3jaGLzhua4s9zDt2nvPl8L0WHfM96DZQyUDS
	jABOiLj+ZTiHok1Qvx/9NL39ibQnIUOw7FXLLmXRNPdjxjGz7x6L8pjKmw8l6fhYJb/lFef0q1l
	yrAO91PBU5JBVzwnla3SbMO3Q74uJyEofFjD/yqV4KK4=
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr15556663eaf.60.1788944769659;
        Wed, 09 Sep 2026 02:06:09 -0700 (PDT)
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr15556623eaf.60.1788944769044;
        Wed, 09 Sep 2026 02:06:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm10719342c88.7.2026.09.09.02.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:06:07 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:06:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Message-ID: <aqEheWi6OaJtJfDu@QCOM-aGQu4IUr3Y>
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907-nords_dprx-v1-3-d472af3f01b1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX9KTJagu34GLW
 LL+eqhpXSrHLX5+SbbcLZeCWKxLXSNPogR/HEwHnYEihWMRlUDotJ3nTM6wowUa4/O82YqtAIfw
 auekGTyLHt2WZxL8kZQuyI+gUYvPCwfcX8FAxCprYUuCydb49qSUVwVYH1Y+IRuRvRq02pz276s
 7G9AWpS2XVDoVsOf45V8K3HoUXYJh1T9F8V3lJp64ktqinkiAUIQTYSwT35pZeH6FIjdXDyBW/A
 SsC1zLoKMyr24AWQ7dgJIsrADqzrfRAgkXdnYSmXGdUdaNa3sOEFNPu3UF3Cz/nF6ijZKnkDi2D
 MGnrWVX/GX55OXhTMvElliaQHoGVOP6gAviq90jc1bQUxB0R8wR7vc0SCFptL0b2k6T1rmxGdhL
 Vfe3K9EJVObIv/QPWcuPQk7R4CkLGYnH6cmBp0jj6xZJmx7acvZwDm/sD3WosrgvlRvZs3vKPIJ
 nHETlxvF6tsJfY7XAcg==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa12182 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XO64WZ8hu4nR4CtHWZEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: Hj1mB3BnqVxW3iw1bangrlgbcR2rh-or
X-Proofpoint-ORIG-GUID: Hj1mB3BnqVxW3iw1bangrlgbcR2rh-or
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXxN5OA4JhKak5
 gWeA4XA6CmPvDvUUFfWDhIrZJ/8POtaxbmSKVxnbzUy84XShbGhFVPXLdCqAWfbjbRmdYlTfxtf
 apqQsdjHbkOaeMCJQW2zRBk+Fi/NYn8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090101

On Mon, Sep 07, 2026 at 01:56:15PM +0530, Taniya Das wrote:
> Add support for the DisplayPort Receiver (DPRX) clock controllers on
> Nord devices. There are two identical DPRX clock controller
> instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
> audio, AHB and video memory paths, along with core PLLs.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig        |  11 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/dprxcc0-nord.c | 436 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/dprxcc1-nord.c | 436 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 884 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..07685cd1f65e20a4110fe301501bcad5060c7665 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -244,6 +244,17 @@ config CLK_NORD_DISPCC
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config CLK_NORD_DPRXCC
> +	tristate "Nord DPRX Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select CLK_NORD_GCC
> +	default m if ARCH_QCOM
> +	help
> +	  Support for the Display Port Receiver (DPRX) clock controller on
> +	  Nord devices. The DPRX clock controller provides clocks for the
> +	  DPRX core, audio, AHB and video memory paths.
> +	  Say Y if you want to support DPRX functionality.
> +
>  config CLK_NORD_CAMCC
>  	tristate "Nord Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index a6c676f68b79e4dc5928dc4cd7101c35e2e84787..69ce7c2c2e4dfe0924da8ae4979f2cae900ccc84 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -49,6 +49,7 @@ obj-$(CONFIG_CLK_KUNO_GCC) += gcc-kuno.o
>  obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
>  obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
>  obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
> +obj-$(CONFIG_CLK_NORD_DPRXCC) += dprxcc0-nord.o dprxcc1-nord.o
>  obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
>  obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
>  obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
> diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..85cfa8f3be26b16fb8e49c1745b69574b26e66aa
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc0-nord.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

This include can be dropped.

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,nord-dprxcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"

This include doesn't seem to be needed.

> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"

Ditto

> +#include "common.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_AHB_CLK,

The binding requires the DPRX CFG AHB clock in clocks.

      - description: DPRX CFG AHB clock from NWGCC

But nothing in the driver references index 1 — not in any parent_data,
not via devm_clk_get_enabled().

> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN,
> +	P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN,
> +	P_DPRX_0_DPRX_CC_PLL0_OUT_ODD,
> +	P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN,
> +	P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN,
> +	P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +static const struct pll_vco zonda_ole_vco[] = {
> +	{ 700000000, 3600000000, 0 },
> +};
> +
> +/* 550.0 MHz Configuration */
> +static const struct alpha_pll_config dprx_0_dprx_cc_pll0_config = {
> +	.l = 0x1c,
> +	.alpha = 0xa555,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00400005,
> +};
> +
> +static struct clk_alpha_pll dprx_0_dprx_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &dprx_0_dprx_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +/* 1080.0 MHz Configuration */
> +static const struct alpha_pll_config dprx_0_dprx_cc_pll1_config = {
> +	.l = 0x38,
> +	.alpha = 0x4000000,
> +	.config_ctl_val = 0x08240800,
> +	.config_ctl_hi_val = 0x05008001,
> +	.config_ctl_hi1_val = 0x00000000,
> +	.config_ctl_hi2_val = 0x00000000,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x02000080,
> +};
> +
> +static struct clk_alpha_pll dprx_0_dprx_cc_pll1 = {
> +	.offset = 0x1000,
> +	.alpha_width = 28,
> +	.config = &dprx_0_dprx_cc_pll1_config,
> +	.vco_table = zonda_ole_vco,
> +	.num_vco = ARRAY_SIZE(zonda_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_zonda_ole_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map dprx_cc_0_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN, 1 },
> +	{ P_DPRX_0_DPRX_CC_PLL0_OUT_ODD, 2 },
> +	{ P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 4 },
> +	{ P_SLEEP_CLK, 5 },
> +};
> +
> +static const struct clk_parent_data dprx_cc_0_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
> +	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
> +	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
> +	{ .index = DT_SLEEP_CLK },
> +};
> +
> +static const struct parent_map dprx_cc_0_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN, 3 },
> +	{ P_SLEEP_CLK, 5 },
> +	{ P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 6 },
> +};
> +
> +static const struct clk_parent_data dprx_cc_0_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
> +	{ .index = DT_SLEEP_CLK },
> +	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_dprx_0_dprx_cc_audio_clk_src[] = {
> +	F(216000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	F(300000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	F(360000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_0_dprx_cc_audio_clk_src = {
> +	.cmd_rcgr = 0x80c8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_0_parent_map_1,
> +	.freq_tbl = ftbl_dprx_0_dprx_cc_audio_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_audio_clk_src",
> +		.parent_data = dprx_cc_0_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg0_clk_src[] = {
> +	F(220000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_0_dprx_cc_core_rcg0_clk_src = {
> +	.cmd_rcgr = 0x8004,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_0_parent_map_0,
> +	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_core_rcg0_clk_src",
> +		.parent_data = dprx_cc_0_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg2_clk_src[] = {
> +	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_0_dprx_cc_core_rcg2_clk_src = {
> +	.cmd_rcgr = 0x8068,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_0_parent_map_0,
> +	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg2_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_core_rcg2_clk_src",
> +		.parent_data = dprx_cc_0_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg3_clk_src[] = {
> +	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_0_dprx_cc_core_rcg3_clk_src = {
> +	.cmd_rcgr = 0x8098,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_0_parent_map_0,
> +	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg3_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_core_rcg3_clk_src",
> +		.parent_data = dprx_cc_0_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div dprx_0_dprx_cc_core_ahb_div_clk_src = {
> +	.reg = 0x80b0,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_core_ahb_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&dprx_0_dprx_cc_core_rcg3_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div dprx_0_dprx_cc_core_aud_div_clk_src = {
> +	.reg = 0x80d0,
> +	.shift = 0,
> +	.width = 9,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_0_dprx_cc_core_aud_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&dprx_0_dprx_cc_audio_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch dprx_0_dprx_cc_ahb_clk = {
> +	.halt_reg = 0x80b4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80b4,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80b4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_0_dprx_cc_core_ahb_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_0_dprx_cc_aud_clk = {
> +	.halt_reg = 0x80d4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80d4,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80d4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_aud_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_0_dprx_cc_core_aud_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_0_dprx_cc_mdp_mem_clk = {
> +	.halt_reg = 0x8088,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8088,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8088,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_mdp_mem_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_0_dprx_cc_core_rcg2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_0_dprx_cc_mmcx_xo_clk = {
> +	.halt_reg = 0x80d8,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80d8,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80d8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_mmcx_xo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_0_dprx_cc_vid_mem_clk = {
> +	.halt_reg = 0x8028,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8028,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8028,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_0_dprx_cc_vid_mem_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_0_dprx_cc_core_rcg0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *dprx_cc_0_nord_clocks[] = {
> +	[DPRX_CC_AHB_CLK] = &dprx_0_dprx_cc_ahb_clk.clkr,
> +	[DPRX_CC_AUD_CLK] = &dprx_0_dprx_cc_aud_clk.clkr,
> +	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_0_dprx_cc_audio_clk_src.clkr,
> +	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_ahb_div_clk_src.clkr,
> +	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_aud_div_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_0_dprx_cc_core_rcg0_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_0_dprx_cc_core_rcg2_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_0_dprx_cc_core_rcg3_clk_src.clkr,
> +	[DPRX_CC_MDP_MEM_CLK] = &dprx_0_dprx_cc_mdp_mem_clk.clkr,
> +	[DPRX_CC_MMCX_XO_CLK] = &dprx_0_dprx_cc_mmcx_xo_clk.clkr,
> +	[DPRX_CC_PLL0] = &dprx_0_dprx_cc_pll0.clkr,
> +	[DPRX_CC_PLL1] = &dprx_0_dprx_cc_pll1.clkr,
> +	[DPRX_CC_VID_MEM_CLK] = &dprx_0_dprx_cc_vid_mem_clk.clkr,
> +};
> +
> +static const struct qcom_reset_map dprx_cc_0_nord_resets[] = {
> +	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
> +};
> +
> +static struct clk_alpha_pll *dprx_cc_0_nord_plls[] = {
> +	&dprx_0_dprx_cc_pll0,
> +	&dprx_0_dprx_cc_pll1,
> +};
> +
> +static const struct regmap_config dprx_cc_0_nord_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x8104,
> +	.fast_io = true,
> +};
> +
> +static void dprx_cc_0_nord_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
> +	 */
> +	regmap_write(regmap, dprx_0_dprx_cc_core_aud_div_clk_src.reg, 0x13);
> +	regmap_write(regmap, dprx_0_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);

Nit: can we use lowercase?

Shawn

> +}
> +
> +static const struct qcom_cc_driver_data dprx_cc_0_nord_driver_data = {
> +	.alpha_plls = dprx_cc_0_nord_plls,
> +	.num_alpha_plls = ARRAY_SIZE(dprx_cc_0_nord_plls),
> +	.clk_regs_configure = dprx_cc_0_nord_regs_configure,
> +};
> +
> +static const struct qcom_cc_desc dprx_cc_0_nord_desc = {
> +	.config = &dprx_cc_0_nord_regmap_config,
> +	.clks = dprx_cc_0_nord_clocks,
> +	.num_clks = ARRAY_SIZE(dprx_cc_0_nord_clocks),
> +	.resets = dprx_cc_0_nord_resets,
> +	.num_resets = ARRAY_SIZE(dprx_cc_0_nord_resets),
> +	.driver_data = &dprx_cc_0_nord_driver_data,
> +};
> +
> +static const struct of_device_id dprx_cc_0_nord_match_table[] = {
> +	{ .compatible = "qcom,nord-dprxcc0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dprx_cc_0_nord_match_table);
> +
> +static int dprx_cc_0_nord_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &dprx_cc_0_nord_desc);
> +}
> +
> +static struct platform_driver dprx_cc_0_nord_driver = {
> +	.probe = dprx_cc_0_nord_probe,
> +	.driver = {
> +		.name = "dprxcc0-nord",
> +		.of_match_table = dprx_cc_0_nord_match_table,
> +	},
> +};
> +
> +module_platform_driver(dprx_cc_0_nord_driver);
> +
> +MODULE_DESCRIPTION("QTI DPRXCC0 NORD Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-nord.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..573d66bb97c90dfc16d5d6ae2c4bbcfaff3aace9
> --- /dev/null
> +++ b/drivers/clk/qcom/dprxcc1-nord.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,nord-dprxcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_AHB_CLK,
> +	DT_SLEEP_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN,
> +	P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN,
> +	P_DPRX_1_DPRX_CC_PLL0_OUT_ODD,
> +	P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN,
> +	P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN,
> +	P_SLEEP_CLK,
> +};
> +
> +static const struct pll_vco lucid_ole_vco[] = {
> +	{ 249600000, 2300000000, 0 },
> +};
> +
> +static const struct pll_vco zonda_ole_vco[] = {
> +	{ 700000000, 3600000000, 0 },
> +};
> +
> +/* 550.0 MHz Configuration */
> +static const struct alpha_pll_config dprx_1_dprx_cc_pll0_config = {
> +	.l = 0x1c,
> +	.alpha = 0xa555,
> +	.config_ctl_val = 0x20485699,
> +	.config_ctl_hi_val = 0x00182261,
> +	.config_ctl_hi1_val = 0x82aa299c,
> +	.test_ctl_val = 0x00000000,
> +	.test_ctl_hi_val = 0x00000003,
> +	.test_ctl_hi1_val = 0x00009000,
> +	.test_ctl_hi2_val = 0x00000034,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x00400005,
> +};
> +
> +static struct clk_alpha_pll dprx_1_dprx_cc_pll0 = {
> +	.offset = 0x0,
> +	.config = &dprx_1_dprx_cc_pll0_config,
> +	.vco_table = lucid_ole_vco,
> +	.num_vco = ARRAY_SIZE(lucid_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_pll0",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_lucid_evo_ops,
> +		},
> +	},
> +};
> +
> +/* 1080.0 MHz Configuration */
> +static const struct alpha_pll_config dprx_1_dprx_cc_pll1_config = {
> +	.l = 0x38,
> +	.alpha = 0x4000000,
> +	.config_ctl_val = 0x08240800,
> +	.config_ctl_hi_val = 0x05008001,
> +	.config_ctl_hi1_val = 0x00000000,
> +	.config_ctl_hi2_val = 0x00000000,
> +	.user_ctl_val = 0x00000000,
> +	.user_ctl_hi_val = 0x02000080,
> +};
> +
> +static struct clk_alpha_pll dprx_1_dprx_cc_pll1 = {
> +	.offset = 0x1000,
> +	.alpha_width = 28,
> +	.config = &dprx_1_dprx_cc_pll1_config,
> +	.vco_table = zonda_ole_vco,
> +	.num_vco = ARRAY_SIZE(zonda_ole_vco),
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_pll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_zonda_ole_ops,
> +		},
> +	},
> +};
> +
> +static const struct parent_map dprx_cc_1_parent_map_0[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN, 1 },
> +	{ P_DPRX_1_DPRX_CC_PLL0_OUT_ODD, 2 },
> +	{ P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 4 },
> +	{ P_SLEEP_CLK, 5 },
> +};
> +
> +static const struct clk_parent_data dprx_cc_1_parent_data_0[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
> +	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
> +	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
> +	{ .index = DT_SLEEP_CLK },
> +};
> +
> +static const struct parent_map dprx_cc_1_parent_map_1[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN, 3 },
> +	{ P_SLEEP_CLK, 5 },
> +	{ P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 6 },
> +};
> +
> +static const struct clk_parent_data dprx_cc_1_parent_data_1[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
> +	{ .index = DT_SLEEP_CLK },
> +	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
> +};
> +
> +static const struct freq_tbl ftbl_dprx_1_dprx_cc_audio_clk_src[] = {
> +	F(216000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	F(300000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	F(360000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_1_dprx_cc_audio_clk_src = {
> +	.cmd_rcgr = 0x80c8,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_1_parent_map_1,
> +	.freq_tbl = ftbl_dprx_1_dprx_cc_audio_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_audio_clk_src",
> +		.parent_data = dprx_cc_1_parent_data_1,
> +		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_1),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg0_clk_src[] = {
> +	F(220000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_1_dprx_cc_core_rcg0_clk_src = {
> +	.cmd_rcgr = 0x8004,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_1_parent_map_0,
> +	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg0_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_core_rcg0_clk_src",
> +		.parent_data = dprx_cc_1_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg2_clk_src[] = {
> +	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_1_dprx_cc_core_rcg2_clk_src = {
> +	.cmd_rcgr = 0x8068,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_1_parent_map_0,
> +	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg2_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_core_rcg2_clk_src",
> +		.parent_data = dprx_cc_1_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg3_clk_src[] = {
> +	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_rcg2 dprx_1_dprx_cc_core_rcg3_clk_src = {
> +	.cmd_rcgr = 0x8098,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = dprx_cc_1_parent_map_0,
> +	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg3_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_core_rcg3_clk_src",
> +		.parent_data = dprx_cc_1_parent_data_0,
> +		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div dprx_1_dprx_cc_core_ahb_div_clk_src = {
> +	.reg = 0x80b0,
> +	.shift = 0,
> +	.width = 4,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_core_ahb_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&dprx_1_dprx_cc_core_rcg3_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_regmap_div dprx_1_dprx_cc_core_aud_div_clk_src = {
> +	.reg = 0x80d0,
> +	.shift = 0,
> +	.width = 9,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "dprx_1_dprx_cc_core_aud_div_clk_src",
> +		.parent_hws = (const struct clk_hw*[]) {
> +			&dprx_1_dprx_cc_audio_clk_src.clkr.hw,
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_regmap_div_ro_ops,
> +	},
> +};
> +
> +static struct clk_branch dprx_1_dprx_cc_ahb_clk = {
> +	.halt_reg = 0x80b4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80b4,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80b4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_1_dprx_cc_core_ahb_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_1_dprx_cc_aud_clk = {
> +	.halt_reg = 0x80d4,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80d4,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80d4,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_aud_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_1_dprx_cc_core_aud_div_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_1_dprx_cc_mdp_mem_clk = {
> +	.halt_reg = 0x8088,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8088,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8088,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_mdp_mem_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_1_dprx_cc_core_rcg2_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_1_dprx_cc_mmcx_xo_clk = {
> +	.halt_reg = 0x80d8,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x80d8,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x80d8,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_mmcx_xo_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch dprx_1_dprx_cc_vid_mem_clk = {
> +	.halt_reg = 0x8028,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x8028,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x8028,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "dprx_1_dprx_cc_vid_mem_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&dprx_1_dprx_cc_core_rcg0_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_regmap *dprx_cc_1_nord_clocks[] = {
> +	[DPRX_CC_AHB_CLK] = &dprx_1_dprx_cc_ahb_clk.clkr,
> +	[DPRX_CC_AUD_CLK] = &dprx_1_dprx_cc_aud_clk.clkr,
> +	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_1_dprx_cc_audio_clk_src.clkr,
> +	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_ahb_div_clk_src.clkr,
> +	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_aud_div_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_1_dprx_cc_core_rcg0_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_1_dprx_cc_core_rcg2_clk_src.clkr,
> +	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_1_dprx_cc_core_rcg3_clk_src.clkr,
> +	[DPRX_CC_MDP_MEM_CLK] = &dprx_1_dprx_cc_mdp_mem_clk.clkr,
> +	[DPRX_CC_MMCX_XO_CLK] = &dprx_1_dprx_cc_mmcx_xo_clk.clkr,
> +	[DPRX_CC_PLL0] = &dprx_1_dprx_cc_pll0.clkr,
> +	[DPRX_CC_PLL1] = &dprx_1_dprx_cc_pll1.clkr,
> +	[DPRX_CC_VID_MEM_CLK] = &dprx_1_dprx_cc_vid_mem_clk.clkr,
> +};
> +
> +static const struct qcom_reset_map dprx_cc_1_nord_resets[] = {
> +	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
> +};
> +
> +static struct clk_alpha_pll *dprx_cc_1_nord_plls[] = {
> +	&dprx_1_dprx_cc_pll0,
> +	&dprx_1_dprx_cc_pll1,
> +};
> +
> +static const struct regmap_config dprx_cc_1_nord_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = 0x8104,
> +	.fast_io = true,
> +};
> +
> +static void dprx_cc_1_nord_regs_configure(struct device *dev, struct regmap *regmap)
> +{
> +	/*
> +	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
> +	 */
> +	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
> +	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
> +}
> +
> +static const struct qcom_cc_driver_data dprx_cc_1_nord_driver_data = {
> +	.alpha_plls = dprx_cc_1_nord_plls,
> +	.num_alpha_plls = ARRAY_SIZE(dprx_cc_1_nord_plls),
> +	.clk_regs_configure = dprx_cc_1_nord_regs_configure,
> +};
> +
> +static const struct qcom_cc_desc dprx_cc_1_nord_desc = {
> +	.config = &dprx_cc_1_nord_regmap_config,
> +	.clks = dprx_cc_1_nord_clocks,
> +	.num_clks = ARRAY_SIZE(dprx_cc_1_nord_clocks),
> +	.resets = dprx_cc_1_nord_resets,
> +	.num_resets = ARRAY_SIZE(dprx_cc_1_nord_resets),
> +	.driver_data = &dprx_cc_1_nord_driver_data,
> +};
> +
> +static const struct of_device_id dprx_cc_1_nord_match_table[] = {
> +	{ .compatible = "qcom,nord-dprxcc1" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, dprx_cc_1_nord_match_table);
> +
> +static int dprx_cc_1_nord_probe(struct platform_device *pdev)
> +{
> +	return qcom_cc_probe(pdev, &dprx_cc_1_nord_desc);
> +}
> +
> +static struct platform_driver dprx_cc_1_nord_driver = {
> +	.probe = dprx_cc_1_nord_probe,
> +	.driver = {
> +		.name = "dprxcc1-nord",
> +		.of_match_table = dprx_cc_1_nord_match_table,
> +	},
> +};
> +
> +module_platform_driver(dprx_cc_1_nord_driver);
> +
> +MODULE_DESCRIPTION("QTI DPRXCC1 NORD Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 
> 
