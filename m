Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802504;
	b=mHBpDXKO5cSB9iu5iAC9iCbFg0NgU3t5TGvIfbaHTyn+f9hdPImxohiHjZvUwqITUkx8
	 Z5Ay/IjlnooR8DQ+r3Qx6cB0sdRYYqnAdd036bf+gfvfabpOxkv9RSUMSna2xBpatPTLz
	 jy2H4WpvRlUVViy3iuLKzIxd8TC9XdHcTCyPxdVp1cmUD+LSkm/puyG7SiI2ueIiRlyF6
	 boiIf/cp64bryblabr5Pnq6TN5UY1gUIbBSGKQnvU5IiZ7Pra95etgvukWUYsEOOCsTx7
	 hFHXHhSCPtQ65Ctjkpg/r6fBuS7FKqS7LsOiD7lehUmFhZu1CLNrxfwzzvAFAFLON2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OhmwLO45n2HyjQfwzALw0vN/yyYuwoMfpi+ppXePlS8=;
	b=UHCWd2mKlIpxvAa3DQ0S6B1V4MnMt0+h84lwVC7+6bC5WV7FF43u8OxRF3FeSM5l3e4r
	 l7MdJezEkBbIy5reH5LapSwuFAzxsxviOgttTfTMTgAYe1bksXkAsJZbuVWNrvooO3jKH
	 6ErcgnlTG1wh5bs+5F+22+8v3Ud5C/bVjmqQGWutMaAiuNmjrw1j263dGl1/ume5nxazp
	 AHudzdpzPha3O+kGRV4y36crJB4E2izma490hPSR46Z6uEUYU0y96OpY0pNeeT8+N9tHg
	 YcbfsaumdyyvcozfnSuVkH8V+8Q/bla6qtmbt+IbAYmQlvLYTQETQgyBU4VoYTMocug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JGyPWdmo;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5255A606A337
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 18:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5255A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JGyPWdmo
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso77795305e9.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 10:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795802502; x=1796407302; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OhmwLO45n2HyjQfwzALw0vN/yyYuwoMfpi+ppXePlS8=;
        b=JGyPWdmoTtLLDjKq3KV8SlDwheJfGomJOGg3wZ+eBbSZFxrgHnHW72AsrztIoM7Iqj
         S3nZ38GTd+pyEvsRnmKQ/7RVhhhMDEkNtYlHLWSS4UvVoZ5SCalxhs1l+RFeZc0CIRTq
         JPAi6bL8vBU0RB86IXTGKfp2UhRM5UHQApfTkTDd9QgujkJUB/9jaH0r1BzW3CQ34DMx
         /hbCvi3/NYzkDtD2/GJ+xIzvAVEUzDWRDPjJcQzYgQwEtbgnNhbDdpATNFqJ23s+tHZi
         OkftsPgOD3E1ln3SHbpbB+UaWm7UZ7qOXKJnxQM2iGZeyh40NCWzoMfd6Kb/ekLtCe4n
         GXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802502; x=1796407302;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhmwLO45n2HyjQfwzALw0vN/yyYuwoMfpi+ppXePlS8=;
        b=vVGivjDnHih65+XD4wKRStzGeiJRpBnE0zNLdHWRSxW31o/HTbGozQKuaAZXXg1uNl
         7jl1lOT8K+CwxXdo+Donl2UY1SuylIY0EwTfsjxkXVm33XjOBbj+x9JWk8E/PHSE2Efj
         Grx6PaOTYt/zZA93a4WhPIrbp4MEN8GAt2fCNOxn0mHnDJhYJnsFC7YMadTTqb+JM7ZE
         JT6v0ePOZX255EvsOGRTNalRUBmar+pgU23hOjPnSHbx1LoEiixebepTB0bMIWJjIICa
         c2/rzxmoGLH4MXiQ64Xg2rxFcmJoBzStVegG16+OejpSMeyOkQqgASUmFjEbezPsC4LQ
         yktw==
