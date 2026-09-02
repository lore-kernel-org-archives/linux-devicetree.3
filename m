Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93F4756BC
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361483; cv=none; b=WG29G+VOabsNeazZNm59QEaKw3fUsouoPcV2zxK36iDRSAnZIQWFMmIyGxxmZPT2LSIdVY5EdIX/0Hi8F6CIuNkKdY2o/CjTm/86BUXurAOCrEo9NmYPxlX4qd2iAPxGPLmK5m1wRNqsPfvTvt8gWy8JQctv0j8GFB8wWgpoJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361483; c=relaxed/simple;
	bh=i8b2ZXycbfI7qdPyjjksQq660vaX0USUrVtV7VtYXv0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6/qCRy0GI+0lm0SiyyqFyDE3kIuNhBilC3RZSx+D85XA0doss2MkS6AHVeza6YaHdyvCGI/W0UZCt9qmb1JtZv3Khl6xNBCT/mxmREKwsmfPuJLEPqLs3CVftDD8QMJszWHEwzkUXmA9YELUkNvV2OMD+RrpMiTH4f49Cw9djA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVp2tHeL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVp2tHeL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D631F00A3D;
	Wed,  2 Sep 2026 15:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788361480;
	bh=NrEaz8Hs37xTwtroVZTY6Rcu69Y35SJeCNKFrozoP70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVp2tHeL0cbIel3ysGxML7/ZtagND1/g9KqNeCV42bJ9XTbDBc7mbO5yU2+bsvaPa
	 uYzaksXOiqOV0RTQheqk/ZDXjG3c2aiODnkSBJoW/fXUpz3+zfUCl3Dwb6bj8WGIOl
	 thH4cnHNmNBtO9XHeO4BAqhP1MCkYW3/IZ4AlszYK6E+eFQbLkI9OwwggKObfIjpJ9
	 lLYcwaad7hlRwakzlXWG7AdHsvGM/qBSvLo0z7qiQvg0Bizzhu05mQKhnnSf2qY6Hl
	 aZxHIHk2Rav02Fz+D+4PWXlR/nenEu49hG9x25Kd/YqCo4jE4YuJ8MjQWoB2AQ9qIm
	 cnchodNhbQVXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260901150111.141037-8-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:04:40 +0000
Message-Id: <20260902150440.78D631F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware clock gated while MDIO bus is still active, leading to SE=
rror panic
- [High] TOCTOU race in xpcs_rk_create() allows use-after-free of MDIO bus
- [High] Missing PM dependency causes SError crash when CONFIG_PM is disabl=
ed
- [High] Unbalanced pm_runtime_disable() depth permanently breaks device on=
 rebind
- [Low] Build failure due to split composite module when CONFIG_PCS_XPCS=3Dm
--

commit 813e502fc8133a43782c6cdc92f677a818bf8605
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver
   =20
The RK3568 SoC integrates a Synopsys DesignWare XPCS accessed via APB3
memory-mapped registers. This driver provides the glue logic to make the
XPCS accessible to the generic pcs-xpcs core.
   =20
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf

> diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> --- a/drivers/net/pcs/Kconfig
> +++ b/drivers/net/pcs/Kconfig
> @@ -12,6 +12,29 @@ config PCS_XPCS
[ ... ]
> +config PCS_XPCS_ROCKCHIP
> +	tristate "Rockchip XPCS controller support"
> +	default ARCH_ROCKCHIP
> +	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)

[Severity: High]
Is this missing a PM dependency?

If the kernel is built with CONFIG_PM disabled, pm_runtime_resume_and_get()
returns 0 without enabling the hardware clock. This could lead to a
synchronous external abort (SError) when the unclocked APB registers are
subsequently accessed in xpcs_rk_read_reg().

> diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> --- a/drivers/net/pcs/Makefile
> +++ b/drivers/net/pcs/Makefile
> @@ -1,10 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux PCS drivers
> =20
> -pcs_xpcs-$(CONFIG_PCS_XPCS)	:=3D pcs-xpcs.o pcs-xpcs-plat.o \
> -				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
> -
> -obj-$(CONFIG_PCS_XPCS)		+=3D pcs_xpcs.o
> +obj-$(CONFIG_PCS_XPCS) +=3D pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o

[Severity: Low]
Does this syntax create separate modules instead of a composite module?

Because pcs-xpcs.c references functions like nxp_sja1105_sgmii_pma_config
defined in pcs-xpcs-nxp.c without EXPORT_SYMBOL being present, creating
separate modules will break symbol resolution and cause modpost linkage
failures when CONFIG_PCS_XPCS=3Dm.

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{
[ ... ]
> +	pm_runtime_set_suspended(dev);
> +	ret =3D devm_pm_runtime_enable(dev);

[Severity: High]
This devm action schedules pm_runtime_disable() to run during devres
cleanup on device removal.

[ ... ]
> +static void xpcs_rk_remove(struct platform_device *pdev)
> +{
[ ... ]
> +	pm_runtime_force_suspend(&pdev->dev);
> +}

[Severity: High]
Will calling pm_runtime_force_suspend() here cause an unbalanced disable
depth?

Since pm_runtime_force_suspend() internally calls pm_runtime_disable(), the
disable depth is incremented twice during removal (once here, and once
during the devres cleanup). When the driver is rebound, it will only be
decremented once, leaving the depth at 1 and permanently breaking runtime
PM hardware access.

[Severity: High]
Can a concurrent sysfs MDIO access race with xpcs_rk_remove() and crash the
system?

Because the MDIO bus is registered with devm_mdiobus_register(), it remains
active and accessible until devres cleanup runs after xpcs_rk_remove()
returns. Calling pm_runtime_force_suspend() gates the hardware clock while
the MDIO bus is still exposed to userspace. A concurrent sysfs read could
increment the usage counter, call into xpcs_rk_read_reg(), and execute
readl() on unclocked hardware, triggering an SError panic.

[ ... ]
> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
[ ... ]
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> +	device_unlock(&pdev->dev);
> +	if (IS_ERR(xpcs)) {
> +		put_device(&pdev->dev);
> +		return xpcs;
> +	}
> +
> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {

[Severity: High]
Is there a race window between device_unlock() and device_link_add()?

If a concurrent unbind of the supplier proceeds after the lock is dropped
but before device_link_add() creates the dependency, the devm-managed
pxpcs->bus could be torn down and freed. This would allow the MAC driver
to continue probing with a freed MDIO bus, leading to a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901150111.1410=
37-1-coiaprant@gmail.com?part=3D7
