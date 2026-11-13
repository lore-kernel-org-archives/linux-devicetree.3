Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794571590;
	b=AUmvr6nW/QOt1xlNoRhIGZSkO1tmHrbiwBlaSRp53y2FpYzVi7mwnyeQPslgfRr3dKgk
	 bZhj7Gk6qc0nLVeqQyBVD3LlzQRU/jQzHTbZlHwwRR0HzCMqj9va1YIxDqjvxWCQ1amAr
	 w+UZkYCOOt7CSd7+WeQctbjzXdCgz6b0mw5vFPUpto4GoDQ+cn+0SGqB44ArkR3o6wZcl
	 0TWe/hAmo232X72+1BZ66oWqL3+bU7VioMJ9lnkCMaAZpNNbxhc27/f3uBt2N7Q79e7A4
	 Og19erfKfGTDr+kCCmUHQev1v2om6Jk18Iy7VpyQ3pEuakzyyhJ6l9hS1lvqT7N7Ndg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
	b=HDN3U6TTp+MGwhagYErvlYD6Znol7cMRqWxAPHWOI/UQqVeE04QTXcYYDCMm0WNzN2DO
	 DrNBA71OEI+bb6pIovl6oVxea1wPjbLLP1I6TdXrDkclv71Bx+VyniLPVb+s1pGIwvLp8
	 6NwEOOhwrGA2EjWRB3OwPdzLj/8iePQLdX9fdvuoBHoxIQFSa/dpOcLHVGqwY7WDkyI9p
	 /Ly34f8OW5skyC4NSAAILGbvcKG4JU/6piAgav+RyZELo2hkLGK6VpTnEU+O3s9BiNqCI
	 3oDgs+VrrG4fjifXZqXHnySci0SF9n9bHwyMrXby8hGkEyA2jNSB8pSxGXdlg7JrQeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="hSIZT/fM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732FE606B580
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732FE606B580
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hSIZT/fM
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so1649880a12.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:06:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794571588; cv=none;
        d=google.com; s=arc-20260327;
        b=WVfGSCwKs8heFy+gqdIpAloZjqhhW7Wxg10p39KEpJ5MKeS+7vdBJGKg/cjAIMGH+g
         Bhcyntx/oAKwjZau1oyGd0ytm2/7xESAwWrYgSW2+q7YayHM8Pf7C4QDOEnQOne+s9zn
         W3f5BR0LOP6ohhTc4k8ffoPEqUoSUCYDT/ughmisiSAg1tcplidCaz0RYM0phDpvgSZS
         UWHvIsUH33aG1piMBEuhraBhRHo+02Q5aBHSmrzYf3DBukrJqVOxhUVTwx6UFQEEi9Fx
         gUI18t2tok1cX4EfcsEuzx1nJixHzwhXOqGRCCnFWdtZPIFjGkt5mqm4dvRd44mTacbC
         NeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        fh=cQlGGPR9FzXfz4ruggns+iK99hxQj8ml90m3LZlw4xQ=;
        b=dRKR23pjXhsfMnh7i2bed8qKGQAVUqVvl6TbpywOhPKwG9j+er7ttggY9usrRF5r4D
         54dHBw7chbGKXXTw+V3Tuoyq59RLItjR/jmjwjx4FEA+YrooAlkbRtFy2yMqR/D1vqT9
         dtBWt/hFXPD7XHllW2AhQIn0kG+tqxkj7fbBL1sZt6XB42xvYTTkYQ9ttykbW1guPiQM
         htuCzofjv94+EpjkPU0+kVHKiKLZGiIXI9NZme/e4VYThbWwwjGL9rikMW/UzD6zgUQW
         Gj77lmNbwOFjxmcd9UvYAOOeCdUPnVxXl3wvd1sTvpyXLBd9wWFSFteQAAtiknA6FOOV
         3eIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794571588; x=1795176388; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=hSIZT/fMx7/k1eDgZbgkKWwe8Vo+2D7cRA1eeDwbkq+6Gwve08pwTNZIfE1LEKKzqs
         IV7uSvtfh+yOOmOUlP6Wgj0bJEhnNXkWnzoOs6SqY0HFh0IZ7FpEKIuzWNpN90eI7s5n
         m6ZFj+D8siqtDipklshc9cB7nAAER0AiPxsln7DOEPHJIzN7cNsmxeRAzcGB3qSKKLbV
         LHFwhgeIjfiReCl6+VlaKnPRi/Iwh60ElOoInbZ2ekey7ZllC8Qq33B8CenVRZVplOaq
         nJxAAVJyM/X07MC//3W4CCx0o2cjEM9U6TED1b8X7hZkN+gNnCwtj/g19Gzu9FWEn1oZ
         iTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571588; x=1795176388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rrZ72aMFXIt9J0eJiunU6ye5nEAGfTC6WD38knv82lM=;
        b=LNmyEDkXtwszv41n06vXjRR3elN/paBHeh6kO9DbgbBBlmCnWAjlWBO8pEUVcluk8s
         Qldp3QMMbXtazp91LwEuVdojFPV4jzgbCSrQO6wqb+R2Fg+VrmjtM19PaUMeHtWdcFck
         kljJbETrp2DSDhXvl7TzFsM45oWh8sZXn6nHqBVVrZMFoEzjLZWtFpIfxvOzbOBpkbMF
         D4oamzqo/ydeU+RpI3dPCIP4J87Y+7SQAC2XkgxWrU8RNHA1lataR4YWDGu2s9Mxh/N9
         33pO5DGmGpdPvImUXfLcHxIRhqX2yljXp4Oe9eosVFRlFrkp0WumE7ibLIw6QzFWhwWJ
         E7fw==