X-Forwarded-Encrypted: i=1; AL+hErGDFMGnEyOIF/2gTe8ZvkYCJJCeOFKldwsAkFlKYJvKFZa7xe9NpaciVjMI1QnQS6S2UQgIrEASd00W@vger.kernel.org
X-Gm-Message-State: APuU4Z8YTfIwcmY58Ma5D8496TBV3QE2pVhWW1FfB8oOd2nolVzNQ/yb
	QPeb45QqUsR+EdgYAh9uWm5SaS5lYvSYCuVnyc8swbM5zXIxhdCVws71Ry0Vm4rQLWI=
X-Gm-Gg: AZFdTZetqPX//5tBwtvYiciFe1IgSS1fAfiFs1Z3/Elybo5MovITMJzsVl2A4B+2o03
	V4R6c570Nko0O6juVgJ1t02xtJazBRfMImVHLo/mKn8LZ6xiw34ny2XDhA/jJ98G9wRDLWqpRQG
	H85AdQOQUtYuSa5i853xnunpx8JIGThqJXX2OJHBZpx2S5cap3OHAVQhnnx+5CZUatfkcwv+fUX
	BrwkxNKo2lDfWY6zBNwDbZesQIhKkh5VSrijZ9NN/I1pUJo4+TBVo6lQ+9zs2yzK08F3Fnqw5ry
	q+NiLUe5tFSUFp6yg8g+TqrCHpVABacDTliS/Yy4rV53acbpSYfSEA5Q2OmpC39ZNdAZQE4UWMd
	UcbITyJd+g830vktmIpP4cr/7WZ/fWW5/kJOrAVauA+9rEJ5xTyQ9YtxEx6353XVKfsi3EQiv1L
	0VFnrhaZWPWOLvMsSKf97Eq7/8DITu9NsJA2BMgRR9DOv48598ay0CYgOLc+o9BSTgghAnGpVBB
	XG7XOxfz4FpcNkf1MA427GqyuCeMJQ/gn+pFULdRJxAzDYP3B3yg1vzbT2UD2wbrYUmIfZY7dzB
	4A8cwShyCzQiTllpPNor8rXw50EQYtTPlw==
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr508304765e9.33.1795802501271;
        Fri, 27 Nov 2026 10:01:41 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm585400505e9.0.2026.11.27.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:01:39 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/3] clk: toshiba: introduce a TC9564 clock/reset
 driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alex Elder <elder@riscstar.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, andersson@kernel.org, konradybcio@kernel.org, 
 abelvesa@kernel.org, daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, 
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com, 
 alexandre.torgue@foss.st.com, marex@nabladev.com, 
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261125202141.1288493-3-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-3-elder@riscstar.com>
Date: Fri, 27 Nov 2026 19:01:35 +0100
Message-Id: <179580249573.2809466.11581167108626346174.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=17869; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=+YHU3Hqpi8UStV+F6rsIa/fKER/MYVRBpAUDSElwfYo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcRxvtXZ6vSpzXefbHHr8F5l/dsy1mu/H/OX22+W2wU
 P8k6cvrOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjARR1ZGhiPx5xLYTk1t7TZv
 NRYPlW84qDx78hO9pc/7+8XE6/MPLWX4n5tyrsLA48qhq89ein+ctd0tY0OiskvzvgoBDYvnidZ
 HWAE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Define a new platform driver that manages clocks and resets implemented
