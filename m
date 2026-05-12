Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E75F3FD141
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565388; cv=none; b=dsPDZGRuAx3/sIUTWWc53bbym7ohquERgA4WG7cfd8xNPi4/fYTJlK3oP6cjxrAY7GW2c4YwTPntu83j8siJ3hyaYzWcUiSjpDp4LGWH77wPr7mzyCpy0Cyi+TWlGS6FrbGrdiZvrKAcYN5jbwKOalLPsY/wxOrcxFCkl1nE8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565388; c=relaxed/simple;
	bh=8XSvAjntl5wJYBeOU8/WWXxJ1LvuplOlWTRez0vYh5Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XmnODGmqKcBgvQUlxTvrA5JNKx2Yx2UjR785DfDkYF7ggnAR3d5k2OoTzDhEHSMqbox2iA/XxDDO5rxHGUeWeoCJnbswmfki8WXx/wxF/wpvl0rsx/Xc1RMswz4q9BcuQ07QMhu4GKd9vjP1ZvbIpWaPUr2C/B7Fv/JhLavrwhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJ/FlQ8H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJ/FlQ8H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82724C2BCB0;
	Tue, 12 May 2026 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778565385;
	bh=8XSvAjntl5wJYBeOU8/WWXxJ1LvuplOlWTRez0vYh5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TJ/FlQ8H8s5cZAp5JkqljM8XUIlB9feDO1FmrKjL6U0Jp4szce+7oOk59ATEladep
	 keNODLo5BYJO8ljqjb+LIebc1bnvOqU1naGg6rMlWL/C8Njyu8EH0HCN32IlTd4DFe
	 zv4wOLN8WW9ZNMtTl6+NJBrrT/pOmbJEk+TL3OEQPf171qGueGNjGxwa54LNdVvlSj
	 vTUVzWJkHl/FVRn6Wafh4x/Ry23Kfeit9el9OII5tB4QO5FUzrf2C0YUNBO25rYOmP
	 Hgb0o2lfvAM0eTao+k9GM+M68qOR3JWjxr3MsHzOxVMtB5lUBUfQlThmC0ePwNDxqU
	 XUFUGby8LcvnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] clk: amlogic: Add A9 PLL clock controller driver
Reply-To: sashiko@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
References: <20260511-b4-a9_clk-v1-8-41cb4071b7c9@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:56:24 +0000
Message-Id: <20260512055625.82724C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The new driver file `drivers/clk/meson/a9-pll.c` uses module-specif=
ic macros but fails to include `<linux/module.h>`.
--

commit 497c46fd6ed69111b1539ecfa46cd63980fab5e1
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 PLL clock controller driver

This commit adds the PLL clock controller driver for the Amlogic A9 SoC
family.

> diff --git a/drivers/clk/meson/a9-pll.c b/drivers/clk/meson/a9-pll.c
> new file mode 100644
> index 0000000000000..84b591c3afff5
> --- /dev/null
> +++ b/drivers/clk/meson/a9-pll.c
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-pll-clkc.h>
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "meson-clkc-utils.h"

[ ... ]

> +MODULE_DEVICE_TABLE(of, a9_pll_clkc_match_table);
> +
> +static struct platform_driver a9_pll_clkc_driver =3D {
> +	.probe		=3D meson_clkc_mmio_probe,
> +	.driver		=3D {
> +		.name	=3D "a9-pll-clkc",
> +		.of_match_table =3D a9_pll_clkc_match_table,
> +	},
> +};
> +module_platform_driver(a9_pll_clkc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic A9 PLL Clock Controller Driver");
> +MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("CLK_MESON");

Should linux/module.h be included in this file since it uses several
module-specific macros?

Relying on implicit inclusion via other headers like linux/platform_device.h
can sometimes lead to build failures on different architectures or in future
kernel versions if header dependencies change.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-b4-a9_clk-=
v1-0-41cb4071b7c9@amlogic.com?part=3D8
