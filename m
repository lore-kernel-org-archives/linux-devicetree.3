Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9D3A2549
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 20:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782678245; cv=none; b=GtMTglQFUQiCOW2lmEJa6swgWjahoMs+AnttFLGMRU+5Q6B9HZjDVZaImBbAfs8fCiJ8oeA+C/Kq5BIDrn2H7EQu6ackocUNZwAio4uInVvkQRmnlwPAucq7G2ShuoQxf67vFVDoxqgJjB5dCbzCl8smxC4KYlGsMC61hORrjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782678245; c=relaxed/simple;
	bh=J+EtlgeQFHl/nWsWbKn3kXmKZUyGn9tY50hcIYk5nVQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rdMEfUrG0ysZk82GjYu/tMHwa8yw5X4Xi5e0Z/BhtAuWGzMC7lVzlosg1VgFhhB6IxSO9VajJLSAaibUaag15oBWJkcKobXXI+OdQeJbcdKiNJ9MDrtVVfqbZlii0jmY1fvgkTKWwRQxI/oAVkM+TAA3fyxIIXe6sK+THdx7gII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616361F000E9;
	Sun, 28 Jun 2026 20:24:04 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 11/12] reset: zte: Add a zx297520v3 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628-zx29clk-v5-11-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
 <20260628-zx29clk-v5-11-79ff044e4192@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 20:23:55 +0000
Message-Id: <20260628202404.616361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing `MODULE_ALIAS` for the platform drivers prevents module =
autoloading if the auxiliary device is not present.
- [Medium] The Kconfig entry `RESET_ZTE_ZX297520V3` fails to `select MFD_SY=
SCON` or `depends on MFD_SYSCON`.
- [Low] The driver is missing the `#include <linux/module.h>` header, leadi=
ng to a build failure.
--

commit 2568a484547168ba23bd6f47affd8cc3aa186393
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

reset: zte: Add a zx297520v3 reset driver

This commit adds a reset driver for ZTE zx297520v3 SoCs. It registers two
platform drivers and one auxiliary driver to handle resets across different
hardware blocks.

> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3b..116dd23f1b8e3 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
[ ... ]
> @@ -404,6 +404,17 @@ config RESET_UNIPHIER_GLUE
>  	  on UniPhier SoCs. Say Y if you want to control reset signals
>  	  provided by the glue layer.
> =20
> +config RESET_ZTE_ZX297520V3
> +	tristate "ZTE zx297520v3 Reset Driver"
> +	depends on (ARCH_ZTE || COMPILE_TEST)
> +	default CLK_ZTE_ZX297520V3
> +	select AUXILIARY_BUS

[Severity: Medium]
Since this driver uses device_node_to_regmap() to acquire the parent syscon
regmap, should this config also select or depend on MFD_SYSCON?=20

If MFD_SYSCON is disabled, device_node_to_regmap() acts as a stub returning
-ENOTSUPP, which will cause the reset driver to unconditionally fail to pro=
be.

> +	help
> +	  This enables the reset controller for ZTE zx297520v3 SoCs. The reset
> +	  controller is part of the clock controller on this SoC. This driver
> +	  operates on an auxiliary device exposed by the clock driver. Enable
> +	  this driver if you plan to boot the kernel on a zx297520v3 based SoC.
> +
>  config RESET_ZYNQ
>  	bool "ZYNQ Reset Driver" if COMPILE_TEST
>  	default ARCH_ZYNQ

> diff --git a/drivers/reset/reset-zte-zx297520v3.c b/drivers/reset/reset-z=
te-zx297520v3.c
> new file mode 100644
> index 0000000000000..8ef4349042308
> --- /dev/null
> +++ b/drivers/reset/reset-zte-zx297520v3.c
[ ... ]
> +static struct platform_driver * const reset_zx297520v3_mfddrv[] =3D {
> +	&reset_zx297520v3_top,
> +	&reset_zx297520v3_matrix,
> +};

[Severity: Medium]
Since these platform drivers do not have an .of_match_table and match purel=
y by
name, do they need explicit MODULE_ALIAS declarations (such as
MODULE_ALIAS("platform:zx297520v3-toprst")) for proper udev module autoload=
ing?

Without these aliases, the module might only autoload when the auxiliary de=
vice
appears, creating a dependency on the LSP clock driver being loaded first.

[ ... ]
> +static void __exit reset_zx297520v3_exit(void)
> +{
> +	platform_unregister_drivers(reset_zx297520v3_mfddrv,
> +				    ARRAY_SIZE(reset_zx297520v3_mfddrv));
> +	auxiliary_driver_unregister(&reset_zx297520v3_auxdrv);
> +}
> +
> +module_init(reset_zx297520v3_init);
> +module_exit(reset_zx297520v3_exit);

[Severity: Low]
Does this file need to include <linux/module.h>?=20

Without it, building this as a loadable module could fail because macros li=
ke
module_init, module_exit, MODULE_AUTHOR, and MODULE_DESCRIPTION are not
provided by the other included headers.

> +
> +MODULE_AUTHOR("Stefan D=C3=B6singer <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx297520v3 reset driver");
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628-zx29clk-v5=
-0-79ff044e4192@gmail.com?part=3D11