> by the Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
> and disabled, but currently only the clocks that are (or will soon be)
> used are defined to be controllable.  There are also 13 resets that can
> be asserted or deasserted, but support for some of these is omitted as
> well.
> 
> Two registers manage the state of the clocks, and two others manage
> the state of the resets.  All four registers are found in a region
> mapped for MMIO.  The region is provided via a BAR on one of the PCI
> functions embedded in the TC9564 SoC.
> 
> The I2C and PCIE clocks and resets are treated as CRITICAL, meaning their
> state should never be changed (and a warning is issued if changing their
> state is attempted).
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - Fixed problems/garbage in the patch header
>     - The Kconfig option now depends on RESET_CONTROLLER, and can now
>       be enabled if COMPILE_TEST is enabled
>     - The generic gate clock controller code is now used rather than
>       implementing a custom one
>     - The PLL and internal fixed clocks IDs are no longer available
>       outside "clk-tc9564.c"
>     - The PLL is initialialized, followed by all fixed rate clocks,
>       followed by the gate clocks, to ensure each clock's parent is
>       initialized before the clock is
>     - Updating the reset registers (read/modify/write) is now protected
>       by a spinlock
>     - "Unnecessary newlines" have been removed
> 
>  MAINTAINERS              |   1 +
>  drivers/clk/Kconfig      |   9 +
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-tc9564.c | 456 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 467 insertions(+)
>  create mode 100644 drivers/clk/clk-tc9564.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d1f4cbfd731..b433e40cb023 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28338,6 +28338,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
> +F:	drivers/clk/clk-tc9564.c
>  F:	include/dt-bindings/clock/toshiba,tc9564.h
>  
>  TOSHIBA TC9564 PCI DRIVER
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 37a8e35d4178..33d6f90743f0 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -185,6 +185,15 @@ config COMMON_CLK_CDCE706
>  	help
>  	  This driver supports TI CDCE706 programmable 3-PLL clock synthesizer.
>  
> +config COMMON_CLK_TC9564
> +	tristate "Toshiba TC9564 clock and reset support"
> +	depends on TC9564_PCI || COMPILE_TEST

Does it really depend on it ?
Shouldn't you imply this driver from TC9564_PCI instead ?

> +	depends on RESET_CONTROLLER
> +	default TC9564_PCI

... if you do, this is not needed

> +	help
> +	  This enables support for the clock and reset controllers embedded
> +	  in the Toshiba TC9564 SoC.
> +
>  config COMMON_CLK_TPS68470
>  	tristate "Clock Driver for TI TPS68470 PMIC"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 52d138d4ffc8..a11a8326d79c 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
>  obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
>  obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
>  obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
> +obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
>  obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
>  obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
>  obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
> diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
> new file mode 100644
> index 000000000000..306781e2f7b4
> --- /dev/null
> +++ b/drivers/clk/clk-tc9564.c
> @@ -0,0 +1,456 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>

Reset controllers belong in drivers/reset.
Please use the auxialiary or the MFD bus to handle this case.

Grep devm_auxiliary_device_create(), there are several example
of this already.

> +#include <linux/slab.h>
> +
> +#include <dt-bindings/clock/toshiba,tc9564.h>
> +
> +/*
> + * Define the offsets for the registers that implement clock enable/disable
> + * bits for gated clocks, and those that implement reset assertion bits for
> + * resets.  These offsets are relative to the address space defined in
> + * devicetree.
> + */
> +#define CLOCK0_OFFSET	0x0
> +#define CLOCK1_OFFSET	0x8
> +
> +#define RESET0_OFFSET	0x4
> +#define RESET1_OFFSET	0xc
> +
> +/*
> + * A PLL driven by a 25 MHz input oscillator provides a clock source to
> + * the chip.  A set of fixed rate clocks is derived from the PLL, and a
> + * set of gate clocks are children of the fixed rate clocks.
> + *
> + * The clk_hw[] array within a clk_hw_onecell_data structure tracks all
> + * of them.  The following definitions describe how these are laid out
> + * based on their indexes into the clk_hw[] array.  Gate clocks are first,
> + * so their "raw" public IDs can be used as indexes into the array.
> + */
> +#define GATE_BASE	0
> +#define FIXED_BASE	(GATE_BASE + GATE_COUNT)
> +#define CLOCK_PLL	(FIXED_BASE + FIXED_COUNT)

That seems very fragile. Are sure you've defined all the clocks in the chip ?
Because, if you did not and someone later add one, all the ids shift and it will
be quite a mess to stay align with the DT ids.

> +
> +/* The total number of clocks in the clk_hw[] array */
> +#define CLOCK_COUNT	(GATE_COUNT + FIXED_COUNT + 1)
> +
> +struct tc9564_clock {
> +	void __iomem *ioaddr;	/* Mapped clock/reset registers */
> +	spinlock_t lock;	/* Protects reset register updates */
> +	struct clk_hw_onecell_data *clk_data;

That would means have a 2 cells controller. Those are rather uncommon for clock
controllers. The representation here would be <&clk TYPE NUM>.
Unnecessary complex IMO

> +	struct reset_controller_dev rcdev;
> +};
> +
> +/* Indexes into the fixed_init[] array */
> +enum fixed_clock {
> +	CLOCK_62_5M,
> +	CLOCK_125M,
> +	CLOCK_250M,
> +	CLOCK_312_5M,
> +};

