Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2879191F91
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 20:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778618850; cv=none; b=HaUKS7kwWsZGimh2LSU2sgfk3yg2Mj3Jgmp0aT5JqI7M8wq3cTS4m1NnQx0sU4jef9FEOjCMonPH/eKkGK9BWsy1I9kN7iDVqI296LV4u6VQuyequgok/i17oQ4B3X6mRYIQmRRNabhftjvUezNk0H7RTMj0+MADJGaSsH3L2bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778618850; c=relaxed/simple;
	bh=0P47dj6Kig4/r06fTk2XxwskZC3f8j1AKToRYMAX9Zw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TA3dhgrgP4Pyy1nDGRY4sX3Sk1H0wECN0T8HvcPZD3NX7vS3aEcreTkUe60tsx4q0E4bKxzUdmg46xUMKDJohQHdefnx/Bp/7NKURoOgmXvirS3XxkpnEMS5sF95PCWOoMSePga0gj6y2yV5yxZiRnIFDsKmy5w3/YtNbDEmrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ToRvTC1z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ToRvTC1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18425C2BCB0;
	Tue, 12 May 2026 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778618850;
	bh=0P47dj6Kig4/r06fTk2XxwskZC3f8j1AKToRYMAX9Zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ToRvTC1zSB8nV+ycbwqNTVEE5/QNdGdNya+ZrVexSJWDfHdCaOPcUDVACZ2umO+Zk
	 KB2q5yXhxTcbnaxqexST9/ZY/pqQbJ0OZV9xm7Bqe81npfEuCNz3oqF6NoXglxlYbh
	 pxGQPYvcBOfAMd2IIVMfv06FUbt4yRhVunTggcoDWZtYFxEvikJ5q5TcGmFpi74rVt
	 8Lq8okxy8oYPEihdEeIGRX802LiBOopoa3Lnvf1KZLpWVwVALQOg1gcpdkJ6vHjws0
	 +6SDsr3Hqsho6m+Q686Ve3hDOHubEIRkgMUDh/MhG/WHlXD7FDnoZGDQAR3TNqKjs7
	 gRFDu8yB7z+qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/10] clk: amlogic: Add A9 AO clock controller driver
Reply-To: sashiko@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 20:47:29 +0000
Message-Id: <20260512204730.18425C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The clock gate for `ao_pwm_b` incorrectly writes to the `AO_PWM_CL=
K_A_CTRL` register instead of `AO_PWM_CLK_B_CTRL`.
- [Low] Typographical errors and naming mismatches in clock names (i2c3 ins=
tead of i3c, and duandiv instead of dualdiv).
- [Low] Missing explicit inclusion of `<linux/module.h>` for module macros.
--

commit e37e299a2bc904562b2a27fa6a1542c7920a030a
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 AO clock controller driver

This commit introduces the Always-on clock controller driver for the Amlogic
A9 SoC family. It adds the clock definitions and registers the platform
driver for the A9 AO clocks.

> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 0000000000000..3c42eaf585d21
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c
> @@ -0,0 +1,494 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "meson-clkc-utils.h"

This isn't a bug, but should <linux/module.h> be explicitly included here?
The driver uses MODULE_DESCRIPTION, MODULE_AUTHOR, MODULE_LICENSE,
MODULE_IMPORT_NS, and MODULE_DEVICE_TABLE macros, which rely on this header.

[ ... ]

> +static A9_AO_PCLK(i2c3,		0,	0);

This isn't a bug, but should this be named i3c instead of i2c3?
This is later mapped to the CLKID_AO_SYS_I3C enum, so the dt-bindings and
the hardware clock name appear to be mismatched.

[ ... ]

> +static A9_COMP_SEL(ao_pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parent=
s);
> +static A9_COMP_DIV(ao_pwm_b, AO_PWM_CLK_B_CTRL, 0, 8);
> +static A9_COMP_GATE(ao_pwm_b, AO_PWM_CLK_A_CTRL, 8);

Could the gate for ao_pwm_b be incorrectly writing to AO_PWM_CLK_A_CTRL
instead of AO_PWM_CLK_B_CTRL?

If so, toggling the ao_pwm_b clock will modify the gate bit for ao_pwm_a,
which could cause uncoordinated toggling of the ao_pwm_a hardware state
and fail to actually control the ao_pwm_b clock.

[ ... ]

> +static struct clk_regmap a9_ao_rtc_dualdiv_in =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx =3D 31,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "ao_rtc_duandiv_in",

This isn't a bug, but is there a typo in the clock name "ao_rtc_duandiv_in"?
It looks like it should be "ao_rtc_dualdiv_in".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-b4-a9_clk-=
v1-0-41cb4071b7c9@amlogic.com?part=3D10
