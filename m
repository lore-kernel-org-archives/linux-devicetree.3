Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472620;
	b=vpQaRdKgC3A8tXVcklmOLYE84y4qwBBz50MZlRdRokYWYyM+uel6f8JMRnMb4yw3ZX3T
	 Mt5y9b9IjpyqDJReOxLedXvtA67cu9MmkJ6r74IfruLqTiE9+xn97bOOzrfw9xz82TWXO
	 H2ErO7SdgUakjUIrnKZKXmxGq+tuUQo8f1pxaM87MCWpuoyLqvurD0YudUdXiu41nQ1yK
	 BSCkKzCXCBoq+SdM42GOAGPbzZHPLnrCsWB+jcG+qGc/iyhEq+RGyH0KtPDQHC9LK5lY7
	 3GMVqTO+HglCjqbR7uwxuy7wx0aqNOSNo4loq3Yirut4aB4VgAQLf74WP++GAlkJynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YXHqOryuidxv02mpyk/1A4ti1DhM30+Va3Q5wSxSv0k=;
	b=k7IRdIflEfYVnCtFdql9mnl0dk57EdGnFmcomtvzq/zOFre393tSR8qg/CRfE9hQdvTk
	 CzP6U1eW97eKw5mTZK5jiHeQ+psn47dPAIN3xpcsVh9O0Fux30o8MV9EmnXtUz6NKHh9p
	 E40wZdFsT6T02HH438fnqMQTu1w/QkYr8ZMQHJL0R9pbLw3mGbK5Y3ffQu+KMR3HOmvK6
	 GiUF6MoMR3+Sm3ML4HoU6zfIByJyBgee2ewV2D5wzDdHPbZfJMZuyTuIMYR5T7OIVvzz2
	 RO6LeeElZPGRgDXVIoVYXyyhdpIP2Ppx/UZbVSUHy3wukoxD5XvoYV6b1OXaUcEEZtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1VeOnHZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC83606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l1VeOnHZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC8E1F00A05;
	Thu, 12 Nov 2026 08:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472620;
	bh=YXHqOryuidxv02mpyk/1A4ti1DhM30+Va3Q5wSxSv0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l1VeOnHZm3WvZ5WErUIIlGkmBPvo+Dhbtq30NW1sOiqo28QV0F9zzuXddTizMnAFl
	 egKz99PuPJLhtILe1Wn1E1SUYI5S7AegygpGhuy2RbCNluIRxhEhSxzLTlZkLdVXBa
	 DT1jTG7cXXg5i+MxKwmG0yUjjy7K3xBWHQfUs7o8lkRvuly6M28XUrY8qCdr6n8zMu
	 OpOA33zyuoyop5+yVU/1ApEaD01eaYjFo06OzdTr7feuXx6VEWsCwIyjrBjs33duak
	 vEr2XKIhY4XE6DYGGuBbjy0GKzP6J0PJiI+tiIApcHA70Kli6QPIe9IAj6UE/xKQ1w
	 ZLMvV+WUSGicw==
Message-ID: <sashiko-outbox-210748@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] soc: ti: Add TDA54 SCM configuration syscon
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Moteen Shah" <m-shah@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112081047.1550471-5-m-shah@ti.com>
References: <20261112081047.1550471-1-m-shah@ti.com>
 <20261112081047.1550471-5-m-shah@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 08:36:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] soc: ti: missing linux/soc/ti/k3-socinfo.h breaks build in
  tda54-mcu-sysconf.c
- [High] soc: ti: use-after-free on module unload in
  tda54_scm_conf_probe()
--

commit 1413c74caebaef4be4a2098e4a72bde6c5e8dc93
Author: Moteen Shah <m-shah@ti.com>

soc: ti: Add TDA54 SCM configuration syscon support

This commit adds the TDA54 SCM configuration syscon driver to provide
proxy-based regmap access to the SCM register space and register TDA54
SoC identification information via k3-socinfo.

> diff --git a/drivers/soc/ti/tda54-mcu-sysconf.c b/drivers/soc/ti/tda54-mc=
u-sysconf.c
> new file mode 100644
> index 0000000000000..3ef82e737d095
> --- /dev/null
> +++ b/drivers/soc/ti/tda54-mcu-sysconf.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TDA54 SCM Configuration syscon driver
> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.co=
m/
> + */
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/soc/ti/k3-socinfo.h>

[Severity: High]
Was include/linux/soc/ti/k3-socinfo.h omitted from earlier commit
"soc: ti: k3-socinfo: Export SoC registration helper"?  Because that
header is not in the tree and k3_socinfo_register() has no prototype,
building with CONFIG_TI_TDA54_MCU_SYSCONF or CONFIG_TI_K3_SOCINFO enabled
fails.

[ ... ]

> +	regmap =3D devm_regmap_init(dev, NULL, scm, &tda54_scm_conf_regmap_cfg);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	writel(TDA54_SCM_CONF_LOCK_KICK0_UNLOCK_VAL, scm->base + scm->pdata->lo=
ck_offset);
> +	writel(TDA54_SCM_CONF_LOCK_KICK1_UNLOCK_VAL, scm->base + scm->pdata->lo=
ck_offset + 4);
> +
> +	/*
> +	 * There is no way to unregister a syscon regmap, so publish it only
> +	 * once nothing else in probe can fail.
> +	 */
> +	ret =3D of_syscon_register_regmap(dev->of_node, regmap);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register syscon regmap\n");

[ ... ]

> +static struct platform_driver tda54_scm_conf_driver =3D {
> +	.probe =3D tda54_scm_conf_probe,
> +	.driver =3D {
> +		.name =3D "k3-tda54-scm-conf",
> +		.of_match_table =3D tda54_scm_conf_of_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};
> +
> +module_platform_driver(tda54_scm_conf_driver);

[Severity: High]
As reported by Andrew Davis on v1 [1], can unloading this module cause a
use-after-free when consumers access the syscon regmap?

TI_TDA54_MCU_SYSCONF is tristate (default m on ARCH_K3) and
module_platform_driver() generates a module_exit callback, while
.suppress_bind_attrs only removes the sysfs bind/unbind files.  Unloading
the module unbinds the device, frees the devm-managed regmap, ioremap, and
scm context, and unmaps the regmap read/write callbacks, while the global
syscon_list in drivers/mfd/syscon.c retains a dangling pointer to regmap
(and any later reload fails in of_syscon_register_regmap() with -EEXIST).
Registering the driver with builtin_platform_driver() (or module_init()
without module_exit()) keeps the module loadable while preventing unload.

[1] https://lore.kernel.org/r/b5bc4c10-b364-4992-ae84-63e5b86771a3@ti.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112081047.1550=
471-1-m-shah@ti.com?part=3D4