X-Forwarded-Encrypted: i=1; AL+hErFMKcBePYwr1+VA2siELVfi7bVbC4rRprKG8/rMVMWjGctflyGMTmsGteqspJD3KYwFD4D6jfXAVrqT@vger.kernel.org
X-Gm-Message-State: APuU4Z/TLqxcWH0nXSsJI430+KO1dDgymq0nZA46diRc88Zk9e6nnrXH
	gBgvPwO94GakBJg0MCIEBig0dQaQBFKdV9EW7HBey0CO5ZYKz9ZbammcESbLSA4KUkWhlwJHYzG
	VEEzLJkW4azhSRtbp62cfQ14iwp91ihogLjVc+qxLDA==
X-Gm-Gg: AYBFou1U4oFMwnxbOnwa7MySxxz7W2fVyQOqlY6iLPCDm7j8a9ZrcCBzopamaLqEYmw
	DFCO10gNwcBo+PT51lDgp5TWbjy4A7dVvg8CUWCxtL7EAXghtbcB6RL2q0msByo2twK35+ye90m
	M5ICD2QpGA/pA/w7+yO5RUMVIDJ+JUUD5zoAoG8ie3m6BZE5TmjfCh1+8M9hV8z53K64w5hxbcC
	iKlPnJFwaegBSBgCh81ad2PbytZYL7+QAQfW/qcplVUR3sUFmxIFQzRBGpCLuioTpv5w0oF/MUU
	NlAagh/zD8e4jkp1Zr4y5J88IBdTsFx/Ce2fhWuPvqinAcUrK45CcMSsKCLrx/0uOHt7CaelruS
	lpoNsZAYNc3vs8LA123ICEsd26N2K8VSNBQkCgOTXzoLzAq+QK9BAv2E9Whbu6HuxM/M8MQ==
X-Received: by 2002:a05:6402:2350:b0:6b7:6f9:2ef7 with SMTP id
 4fb4d7f45d1cf-6b7c0bc5f30mr1834438a12.11.1794571587568; Fri, 13 Nov 2026
 04:06:27 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104850epcas5p4ef9292af100475b1f12a2601bf5e1a84@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-8-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-8-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:06:15 +0000
X-Gm-Features: AclHuK_PX8mgp8O_dlqBWaitzb8guO9jt4s7fw--0eo5yJf4LliJ6Zz_ShncF-Q
Message-ID: <CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/14 RESEND] clk: samsung: exynos8855: add block top
 and peric clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

Nice to see you got the auto clock mode working on this SoC. Great
Work! See some inline comments below

On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_TOP & CMU_PERIC, these provide clocks for TOP & PERIC
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/Makefile         |    1 +
>  drivers/clk/samsung/clk-exynos8855.c | 1130 ++++++++++++++++++++++++++
>  2 files changed, 1131 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos8855.c
>
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index b3e994bd525d..99c2c304ff48 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) += clk-exynos8895.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos990.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov9.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynosautov920.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-exynos8855.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  += clk-gs101.o
>  obj-$(CONFIG_EXYNOS_ACPM_CLK)          += clk-acpm.o
>  obj-$(CONFIG_S3C64XX_COMMON_CLK)       += clk-s3c64xx.o
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> new file mode 100644
> index 000000000000..dcf58f2459b0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -0,0 +1,1130 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Samsung Electronics Co., Ltd.
> + * Author: Raghav Sharma <raghav.s@samsung.com>
> + *
> + * Common Clock Framework support for Exynos 8855 SoC.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/samsung,exynos8855.h>
> +
> +#include "clk.h"
> +#include "clk-exynos-arm64.h"
> +
> +/* NOTE: Must be equal to the last clock ID increased by one */
> +#define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> +#define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +
> +#define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> +#define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> +
> +#define EXYNOS8855_DRCG_EN_OFFSET       0x104
> +#define EXYNOS8855_MEMCLK_OFFSET        0x108
> +
> +/* ---- CMU_TOP --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_TOP (0x13900000) */
> +/* PLL */