not sure why you need this

> +
> +struct fixed_init {
> +	const char *name;
> +	unsigned int div;	/* Rate is PLL rate divided by this */
> +};
> +
> +struct gate_init {
> +	const char *name;
> +	enum fixed_clock parent;
> +	u8 offset;		/* Control register offset (0x0 or 0x8) */
> +	u8 bit;			/* Bit in the control register (0-31) */
> +	bool critical;
> +};
> +
> +struct reset_init {
> +	u8 offset;		/* Control register offset (0x4 or 0xc) */
> +	u8 bit;			/* Bit in the control register (0-31) */
> +};
> +
> +/* Add FIXED_BASE to index values to get their index into the clk_hw[] array */
> +static const struct fixed_init fixed_init[] = {
> +	[CLOCK_312_5M] = {
> +		.name = "312.5MHz",
> +		.div = 4,

What you can do is store the DT id associated to each clock, because this is fixed.
Then all you have to do is iterate over your 3 tables to fill the HW onecell.

This way, it is still possible to add clock later on without wrecking the DTS ids
you can also put the onecell id of the parent.

> +	},
> +	[CLOCK_250M] = {
> +		.name = "250MHz",
> +		.div = 5,
> +	},
> +	[CLOCK_125M] = {
> +		.name = "125MHz",
> +		.div = 10,
> +	},
> +	[CLOCK_62_5M] = {
> +		.name = "62.5MHz",
> +		.div = 20,
> +	},
> +};
> +#define FIXED_COUNT	ARRAY_SIZE(fixed_init)
> +
> +/* Add GATE_BASE to index values to get their index into the clk_hw[] array */
> +static const struct gate_init gate_init[] = {
> +	[CLOCK_MAC0_TX] = {
> +		.name = "MAC0-TX",
> +		.parent = CLOCK_312_5M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 7,
> +	},
> +	[CLOCK_PCIE] = {
> +		.name = "PCIe",
> +		.parent = CLOCK_250M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 9,
> +		.critical = true,
> +	},
> +	[CLOCK_I2C] = {
> +		.name = "i2c",
> +		.parent = CLOCK_62_5M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 12,
> +		.critical = true,
> +	},
> +	[CLOCK_MAC0_RX] = {
> +		.name = "MAC0-RX",
> +		.parent = CLOCK_312_5M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 14,
> +	},
> +	[CLOCK_MSIGEN] = {
> +		.name = "msigen",
> +		.parent = CLOCK_125M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 18,
> +	},
> +	[CLOCK_MAC0_125M] = {
> +		.name = "MAC0-125MHz",
> +		.parent = CLOCK_125M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 29,
> +	},
> +	[CLOCK_MAC0_ALL] = {
> +		.name = "MAC0-ALL",
> +		.parent = CLOCK_250M,
> +		.offset = CLOCK0_OFFSET,
> +		.bit = 31,
> +	},
> +	[CLOCK_MAC1_TX] = {
> +		.name = "MAC1-TX",
> +		.parent = CLOCK_312_5M,
> +		.offset = CLOCK1_OFFSET,
> +		.bit = 7,
> +	},
> +	[CLOCK_MAC1_RX] = {
> +		.name = "MAC1-RX",
> +		.parent = CLOCK_312_5M,
> +		.offset = CLOCK1_OFFSET,
> +		.bit = 14,
> +	},
> +	[CLOCK_MAC1_125M] = {
> +		.name = "MAC1-125MHz",
> +		.parent = CLOCK_125M,
> +		.offset = CLOCK1_OFFSET,
> +		.bit = 29,
> +	},
> +	[CLOCK_MAC1_ALL] = {
> +		.name = "MAC1-ALL",
> +		.parent = CLOCK_250M,
> +		.offset = CLOCK1_OFFSET,
> +		.bit = 31,
> +	},
> +};
> +#define GATE_COUNT	ARRAY_SIZE(gate_init)
> +
> +static const struct reset_init reset_init[] = {
> +	[RESET_MAC0_MAC] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 7,
> +	},
> +	[RESET_PCIE] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 9,
> +	},
> +	[RESET_I2C] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 12,
> +	},
> +	[RESET_MSIGEN] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 18,
> +	},
> +	[RESET_MAC0_PMA] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 30,
> +	},
> +	[RESET_MAC0_XPCS] = {
> +		.offset = RESET0_OFFSET,
> +		.bit = 31,
> +	},
> +	[RESET_MAC1_MAC] = {
> +		.offset = RESET1_OFFSET,
> +		.bit = 7,
> +	},
> +	[RESET_MAC1_PMA] = {
> +		.offset = RESET1_OFFSET,
> +		.bit = 30,
> +	},
> +	[RESET_MAC1_XPCS] = {
> +		.offset = RESET1_OFFSET,
> +		.bit = 31,
> +	},
> +};
> +#define RESET_COUNT	ARRAY_SIZE(reset_init)
> +
> +/* Caller must free the returned pointer if non-null */
> +static const char *clock_name(struct device *dev, const char *name)
> +{
> +	return kasprintf(GFP_KERNEL, "%s-%s", dev_name(dev), name);
> +}

