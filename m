Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2954402447
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 12:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781094623; cv=none; b=OQ4l3r+gqU6i3NBc8G6umYSy2wabIEj+dXSf5UwJgQIX2dkpW9CvaJhp5GeW/6S8ewvBCxUMAI5PDPE4omIa47WzjqfpsZetFhMHEq/vFxr/eRbuz2Q0J8uX/abmy2cqWwL59mjUTxNaCva16VpA8Su5yz9XWYqq4SycNjEOdFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781094623; c=relaxed/simple;
	bh=zDeq5xRRiuzRacAQZPPYxU2dDhjC+IR6J72Sdm93gYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QhLsRRhh+nqhfHKSKktR5ri7sN0V4VCpJzU8ZcCs6dKTIfmCZroIr0OhyR/QOEXQWPy53DwNRPuJ7rU7SvB8WnhgvClQHG3l3GYgsjClzK1PsNQ0eMBzDyjQn7PRI3e5smWQL8FW82YtVzWPCRQRsGqb49T9K4rdVjMgnWcp5TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AF6cgAHG; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AF6cgAHG"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c1915793so47408485e9.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 05:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781094619; x=1781699419; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/y04M2qmVQkR0LyVOwCMc/iKFLArVo6s1Y/cXml3j7I=;
        b=AF6cgAHGX1qeNjm6IeBW58JNL2VH3o4V1YWSYkC/YmbnH5vZaSL65LQ7x4rMBqNW3r
         8rv0QKepw+Ay6cdAcPCgM5vArHqDRTZdPzslUmDTRlOaAy6quaEsUozH275LRKlFTuPm
         0oNANjTU0I7BabpIzswbWjXiEMf3idNY2aBo7VHB/VGqi6dgDxyM4ppe5v1pzLIV86Vg
         UmpAN0yvtZtscV7aetqNeHGG8kG+KUj7ErXPcNsco18RRCiiHq0ImVskovFC1taeo48x
         wKjdOtFSN++q11F7acg8CaveF5krtsd9ItyPrXaKwnGdx0eL9+5hQLWr6PnOh3M/L3i4
         i0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094619; x=1781699419;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/y04M2qmVQkR0LyVOwCMc/iKFLArVo6s1Y/cXml3j7I=;
        b=NIa4z40iX0pEHA1oJiSq5wvaI/5UkSYInrAvkYNKNTH7SO6KNvxJxqQamNv5OXQLdZ
         q15MsyagFhsZGSn3mABqTyIwN4zHY305mRW40fNcI9gTuWi6k0KVHmUpriBz4Z1hNcef
         fxBEisDqbdBEUReozkc+C3K+X1XWIYLFmF/a7fZJm9Vadp4sAXZqxlDF5/rerVEISsRS
         2r6sB1XpvmlcJFVseye61rmY7FFwo9700Pwt9h2wamNY69713nvGnjyQkfjGrkuWfaZU
         laAVA83iNUPCfM1Y9Owe9y4ldbBgwvVe5XBb21IlSG046v+6ZF8JfR3JD5zrYkADHDOl
         zUvA==
X-Forwarded-Encrypted: i=1; AFNElJ/9aHQqEDVJD833ysWL/hOHNUic8rM7u98TAb9/5I4u9dn2kfYZMI5DqqimyKo8WbQD/nKKMYd//Kqp@vger.kernel.org
X-Gm-Message-State: AOJu0Yydtqk8wwISUrBy0xgys5fkJfuc6lTUpxLzxI16KnOfOl0nNeMg
	AB3wrzmN3JtA3koruRH/UaFB5GBgxpyLTQIwd9AjY+F7HrBmJnhpqrbcAqYd5mLAoD0=
