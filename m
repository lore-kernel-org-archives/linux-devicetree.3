Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939C832D0F5
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958901; cv=none; b=KHtuOIncEBj/Jj8Aa8a9yFv8uTRT/0RXO6Z/WzdfeWlbQRS78nWt4l/Dq+fk6C94V/UcW4tGfOtXbafCCT9cuGaQLCOU6YuP8kxBFyAlWNZQllcIeNBROrFZg6jtfh38pwbw0EiMKdgil4VwxEqXSRrDtoU7k089cYBYozzWCWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958901; c=relaxed/simple;
	bh=iUSzrCry9jLNIVCTjyFBTm+Ynq3XPhsdNVC5i0vG948=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bAAxi7IruNM9sthedUHeaWX7KM0Mr4xNz0dTx6U56N+2tCA73BMeuy9+FpqMizlhAd9wzVB+cn9xGwlu+ejH53v122UN6r+NQaXwux22ksBxRxK1FcFDhc9CTsX3Jv09oKVFdLR1+DXh6sFscx9TgFk0QaAye3Ng6FMgfiQcjbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kdf57cjS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kdf57cjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0594B1F000E9;
	Mon, 13 Jul 2026 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783958900;
	bh=CtnWfWnBdnUp4wmQc2uCUdnsMA4K1e3AqQQnD2k9fns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kdf57cjSN7CdKHhSdVv3UkzTAQS+HLVdR0ffdZp9sevxWqIi/UFlJJDY7m0uqVDsj
	 ZQMUb2/LO/7c1cZjswkF7pVTiadA9wQ1ICCRzW8LVwQ3xnTN/0FaBp7/EJa+8LXSS1
	 lMuNc+bgmxuyVZ/P9pS+r2EUTWBqoOlChiUteFlOU7QZ0+3emhQYWNwUdq0Lwlaf0p
	 adVyws1Adi+CfAiuwQyy1sqSN+CYsxEhQ6QzMmQlqD65DqHnXzRj/gkriwwqztLhcz
	 U6hbAmdTrizArHc5DFWcZ9z/benYlI/tspyL6tQBHXqowlsNWBuGKRtCL4OOwJd7MV
	 m2Xw5it5eM+ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 02/11] reset: Add Realtek basic reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713155630.3054636-3-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-3-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 16:08:19 +0000
Message-Id: <20260713160820.0594B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The Kconfig help text and commit message incorrectly claim the d=
river provides a registration helper function to extract the regmap and dev=
ice tree node.
- [Low] Unnecessary inclusion of `<linux/device.h>` and `<linux/of.h>`.
--

--- Patch [2]: [PATCH v10 02/11] reset: Add Realtek basic reset support ---
commit 231fee7f5cf687d120e12d9c11d120d53d5aa54d
Author: Cheng-Yu Lee <cylee12@realtek.com>

reset: Add Realtek basic reset support

This commit defines reset operations backed by a regmap-based register
interface for Realtek SoCs. It exports the reset control operations to allow
callers to manually assign their own reset controller data structures.

> reset: Add Realtek basic reset support
>=20
> Define the reset operations backed by a regmap-based register interface
> and prepare the reset controller to be registered through the reset
> framework.
>=20
> Since the reset controllers on Realtek SoCs often share the same register
> space with the clock controllers, this common framework is designed to
> extract the regmap and device tree node from the parent device
> (e.g., an auxiliary device parent).

[Severity: Medium]
Is this description still accurate?

The changelog notes that in v10, the wrapper function was removed to allow
callers to assign the regmap, ops, dev, and of_node individually. It seems =
the
common framework no longer extracts the regmap and device tree node from the
parent device.

[ ... ]

> diff --git a/drivers/reset/realtek/Kconfig b/drivers/reset/realtek/Kconfig
> new file mode 100644
> index 0000000000000..bb6dd856a64a5
> --- /dev/null
> +++ b/drivers/reset/realtek/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config RESET_RTK_COMMON
> +	tristate "Realtek common reset driver" if COMPILE_TEST
> +	help
> +	  This option enables the common reset controller library for
> +	  Realtek SoCs. It provides shared reset control operations
> +	  (assert, deassert, status) and a registration helper function
> +	  that other Realtek-specific reset drivers can use.

[Severity: Medium]
Should the Kconfig help text be updated to reflect the v10 changes?=20

It explicitly claims a registration helper function is provided, which appe=
ars
to no longer be true since rtk_reset_ops is exported directly instead.

[ ... ]

> diff --git a/drivers/reset/realtek/reset-rtk-common.c b/drivers/reset/rea=
ltek/reset-rtk-common.c
> new file mode 100644
> index 0000000000000..4d5ec2b0416d1
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtk-common.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019-2026 Realtek Semiconductor Corporation
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/of.h>

[Severity: Low]
Since the registration helper function was removed, are linux/device.h and
linux/of.h still necessary?=20

It looks like these headers were used to interact with struct device and
of_node, and could now be safely dropped.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713155630.3054=
636-1-eleanor.lin@realtek.com?part=3D2
