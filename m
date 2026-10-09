Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD077136672
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568429; cv=none; b=HNv/JX1Kf0WsDe4Y/1OuhaSoC18tcExUy/04bJxaMtCH4DUiUW7YIhDq2EvpI0DU/JmeEgj9blzqV+nNAc4o+BqsHzgICdMsV4Ewn+stWb50bjB2y3/ttuyJ0js435BMuqqjXr4sZYFQ6iFcSruGkXIdtzFKodPXQcgV0vVCbk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568429; c=relaxed/simple;
	bh=61DI+M7JfCK16572qA3XEh8ctEVOYK3INMZFCMH+rLQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dQhrNtCSuZmQgn2tFCNzcAx0C+O99gH9iVU/LbrxpzhY804VMS74zWTlMQmoRQLPkObdfWiSDf0ELQGK1St6Rq1cmaLsin5ekoP4JjkpBNrzXfEqeDtUYjuK9p4fL1lByvuVe3JxXNkXvOi6tc5auofPfz4dwMXZmXXdlv5VxZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxkUDiBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxkUDiBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E841F00898;
	Fri,  9 Oct 2026 17:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791568428;
	bh=maOeANmJfxQHydF160xOibnoHFrHeJwQmv/BDKU12Ho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OxkUDiBF/XlaZhZph+AIvsGOFDiL1693BNL4z3dYyGY5RFQ7FR+gKtjzqMMAnZ/1Q
	 hE9bINg80jLMbJx/DdwrxhA4aMpeYFn1moPos1LisMw7TCwl2qylALxKNtIYz9dqQ8
	 t/5PT0PTkaqk4z+qiHSUDyOpPCXkqeKez7iJXwdl7qrCG6cy6RBq763p2dxUPanWLv
	 q0Mtqmcj+2cMMxXrwlOGKUIePmJ7/xgUWbVSLEPJZm8l3Iarck1efmqGRMjKd3w4+p
	 UOBxm5ItkYv2STbZWHuSEfTUqQKsK45jmm4QJlHivfwuiwr51yPzhATefQmSTl+JXn
	 CdvIJYrzeSqEQ==
Message-ID: <sashiko-outbox-165905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v11 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008175225.3375274-4-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
 <20261008175225.3375274-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 17:53:47 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] pm: PD_PIPE powers off on suspend breaking MAC WoL
- [Medium] pm: missing pm_runtime_disable() on driver unbind
- [Medium] pm: missing pm_runtime_disable() on driver unbind
- [Low] pm: unbalanced pm_runtime_enable() due to missing pm_runtime_disabl=
e()
--

commit 10f6065a84e9613f4b783ffc88353c7a176a3fcd
Author: Coia Prant <coiaprant@gmail.com>

    net: pcs: xpcs: add Rockchip RK3568 platform glue driver
   =20
    The RK3568 SoC integrates a Synopsys DesignWare XPCS that is accessed
    via APB3 memory-mapped registers.  This driver provides the glue logic
    to make the XPCS accessible to the generic pcs-xpcs core.

    Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
    Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20=
TRM%20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> index 0000000000000..698a43b753341
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static void xpcs_rk_exit_clk(void *data)
> +{
> +	struct dw_xpcs_rk *pxpcs =3D data;
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +
> +	pm_runtime_force_suspend(dev);
> +	clk_disable_unprepare(pxpcs->eee_clk);
> +}
> +
> +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> +{
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +	unsigned long rate;
> +	u64 mult;
> +	int ret;
[ ... ]
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_enable(dev);
> +
> +	ret =3D devm_add_action_or_reset(dev, xpcs_rk_exit_clk, pxpcs);

[Severity: Medium]
Will this leave the pm runtime disable_depth unbalanced when the driver is
unbound?

The driver calls pm_runtime_enable() in xpcs_rk_init_clk(), but the teardown
action xpcs_rk_exit_clk() doesn't call pm_runtime_disable() to unwind it.
Leaving runtime PM enabled after the device is unbound breaks the runtime PM
core's tracking and can trigger an "Unbalanced pm_runtime_enable!" warning
if the device is probed again.

Should devm_pm_runtime_enable() be used, or pm_runtime_disable() be
added to the cleanup function?

[ ... ]
> +static int xpcs_rk_system_suspend(struct device *dev)
> +{
> +	/*
> +	 * Keep the PD_PIPE power domain on during system suspend.
> +	 *
> +	 * PD_PIPE is shared with SATA/PCIe and would be powered down by
> +	 * genpd once all its consumers are suspended, killing the SerDes
> +	 * and breaking MAC WoL.  Mark the XPCS as part of the wakeup path
> +	 * so genpd keeps the domain on.  Unconditional because the XPCS
> +	 * core has no callback to convey the MAC WoL state.
> +	 */
> +	device_set_wakeup_path(dev);

[Severity: Medium]
Does genpd actually keep the power domain on when device_set_wakeup_path()
is called here?

The commit message notes this relies on the Rockchip power domain driver
setting GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE. However, looking at
drivers/pmdomain/rockchip/pm-domains.c:

rk3568_pm_domains[] {
	...
	[RK3568_PD_PIPE] =3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),
	...
}

The wakeup parameter is false, which means GENPD_FLAG_ACTIVE_WAKEUP is not
set. Because this flag is missing, won't genpd ignore the wakeup path and
power off the domain anyway, breaking MAC WoL?

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008175225.3375=
274-1-coiaprant@gmail.com?part=3D3