IIUC in clk-pll.c you are using PLL_LOCKTIME_PLL_SHARED* - 4 for the
PLL_CON8 register offset? I was expecting to see those registers
defined here

> +#define PLL_LOCKTIME_PLL_SHARED0                            0x8
> +#define PLL_LOCKTIME_PLL_SHARED1                            0x10
> +#define PLL_LOCKTIME_PLL_SHARED2                            0x18
> +#define PLL_LOCKTIME_PLL_MMC                                 0x20
> +#define PLL_LOCKTIME_PLL_SHARED3                            0x28
> +#define PLL_LOCKTIME_PLL_SHARED4                            0x38
> +#define PLL_LOCKTIME_PLL_MIF_SWITCH                         0x30
> +#define PLL_CON0_PLL_MMC                                    0x1c0
> +#define PLL_CON3_PLL_MMC                                    0x1cc
> +#define PLL_CON0_PLL_SHARED0                                0x100
> +#define PLL_CON3_PLL_SHARED0                                0x10c
> +#define PLL_CON0_PLL_SHARED1                                0x140
> +#define PLL_CON3_PLL_SHARED1                                0x14c
> +#define PLL_CON0_PLL_SHARED2                                0x180
> +#define PLL_CON3_PLL_SHARED2                                0x18c
> +#define PLL_CON0_PLL_SHARED3                                0x200
> +#define PLL_CON3_PLL_SHARED3                                0x20c
> +#define PLL_CON0_PLL_SHARED4                                0x280
> +#define PLL_CON3_PLL_SHARED4                                0x28c
> +#define PLL_CON0_PLL_MIF_SWITCH                             0x240
> +#define PLL_CON3_PLL_MIF_SWITCH                             0x24c
> +
> +/* MUX & DIV */
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_CPU                   0x1000
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_AUD_NOC                   0x1004
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_SWITCH             0x1008
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_NOCP               0x100c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DSU_SWITCH                0x1010
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL1_SWITCH             0x1014
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK0                  0x1018
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK1                  0x101c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK2                  0x1020
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK3                  0x1024
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CIS_CLK4                  0x1028
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_TOP             0x102c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST                 0x1030
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_CPU             0x1034
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF0            0x1038
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_NOC                  0x103c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_NOC                 0x1040
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_BYRP                0x1044
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DPU_NOC                   0x1048
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3DCORE_SWITCH            0x104c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_NOC                   0x1058
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_JPEG                  0x105c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_M2M_GDC                   0x1060
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_NOCP                 0x1064
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MFC_NOC                   0x1068
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_NOCP                 0x106c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL0_NOC                 0x1070
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1A_NOC                0x1074
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_NOC                 0x1078
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_MMC_CARD            0x107c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIC_IP                  0x1080
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_CPU                   0x1800
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_AUD_NOC                   0x1804
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH             0x1808
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_NOCP               0x180c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DSU_SWITCH                0x1810
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH             0x1814
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK0                  0x1818
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK1                  0x181c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK2                  0x1820
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK3                  0x1824
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CIS_CLK4                  0x1828
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_TOP             0x182c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST                 0x1830
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_NOC                  0x1834
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_CPU             0x1838
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF0            0x183c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_NOC                 0x1840
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_BYRP                0x1844
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DPU_NOC                   0x1848
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3DCORE_SWITCH            0x184c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_NOC                   0x1858
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_JPEG                  0x185c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_M2M_GDC                   0x1860
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF1_NOCP                 0x1864
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MFC_NOC                   0x1868
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_MIF0_NOCP                 0x186c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL0_NOC                 0x1870
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1A_NOC                0x1874
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_NOC                 0x1878
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_MMC_CARD            0x187c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIC_IP                 0x1880
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_GIC                 0x10c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PERIS_NOC                 0x10c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_GIC                 0x18c0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PERIS_NOC                 0x18c4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_NOC                   0x1050
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_HSI_UFS_EMBD              0x1054
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_NOC                   0x1850
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_HSI_UFS_EMBD              0x1854
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_RGBP_NOC                  0x1084
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_YUVP_NOC                  0x1090
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ALIVE_NOC                 0x1094
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_DCPHY                0x1098
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSIS_OIS                  0x109c
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_0               0x10a0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_ICPU_NOCD_1               0x10a4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_NOC                 0x10ac
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_GNPU0_XMAA                0x10b0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_SDMA_NOC                  0x10b4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_HTU                   0x10b8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_DNC_NOC                   0x10bc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_PSP_NOC                   0x10c0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_NOCP                  0x10cc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_NOC                   0x10d0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USI_IP                    0x10d4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL0_DBG_NOC            0x10d8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_BOOST_RCO                 0x10dc
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF0_SWITCH               0x10e0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_MIF1_SWITCH               0x10e4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_NOCL1B_NOC                0x10e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CPUCL2_SWITCH             0x10ec
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CMU_BOOST_MIF1            0x10f0
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_CSTAT_MCSC                0x10f4
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_G3D_HTU                   0x10f8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_RGBP_NOC                  0x1884
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_YUVP_NOC                  0x1890
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ALIVE_NOC                 0x1894
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_DCPHY                0x1898
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSIS_OIS                  0x189c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_0               0x18a0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_ICPU_NOCD_1               0x18a4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_NOC                 0x18a8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_GNPU0_XMAA                0x18ac
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_SDMA_NOC                  0x18b0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_HTU                   0x18b4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_DNC_NOC                   0x18b8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_PSP_NOC                   0x18bc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_NOCP                  0x18c8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_NOC                   0x18cc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USI_IP                    0x18d0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL0_DBG_NOC            0x18d4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_NOCL1B_NOC                0x18d8
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH             0x18dc
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CMU_BOOST_MIF1            0x18e0
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_CSTAT_MCSC                0x18e4
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_G3D_HTU                   0x18e8
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_NOC                   0x1088
> +#define CMU_TOP_CLK_CON_MUX_CLKCMU_USB_USB20DRD              0x108c
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_NOC                   0x1888
> +#define CMU_TOP_CLK_CON_DIV_CLKCMU_USB_USB20DRD              0x188c
> +#define CMU_TOP_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long top_clk_regs[] __initconst = {
> +       PLL_LOCKTIME_PLL_MMC,