if you mean devm_kasprintf, it is possible but it means memory get wasted
for the lifetime of the device. CCF already copies this on init, so it
is useless after it.

That being said, it would be nice if the function name made it clear it
allocate something. tc9564_clk_name_alloc() maybe ?

> +
> +/* Initialize the PLL (parent is the input oscillator); called from probe */
> +static int pll_init(struct device *dev, struct tc9564_clock *clock)
> +{
> +	struct clk_hw *hw;
> +	const char *name;
> +
> +	/* Initialize the PLL clock first (input oscillator is parent) */
> +	name = clock_name(dev, "pll");
> +	if (!name)
> +		return -ENOMEM;
> +
> +	hw = devm_clk_hw_register_fixed_factor_index(dev, name, 0, 0, 50, 1);
> +	kfree(name);
> +	if (IS_ERR(hw))
> +		return dev_err_probe(dev, PTR_ERR(hw),
> +				     "failed to register pll\n");
> +
> +	clock->clk_data->hws[CLOCK_PLL] = hw;
> +
> +	return 0;
> +}
> +
> +/* Initialize the fixed rate clocks (PLL is parent); called from probe */
> +static int fixed_clock_init(struct device *dev, struct tc9564_clock *clock)
> +{
> +	struct clk_hw_onecell_data *clk_data = clock->clk_data;
> +	struct clk_hw *pll_hw = clk_data->hws[CLOCK_PLL];
> +	const char *name;
> +
> +	for (u32 i = 0; i < FIXED_COUNT; i++) {
> +		const struct fixed_init *init = &fixed_init[i];
> +		struct clk_hw *hw;
> +
> +		name = clock_name(dev, init->name);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, name,
> +								 pll_hw, 0,
> +								 1, init->div);
> +		kfree(name);
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register %s\n",
> +					     init->name);
> +
> +		clk_data->hws[FIXED_BASE + i] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Initialize the gate clocks; called from probe */
> +static int gate_clock_init(struct device *dev, struct tc9564_clock *clock)
> +{
> +	struct clk_hw_onecell_data *clk_data = clock->clk_data;
> +	struct clk_hw *parent_hw;
> +	const char *name;
> +
> +	for (u32 i = 0; i < GATE_COUNT; i++) {
> +		const struct gate_init *init = &gate_init[i];
> +		unsigned long flags;
> +		struct clk_hw *hw;
> +		void __iomem *reg;
> +		u32 parent_index;
> +
> +		name = clock_name(dev, init->name);
> +		if (!name)
> +			return -ENOMEM;
> +
> +		/* Each gate clock's parent is a fixed rate clock */
> +		parent_index = FIXED_BASE + init->parent;
> +		parent_hw = clk_data->hws[parent_index];
> +		flags = init->critical ? CLK_IS_CRITICAL : 0;
> +		reg = clock->ioaddr + init->offset;
> +
> +		hw = devm_clk_hw_register_gate_parent_hw(dev, name, parent_hw,
> +							 flags, reg, init->bit,
> +							 0, NULL);
> +		kfree(name);
> +		if (IS_ERR(hw))
> +			return dev_err_probe(dev, PTR_ERR(hw),
> +					     "failed to register %s\n",
> +					     init->name);
> +
> +		clk_data->hws[GATE_BASE + i] = hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static int reset_update(struct reset_controller_dev *rcdev,
> +			unsigned long id, bool assert)
> +{
> +	const struct reset_init *reset;
> +	struct tc9564_clock *clock;
> +	unsigned long flags;
> +	void __iomem *reg;
> +	u32 mask;
> +	u32 val;
> +
> +	/* Warn on any attempt to change state of a critical reset */
> +	if (WARN_ON(id == RESET_I2C) || WARN_ON(id == RESET_PCIE))
> +		return 0;
> +
> +	clock = dev_get_drvdata(rcdev->dev);
> +	reset = &reset_init[id];
> +	reg = clock->ioaddr + reset->offset;
> +	mask = BIT(reset->bit);
> +
> +	spin_lock_irqsave(&clock->lock, flags);
> +
> +	val = readl(reg);
> +	if (assert)
> +		val |= mask;
> +	else
> +		val &= ~mask;
> +	writel(val, reg);
> +
> +	spin_unlock_irqrestore(&clock->lock, flags);

look like you are re-implementing what regmap mmio provides here.

> +
> +	return 0;
> +}
> +
> +static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return reset_update(rcdev, id, true);
> +}
> +
> +static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	return reset_update(rcdev, id, false);
> +}
> +
> +static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
> +{
> +	struct tc9564_clock *clock = dev_get_drvdata(rcdev->dev);
> +	const struct reset_init *reset = &reset_init[id];
> +	void __iomem *reg;
> +
> +	reg = clock->ioaddr + reset->offset;
> +
> +	return readl(reg) & BIT(reset->bit) ? 1 : 0;
> +}
> +
> +static const struct reset_control_ops reset_control_ops = {
> +	.assert = reset_assert,
> +	.deassert = reset_deassert,
> +	.status = reset_status,
> +};
> +
> +static int tc9564_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *clk_data;
> +	struct reset_controller_dev *rcdev;
> +	struct tc9564_clock *clock;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np;
> +	int ret;
> +
> +	np = dev_of_node(dev);
> +	if (!np)
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	clock = devm_kzalloc_obj(dev, *clock);
> +	if (!clock)
> +		return -ENOMEM;
> +
> +	clock->ioaddr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(clock->ioaddr))
> +		return dev_err_probe(dev, PTR_ERR(clock->ioaddr),
> +				     "failed to map registers\n");
> +
> +	clk_data = devm_kzalloc_flex(dev, *clock->clk_data, hws,
> +				     CLOCK_COUNT);
> +	if (!clk_data)
> +		return -ENOMEM;
> +	clk_data->num = CLOCK_COUNT;
> +
> +	clock->clk_data = clk_data;
> +
> +	/* We need the driver data pointer to initialize clocks and resets */
> +	dev_set_drvdata(dev, clock);
> +
> +	/* Set up the clocks and register the provider */
> +	ret = pll_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret = fixed_clock_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret = gate_clock_init(dev, clock);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to add clock provider\n");
> +
> +	/* Set up and register the reset controller */
> +	rcdev = &clock->rcdev;
> +	rcdev->ops = &reset_control_ops;
> +	rcdev->owner = THIS_MODULE;
> +	rcdev->dev = dev;
> +	rcdev->of_node = np;
> +	rcdev->nr_resets = RESET_COUNT;
> +
> +	spin_lock_init(&clock->lock);
> +
> +	ret = devm_reset_controller_register(dev, rcdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register reset controller\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tc9564_clock_match[] = {
> +	{ .compatible = "toshiba,tc9564-clock", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tc9564_clock_match);
> +
> +static struct platform_driver tc9564_clk_driver = {
> +	.probe = tc9564_clk_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = tc9564_clock_match,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,

Why do you need to set this ? if you have a reason,
you should probably add a comment about it

-- 
Jerome