X-Gm-Gg: Acq92OHt1m8kih3uIp2l6dQcof0CH1SRLVVw7JZTpjmRwuts5rqhwkMQsUgGI6i+S6f
	A/KMezFxbJKTxSJLXEbM1TiwJ9C2sNXVMWf5R1sWaRredaoC1/eONOrH8NFNZnxXFRDW4svGNIC
	8Y30Ft0ChVCMxox7nE4poLWyD+y3Zmuv6mAUWe68E0SQHaptcC6r2xei4oNo7zrvI0Jj0jIanYZ
	KpJf6OsB77+y9O09OPHdvFjPR7LCzLH6ldpYHhVwDTRLDx7p5PA+O/d0sHY/3FSe+cRKpPcgd7X
	W1+pO1F/Toub+nbHSKmywA+AAsAm366aukC2y6tM2hUKpYRNc6EhH6Ielz6Yt1fe2AQviSurCjX
	2rbCGix/Z05Y94eKI8vt1ZY8kqfNWZTO7cWIuhQOQr9bGlqIvab1Uqj5KecP5YYVQf3TlwRxety
	4XMiASJDTY4DBCXMNixfHiSr2/Z6c6+nEWWwdjVfKh9JY=
X-Received: by 2002:a05:600c:5246:b0:490:bad8:329c with SMTP id 5b1f17b1804b1-490c25c8197mr382286315e9.12.1781094618902;
        Wed, 10 Jun 2026 05:30:18 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c371:18ed:9599:7f5f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490bc3e59f5sm592218965e9.14.2026.06.10.05.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:30:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <20260610-a9_aoclk-v3-2-b7592d6c31e2@amlogic.com> (Jian Hu via's
	message of "Wed, 10 Jun 2026 16:23:48 +0800")
References: <20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com>
	<20260610-a9_aoclk-v3-2-b7592d6c31e2@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 10 Jun 2026 14:30:16 +0200
Message-ID: <1jjys6fuhz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On mer. 10 juin 2026 at 16:23, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig    |  13 ++
>  drivers/clk/meson/Makefile   |   1 +
>  drivers/clk/meson/a9-aoclk.c | 431 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 445 insertions(+)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index cf8cf3f9e4ee..b71299898197 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
>  
> +config COMMON_CLK_A9_AO
> +	tristate "Amlogic A9 SoC AO clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV
> +	imply COMMON_CLK_SCMI
> +	help
> +	  Support for the AO clock controller on Amlogic A311Y3 based
> +	  device, AKA A9.
> +	  Say Y if you want A9 AO clock controller to work.
> +
>  config COMMON_CLK_C3_PLL
>  	tristate "Amlogic C3 PLL clock controller"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index c6719694a242..f89d027c282c 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -19,6 +19,7 @@ obj-$(CONFIG_COMMON_CLK_AXG) += axg.o axg-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
> +obj-$(CONFIG_COMMON_CLK_A9_AO) += a9-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 000000000000..dd9fd8d24702
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c
> @@ -0,0 +1,431 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "meson-clkc-utils.h"
> +
> +#define AO_OSCIN_CTRL			0x00
> +#define AO_SYS_CLK0			0x04
> +#define AO_PWM_CLK_A_CTRL		0x1c
> +#define AO_PWM_CLK_B_CTRL		0x20
> +#define AO_PWM_CLK_C_CTRL		0x24
> +#define AO_PWM_CLK_D_CTRL		0x28
> +#define AO_PWM_CLK_E_CTRL		0x2c
> +#define AO_PWM_CLK_F_CTRL		0x30
> +#define AO_PWM_CLK_G_CTRL		0x34
> +#define AO_CEC_CTRL0			0x38
> +#define AO_CEC_CTRL1			0x3c
> +#define AO_RTC_BY_OSCIN_CTRL0		0x50
> +#define AO_RTC_BY_OSCIN_CTRL1		0x54
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata) \
> +	MESON_COMP_SEL(a9_ao_, _name, _reg, _shift, _mask, _pdata, NULL, 0, 0)
> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_ao_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit) \
> +	MESON_COMP_GATE(a9_ao_, _name, _reg, _bit, CLK_SET_RATE_PARENT)
> +
> +static struct clk_regmap a9_ao_xtal_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_OSCIN_CTRL,
> +		.bit_idx = 3,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "ao_xtal_in",
> +		.ops = &clk_regmap_gate_ops,
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "xtal",
> +		},
> +		.num_parents = 1,
> +		/*
> +		 * ao_sys can select different clock sources. One possible clock path is:
> +		 *   ao_xtal_in->ao_xtal->ao_sys-> ao sys gate clocks
> +		 *
> +		 * ao_xtal_in is in the parent chain of AO sys gate clocks.
> +		 * Since some downstream clocks are marked CLK_IS_CRITICAL,
> +		 * ao_xtal_in must remain enabled and is therefore marked
> +		 * CLK_IS_CRITICAL as well.
> +		 */
> +		.flags = CLK_IS_CRITICAL,