and also here

> +       PLL_LOCKTIME_PLL_SHARED0,
> +       PLL_LOCKTIME_PLL_SHARED1,
> +       PLL_LOCKTIME_PLL_SHARED2,

[..]

> +/* Register CMU_TOP early, as it's a dependency for other early domains */
> +CLK_OF_DECLARE(exynos8855_cmu_top, "samsung,exynos8855-cmu-top",
> +              exynos8855_cmu_top_init);
> +
> +/* ---- CMU_PERIC --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIC (0x15400000) */
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_IP_USER            0x600
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_MMC_CARD_USER      0x610
> +#define CMU_PERIC_PLL_CON0_MUX_CLKCMU_PERIC_NOC_USER           0x620
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_I2C                    0x1000
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_UART_DBG               0x1004
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI00                  0x1008
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI01                  0x100c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI02                  0x1010
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI03                  0x1014
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI04                  0x1018
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI09_USI_OIS          0x101c
> +#define CMU_PERIC_CLK_CON_MUX_CLK_PERIC_USI10_USI_OIS          0x1020
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_NOCP                   0x1800
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_UART_DBG               0x1804
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI00_USI              0x1808
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI01_USI              0x180c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI02_USI              0x1810
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI03_USI              0x1814
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI04_USI              0x1818
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI09_USI_OIS          0x181c
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI10_USI_OIS          0x1820
> +#define CMU_PERIC_CLK_CON_DIV_CLK_PERIC_USI_I2C                0x1824
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK    0x2004
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK 0x2060
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK     0x2064
> +#define CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK    0x206c
> +#define CMU_PERIC_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +

If you don't define all registers (like QCH, etc.) in the CMUs that
can be powered off, enabling power domains on this SoC might cause you
to lose state configured by the bootloader (and quite possibly also
suffer weird hard to debug timing/clock issues when enabling power
management).

Since auto clock mode is now used (and QCH registers are used by auto
mode), I think it makes sense to define all the CMU registers that
need their state preserved here.

Thanks,

Peter
