Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848377;
	b=5oSEVETM3lD2bfPNgPq5Ft8sWMKzQTmSYKvkdT5VpuhLq0DuM61G/EyeV4JpjQd8alHX
	 5d92IvuXwt3K+WhukbzqrrvlxKnc4iL6JXpEe/ejTxp2zrvzMYLLV64Yd8Z5ktp294C9v
	 C7SM3frJGYy7HJ1ggnBow3D5ERVkWchgszCNfOxwgPpg3Vs8phKJB8rLCk0q4riHSMzTv
	 ELTl1FRn78CugPULP68+9J/jf9s1GCQQ4UFjcoEDUr7CfkC+eCPWnJGIOlQ/qhFZkSbhx
	 NPltd0xk2DujKKEnHvlWL/+MKGybfhMCqxKEYZWF4StmYEdltrt6EmRBnG9WNerXx3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848377;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=G80dKLQ3Xyraqq/WUX9/h87Qh2PkX2L1x3rSlfqu64A=;
	b=VB05JsXAcpb6rolTM51rOojpkF4WSYMDnuJMZjZw1Ybf0JHhamKfkQPnmZpOps0APrs7
	 +Ro78ECB3EOerTlb0Xr3NL/qtcJ3ZO0cM1Er8oheshH25ddlFDP8qTEzpv6cSIh/Pg+5A
	 qnjnCw/Mc7J8nYP/EDWLlfxV5fXFW4YPn1Gu7ox60pPR+NRbuDjTNDDTC5bOauFk/7LyY
	 F72tFMcA1vhZr9TMHiHjK4iTZ5F47tMTQHlsle+E287DOS+/97pHmJ1uAu5rYbMqtS2am
	 I/EfOXYyoHdl7ZKHOCbBMJdn23cRa5rrV11nbHvnSIV81iIf1O6zRUMMzIPbzyUK1AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dn3TZ55N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D993F606A32C
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dn3TZ55N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4581F000CB;
	Mon, 16 Nov 2026 16:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794848377;
	bh=G80dKLQ3Xyraqq/WUX9/h87Qh2PkX2L1x3rSlfqu64A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dn3TZ55Nhs3JQPcyrKGcd/a53AozwZg4zXcbXv3rJrfE2WM8GkWfY0NUDqLEIVbeP
	 xZl6YuD6jQ3uHUW9+aEwS7pQMX1eTc7zmu+JpKh61yoaW/PjKUunfn31au8KE85m1q
	 +41JY3Pin89BpM+TLAlEIoOLMZEr2mz/qiM610dDHXFZQwoGFANyAljA5W57x93S8f
	 f0fg0f+e3WELoxYiz6wl1726OubCwhPbBilW8AzToG/4DzbSElcblDCcHuSHG54G18
	 I08j5PZqlBuoVFTzNOcdzZaSLp8WTz67j0oRCL4vVTBqQ6KqQ7h1Zd48/KkvALpL7x
	 wJahkvHVfuXzg==
Message-ID: <sashiko-outbox-217402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] iio: frequency: ad9910: add axi backend driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116-ad9910-backend-support-v4-8-fcf1ad364ed5@analog.com>
References: <20261116-ad9910-backend-support-v4-0-fcf1ad364ed5@analog.com>
 <20261116-ad9910-backend-support-v4-8-fcf1ad364ed5@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 16:59:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] iio: frequency: ad9910-axi-backend: unused macros and header
  mismatches
--

commit 5ec2dabb89fd1341c316c4a5ab1227cec04b62b8
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add axi backend driver

This commit adds the IIO backend and PWM driver for the Analog Devices
AD9910 AXI IP core to control the parallel data port, profile pins, and
DRCTL pin.

