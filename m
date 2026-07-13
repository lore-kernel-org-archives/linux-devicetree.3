Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D421640DFD5
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959954; cv=none; b=EM2JVpZpL4svm87NEzY9aN4J5gNRb1a2uOfTYmMfBEUES6CvXG2Md8wYvQCX0GsqbuRI4MF4s9l3Uct+vX+OSK+MfVNXav67D4j8X6aR10/i9tzbmDlxTtBxduYVeNYYPVmrrjH2GDBegzNcycp2+JdZkRklGzy1OTyiyI2TBjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959954; c=relaxed/simple;
	bh=GOoX3I4hotF/mhbriVQXW6tIxy+aIb7uKf7/REWVr8o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cfn501AVJAf978uUw4oWMffUCVk1WOwrRG1zrMP126hNFmVQF2BOarCeag2fwuykP2dhrO321cjHFURNFWEkkbo6+d0yXXD554EUN9tCwcmPaLHUI/NVeZbSHBaithvfdbEey22Ndhyutb+GGU8HGV2iPMxt7BANeCRJ4rgMagM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QypSqzo3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QypSqzo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6C31F000E9;
	Mon, 13 Jul 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783959952;
	bh=44oiwCbH52v9WBPZhOBKZAhe4bcTgCcc/JPoSO+/+GY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QypSqzo3/8XYF8GZSTue65ScNfmYyrQipW5vXZxrXV4T1foBMjpRgSd9pPuxYPFCi
	 usMtksCpn5FR6Yw6BlGkKu/jMl9cUhq+byukoveDG7kaqX6qdW2pJEbenS21UUxflX
	 N5VbK6WVq/OgQHPPkLaIWFS06t6UgPOxjlc0iYHTZhQiosQjydTQN3SQfI30Bg4Nbn
	 WlJOBRxRkzkAd1gpdyeaWlSMgAtTJuAjJF+XIua6USpA5pMIjp5cp4WdLrSXSq08Nh
	 lYcflk68Xrd1PoyUPGynfmqHOM9L3X6Ojj+AWKeBufuiwbz2Kc7idXWlJbxD90fY2m
	 iJx6moLgPuoKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260713155630.3054636-11-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-11-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 16:25:51 +0000
Message-Id: <20260713162552.2A6C31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Unused macros RTD1625_ISO_RSTN_MAX and RTD1625_ISO_S_RSTN_MAX are d=
efined in the clock driver.
--

--- Patch [10]: [PATCH v10 10/11] clk: realtek: Add RTD1625-ISO clock contr=
oller driver ---
commit c492e99cbe50d13329cfaeaed02f38be0c5245e8
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-ISO clock controller driver

This commit adds support for the ISO domain clock controller on the Realtek
RTD1625 SoC. It manages clocks in the always-on power domain and acts as a
parent device to register the shared reset controller as an auxiliary devic=
e.

> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/=
clk-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..07ff8b95db3e9
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_RSTN_MAX	29
> +#define RTD1625_ISO_S_CLK_MAX	5
> +#define RTD1625_ISO_S_RSTN_MAX	5

[Severity: Low]
This isn't a bug, but are the RTD1625_ISO_RSTN_MAX and RTD1625_ISO_S_RSTN_M=
AX
macros intended to be used in this file? They appear to be defined locally
here but are never referenced anywhere within the driver.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713155630.3054=
636-1-eleanor.lin@realtek.com?part=3D10