Please allow some time for me to reply before reposting.
See my answer on v2.


> +	},
> +};
> +
> +static struct clk_regmap a9_ao_xtal = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 0,
> +	},
> +	/* ext_32k is from external PAD, do not automatically reparent */
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ao_xtal",
> +			((const struct clk_parent_data []) {
> +				{ .hw = &a9_ao_xtal_in.hw },
> +				{ .fw_name = "ext_32k" }
> +			}), &clk_regmap_mux_ops, CLK_SET_RATE_NO_REPARENT),

I hope my view on this is clear as well.
Let me know if it isn't 


> +};
> +
> +static struct clk_regmap a9_ao_sys = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_OSCIN_CTRL,
> +		.mask = 0x1,
> +		.shift = 1,
> +	},
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ao_sys",
> +			((const struct clk_parent_data []) {
> +				{ .hw = &a9_ao_xtal.hw },
> +				{ .fw_name = "sys" }
> +			}), &clk_regmap_mux_ops, 0),
> +};
> +
> +static const struct clk_parent_data a9_ao_pclk_parents = { .hw = &a9_ao_sys.hw };
> +
> +#define A9_AO_PCLK(_name, _bit, _flags)		       \
> +	MESON_PCLK(a9_ao_sys_##_name, AO_SYS_CLK0, _bit, \
> +		   &a9_ao_pclk_parents, _flags)
> +
> +/*
> + * A9 integrates a low-power microprocessor (Always-on CPU: AOCPU). Some AO sys
> + * clocks control the AOCPU modules. Mark the AOCPU-related clocks with
> + * CLK_IS_CRITICAL to avoid them being disabled and impacting AOCPU functionality.
> + * AOCPU-related clocks list:
> + * - clktree
> + * - rst_ctrl
> + * - pad
> + * - irq
> + * - pwrctrl
> + * - aocpu
> + * - sram
> + */
> +static A9_AO_PCLK(i3c,		0,	0);
> +static A9_AO_PCLK(rtc_reg,	1,	0);
> +static A9_AO_PCLK(clktree,	2,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rst_ctrl,	3,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pad,		4,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(rtc_dig,	5,	0);
> +static A9_AO_PCLK(irq,		6,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwrctrl,	7,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(pwm_a,	8,	0);
> +static A9_AO_PCLK(pwm_b,	9,	0);
> +static A9_AO_PCLK(pwm_c,	10,	0);
> +static A9_AO_PCLK(pwm_d,	11,	0);
> +static A9_AO_PCLK(pwm_e,	12,	0);
> +static A9_AO_PCLK(pwm_f,	13,	0);
> +static A9_AO_PCLK(pwm_g,	14,	0);
> +static A9_AO_PCLK(i2c_a,	15,	0);
> +static A9_AO_PCLK(i2c_b,	16,	0);
> +static A9_AO_PCLK(i2c_c,	17,	0);
> +static A9_AO_PCLK(i2c_d,	18,	0);
> +static A9_AO_PCLK(sed,		19,	0);
> +static A9_AO_PCLK(ir_ctrl,	20,	0);
> +static A9_AO_PCLK(uart_b,	21,	0);
> +static A9_AO_PCLK(uart_c,	22,	0);
> +static A9_AO_PCLK(uart_d,	23,	0);
> +static A9_AO_PCLK(uart_e,	24,	0);
> +static A9_AO_PCLK(spisg_0,	25,	0);
> +static A9_AO_PCLK(rtc_secure,	26,	0);
> +static A9_AO_PCLK(cec,		27,	0);
> +static A9_AO_PCLK(aocpu,	28,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(sram,		29,	CLK_IS_CRITICAL);
> +static A9_AO_PCLK(spisg_1,	30,	0);
> +static A9_AO_PCLK(spisg_2,	31,	0);
> +
> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
> +	{ .hw = &a9_ao_xtal.hw },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", }
> +};
> +
> +static A9_COMP_SEL(pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_a, AO_PWM_CLK_A_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_b, AO_PWM_CLK_B_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_b, AO_PWM_CLK_B_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_c, AO_PWM_CLK_C_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_c, AO_PWM_CLK_C_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_c, AO_PWM_CLK_C_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_d, AO_PWM_CLK_D_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_d, AO_PWM_CLK_D_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_d, AO_PWM_CLK_D_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_e, AO_PWM_CLK_E_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_e, AO_PWM_CLK_E_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_e, AO_PWM_CLK_E_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_f, AO_PWM_CLK_F_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_f, AO_PWM_CLK_F_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_f, AO_PWM_CLK_F_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_g, AO_PWM_CLK_G_CTRL, 9, 0x7, a9_ao_pwm_parents);
> +static A9_COMP_DIV(pwm_g, AO_PWM_CLK_G_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_g, AO_PWM_CLK_G_CTRL, 8);
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("ao_rtc_dualdiv_in", &a9_ao_xtal.hw,
> +				   &clk_regmap_gate_ops, 0),
> +};
> +
> +static const struct meson_clk_dualdiv_param a9_ao_dualdiv_table[] = {
> +	{ 733, 732, 8, 11, 1 },
> +	{ /* sentinel */ }
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_div = {
> +	.data = &(struct meson_clk_dualdiv_data){
> +		.n1 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.n2 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.m1 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.m2 = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL1,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.dual = {
> +			.reg_off = AO_RTC_BY_OSCIN_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.table = a9_ao_dualdiv_table,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("a9_ao_rtc_dualdiv_div", &a9_ao_rtc_dualdiv_in.hw,
> +				   &meson_clk_dualdiv_ops, 0),
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_RTC_BY_OSCIN_CTRL1,
> +		.mask = 0x1,
> +		.shift = 24,
> +	},
> +	.hw.init = CLK_HW_INIT_PARENTS_HW("ao_rtc_dualdiv_sel",
> +			((const struct clk_hw *[]) {
> +				&a9_ao_rtc_dualdiv_div.hw,
> +				&a9_ao_rtc_dualdiv_in.hw,
> +			}), &clk_regmap_mux_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_regmap a9_ao_rtc_dualdiv = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx = 30,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("ao_rtc_dualdiv", &a9_ao_rtc_dualdiv_sel.hw,
> +				   &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_regmap a9_ao_rtc = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_RTC_BY_OSCIN_CTRL1,
> +		.mask = 0x1,
> +		.shift = 30,
> +	},
> +	.hw.init = CLK_HW_INIT_PARENTS_HW("ao_rtc",
> +			((const struct clk_hw *[]) {
> +				&a9_ao_xtal.hw,
> +				&a9_ao_rtc_dualdiv.hw,
> +			}), &clk_regmap_mux_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_in = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_CEC_CTRL0,
> +		.bit_idx = 31,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("ao_cec_dualdiv_in", &a9_ao_xtal.hw,
> +				   &clk_regmap_gate_ops, 0),
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_div = {
> +	.data = &(struct meson_clk_dualdiv_data){
> +		.n1 = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.n2 = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.m1 = {
> +			.reg_off = AO_CEC_CTRL1,
> +			.shift   = 0,
> +			.width   = 12,
> +		},
> +		.m2 = {
> +			.reg_off = AO_CEC_CTRL1,
> +			.shift   = 12,
> +			.width   = 12,
> +		},
> +		.dual = {
> +			.reg_off = AO_CEC_CTRL0,
> +			.shift   = 28,
> +			.width   = 1,
> +		},
> +		.table = a9_ao_dualdiv_table,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("ao_cec_dualdiv_div", &a9_ao_cec_dualdiv_in.hw,
> +				   &meson_clk_dualdiv_ops, 0),
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv_sel = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_CEC_CTRL1,
> +		.mask = 0x1,
> +		.shift = 24,
> +	},
> +	.hw.init = CLK_HW_INIT_PARENTS_HW("ao_cec_dualdiv_sel",
> +			((const struct clk_hw *[]) {
> +				&a9_ao_cec_dualdiv_div.hw,
> +				&a9_ao_cec_dualdiv_in.hw,
> +			}), &clk_regmap_mux_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_regmap a9_ao_cec_dualdiv = {
> +	.data = &(struct clk_regmap_gate_data){
> +		.offset = AO_CEC_CTRL0,
> +		.bit_idx = 30,
> +	},
> +	.hw.init = CLK_HW_INIT_HW("ao_cec_dualdiv", &a9_ao_cec_dualdiv_sel.hw,
> +				   &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_regmap a9_ao_cec = {
> +	.data = &(struct clk_regmap_mux_data) {
> +		.offset = AO_CEC_CTRL1,
> +		.mask = 0x1,
> +		.shift = 30,
> +	},
> +	.hw.init = CLK_HW_INIT_PARENTS_HW("ao_cec",
> +			((const struct clk_hw *[]) {
> +				&a9_ao_cec_dualdiv.hw,
> +				&a9_ao_rtc.hw,
> +			}), &clk_regmap_mux_ops, CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_hw *a9_ao_hw_clks[] = {
> +	[CLKID_AO_XTAL_IN]		= &a9_ao_xtal_in.hw,
> +	[CLKID_AO_XTAL]			= &a9_ao_xtal.hw,
> +	[CLKID_AO_SYS]			= &a9_ao_sys.hw,
> +	[CLKID_AO_SYS_I3C]		= &a9_ao_sys_i3c.hw,
> +	[CLKID_AO_SYS_RTC_REG]		= &a9_ao_sys_rtc_reg.hw,
> +	[CLKID_AO_SYS_CLKTREE]		= &a9_ao_sys_clktree.hw,
> +	[CLKID_AO_SYS_RST_CTRL]		= &a9_ao_sys_rst_ctrl.hw,
> +	[CLKID_AO_SYS_PAD]		= &a9_ao_sys_pad.hw,
> +	[CLKID_AO_SYS_RTC_DIG]		= &a9_ao_sys_rtc_dig.hw,
> +	[CLKID_AO_SYS_IRQ]		= &a9_ao_sys_irq.hw,
> +	[CLKID_AO_SYS_PWRCTRL]		= &a9_ao_sys_pwrctrl.hw,
> +	[CLKID_AO_SYS_PWM_A]		= &a9_ao_sys_pwm_a.hw,
> +	[CLKID_AO_SYS_PWM_B]		= &a9_ao_sys_pwm_b.hw,
> +	[CLKID_AO_SYS_PWM_C]		= &a9_ao_sys_pwm_c.hw,
> +	[CLKID_AO_SYS_PWM_D]		= &a9_ao_sys_pwm_d.hw,
> +	[CLKID_AO_SYS_PWM_E]		= &a9_ao_sys_pwm_e.hw,
> +	[CLKID_AO_SYS_PWM_F]		= &a9_ao_sys_pwm_f.hw,
> +	[CLKID_AO_SYS_PWM_G]		= &a9_ao_sys_pwm_g.hw,
> +	[CLKID_AO_SYS_I2C_A]		= &a9_ao_sys_i2c_a.hw,
> +	[CLKID_AO_SYS_I2C_B]		= &a9_ao_sys_i2c_b.hw,
> +	[CLKID_AO_SYS_I2C_C]		= &a9_ao_sys_i2c_c.hw,
> +	[CLKID_AO_SYS_I2C_D]		= &a9_ao_sys_i2c_d.hw,
> +	[CLKID_AO_SYS_SED]		= &a9_ao_sys_sed.hw,
> +	[CLKID_AO_SYS_IR_CTRL]		= &a9_ao_sys_ir_ctrl.hw,
> +	[CLKID_AO_SYS_UART_B]		= &a9_ao_sys_uart_b.hw,
> +	[CLKID_AO_SYS_UART_C]		= &a9_ao_sys_uart_c.hw,
> +	[CLKID_AO_SYS_UART_D]		= &a9_ao_sys_uart_d.hw,
> +	[CLKID_AO_SYS_UART_E]		= &a9_ao_sys_uart_e.hw,
> +	[CLKID_AO_SYS_SPISG_0]		= &a9_ao_sys_spisg_0.hw,
> +	[CLKID_AO_SYS_RTC_SECURE]	= &a9_ao_sys_rtc_secure.hw,
> +	[CLKID_AO_SYS_CEC]		= &a9_ao_sys_cec.hw,
> +	[CLKID_AO_SYS_AOCPU]		= &a9_ao_sys_aocpu.hw,
> +	[CLKID_AO_SYS_SRAM]		= &a9_ao_sys_sram.hw,
> +	[CLKID_AO_SYS_SPISG_1]		= &a9_ao_sys_spisg_1.hw,
> +	[CLKID_AO_SYS_SPISG_2]		= &a9_ao_sys_spisg_2.hw,
> +	[CLKID_AO_PWM_A_SEL]		= &a9_ao_pwm_a_sel.hw,
> +	[CLKID_AO_PWM_A_DIV]		= &a9_ao_pwm_a_div.hw,
> +	[CLKID_AO_PWM_A]		= &a9_ao_pwm_a.hw,
> +	[CLKID_AO_PWM_B_SEL]		= &a9_ao_pwm_b_sel.hw,
> +	[CLKID_AO_PWM_B_DIV]		= &a9_ao_pwm_b_div.hw,
> +	[CLKID_AO_PWM_B]		= &a9_ao_pwm_b.hw,
> +	[CLKID_AO_PWM_C_SEL]		= &a9_ao_pwm_c_sel.hw,
> +	[CLKID_AO_PWM_C_DIV]		= &a9_ao_pwm_c_div.hw,
> +	[CLKID_AO_PWM_C]		= &a9_ao_pwm_c.hw,
> +	[CLKID_AO_PWM_D_SEL]		= &a9_ao_pwm_d_sel.hw,
> +	[CLKID_AO_PWM_D_DIV]		= &a9_ao_pwm_d_div.hw,
> +	[CLKID_AO_PWM_D]		= &a9_ao_pwm_d.hw,
> +	[CLKID_AO_PWM_E_SEL]		= &a9_ao_pwm_e_sel.hw,
> +	[CLKID_AO_PWM_E_DIV]		= &a9_ao_pwm_e_div.hw,
> +	[CLKID_AO_PWM_E]		= &a9_ao_pwm_e.hw,
> +	[CLKID_AO_PWM_F_SEL]		= &a9_ao_pwm_f_sel.hw,
> +	[CLKID_AO_PWM_F_DIV]		= &a9_ao_pwm_f_div.hw,
> +	[CLKID_AO_PWM_F]		= &a9_ao_pwm_f.hw,
> +	[CLKID_AO_PWM_G_SEL]		= &a9_ao_pwm_g_sel.hw,
> +	[CLKID_AO_PWM_G_DIV]		= &a9_ao_pwm_g_div.hw,
> +	[CLKID_AO_PWM_G]		= &a9_ao_pwm_g.hw,
> +	[CLKID_AO_RTC_DUALDIV_IN]	= &a9_ao_rtc_dualdiv_in.hw,
> +	[CLKID_AO_RTC_DUALDIV_DIV]	= &a9_ao_rtc_dualdiv_div.hw,
> +	[CLKID_AO_RTC_DUALDIV_SEL]	= &a9_ao_rtc_dualdiv_sel.hw,
> +	[CLKID_AO_RTC_DUALDIV]		= &a9_ao_rtc_dualdiv.hw,
> +	[CLKID_AO_RTC]			= &a9_ao_rtc.hw,
> +	[CLKID_AO_CEC_DUALDIV_IN]	= &a9_ao_cec_dualdiv_in.hw,
> +	[CLKID_AO_CEC_DUALDIV_DIV]	= &a9_ao_cec_dualdiv_div.hw,
> +	[CLKID_AO_CEC_DUALDIV_SEL]	= &a9_ao_cec_dualdiv_sel.hw,
> +	[CLKID_AO_CEC_DUALDIV]		= &a9_ao_cec_dualdiv.hw,
> +	[CLKID_AO_CEC]			= &a9_ao_cec.hw,
> +};
> +
> +static const struct meson_clkc_data a9_ao_clkc_data = {
> +	.hw_clks = {
> +		.hws = a9_ao_hw_clks,
> +		.num = ARRAY_SIZE(a9_ao_hw_clks),
> +	},
> +};
> +
> +static const struct of_device_id a9_ao_clkc_match_table[] = {
> +	{
> +		.compatible	= "amlogic,a9-aoclkc",
> +		.data		= &a9_ao_clkc_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, a9_ao_clkc_match_table);
> +
> +static struct platform_driver a9_ao_clkc_driver = {
> +	.probe		= meson_clkc_mmio_probe,
> +	.driver		= {
> +		.name	= "a9-aoclkc",
> +		.of_match_table = a9_ao_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a9_ao_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A9 Always-ON Clock Controller driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

-- 
Jerome