> diff --git a/drivers/iio/frequency/ad9910-axi-backend.c b/drivers/iio/fre=
quency/ad9910-axi-backend.c
> new file mode 100644
> index 0000000000000..57ab10c039072
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910-axi-backend.c
> @@ -0,0 +1,555 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AD9910 AXI Backend driver
> + *
> + * Copyright 2026 Analog Devices Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#include <linux/iio/backend.h>
> +#include <linux/iio/buffer-dmaengine.h>
> +#include <linux/iio/buffer.h>
> +#include <linux/iio/iio.h>
> +
> +#include "ad9910.h"
> +
> +/* Register addresses */
> +#define AD9910_AXI_REG_RESET		0x040
> +#define AD9910_AXI_REG_DRG		0x084
> +#define AD9910_AXI_REG_PROFILE		0x088
> +#define AD9910_AXI_REG_DRCTL_PERIOD	0x08C
> +#define AD9910_AXI_REG_DRCTL_WIDTH	0x090
> +#define AD9910_AXI_REG_DRCTL_DELAY	0x094
> +#define AD9910_AXI_REG_BURST_COUNT	0x098
> +#define AD9910_AXI_REG_BURST_DELAY	0x09C
> +#define AD9910_AXI_REG_RAMP_CFG		0x0A0
> +
> +#define AD9910_AXI_REG_UPDATE_CTRL	0x104
> +#define AD9910_AXI_REG_PAR_RATE		0x108
> +#define AD9910_AXI_REG_F_CFG		0x10C
> +
> +#define AD9910_AXI_REG_RESET_CORE_MSK		BIT(0)
> +
> +#define AD9910_AXI_REG_DRG_DRCTL_MSK		BIT(2)
> +#define AD9910_AXI_REG_DRG_TOGGLE_EN_MSK	BIT(3)
> +
> +#define AD9910_AXI_REG_RAMP_CFG_ONE_SHOT_MSK	GENMASK(1, 0)
> +#define AD9910_AXI_REG_BURST_COUNT_MSK		GENMASK(19, 0)
> +
> +#define AD9910_AXI_REG_UPDATE_RATE_MSK		BIT(0)
> +#define AD9910_AXI_REG_UPDATE_PAR_IF_EN_MSK	BIT(1)
> +#define AD9910_AXI_REG_UPDATE_EXT_TRIG_MSK	BIT(2)
> +
> +#define AD9910_AXI_REG_PROFILE_MSK		GENMASK(2, 0)
> +#define AD9910_AXI_REG_IO_UPDATE_MSK		BIT(0)
> +#define AD9910_AXI_REG_F_CFG_MSK		GENMASK(1, 0)
> +
> +#define AD9910_AXI_F_CFG_AMP			0
> +#define AD9910_AXI_F_CFG_PHASE			1
> +#define AD9910_AXI_F_CFG_FREQ			2
> +#define AD9910_AXI_F_CFG_POLAR			3
> +
> +#define AD9910_AXI_PD_CLK_MAX_FREQ_HZ		(250ULL * HZ_PER_MHZ)
> +#define AD9910_AXI_PAR_RATE_MAX			U16_MAX
> +#define AD9910_AXI_ONE_SHOT_BURST		1

[Severity: Low]
This isn't a bug, but several macros here are unused:
AD9910_AXI_REG_BURST_COUNT, AD9910_AXI_REG_BURST_DELAY,
AD9910_AXI_REG_RAMP_CFG, AD9910_AXI_REG_DRG_DRCTL_MSK,
AD9910_AXI_REG_RAMP_CFG_ONE_SHOT_MSK, AD9910_AXI_REG_BURST_COUNT_MSK,
AD9910_AXI_REG_UPDATE_EXT_TRIG_MSK, AD9910_AXI_REG_IO_UPDATE_MSK, and
AD9910_AXI_ONE_SHOT_BURST.

Also, linux/kstrtox.h is included without being used, while linux/math64.h
(for mul_u64_u64_div_u64(), mul_u64_u64_div_u64_roundup(),
DIV64_U64_ROUND_CLOSEST(), and div64_u64()) and linux/minmax.h (for min()
and clamp()) are relied on transitively instead of being included directly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-ad9910-bac=
kend-support-v4-0-fcf1ad364ed5@analog.com?part=3D8
