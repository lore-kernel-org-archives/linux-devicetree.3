Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52431F8AC5
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785680737; cv=none; b=YztUkQn2WmAJa+OfpOMI13mJariqWUtMVuxxBGGUy9GGbqHf21yRMWkUUPg1EFzQqw9H2mMDw6Qq1agUtZ0FFLVV25K5ZANFP+m+8Pi7RyzZUmfKmlMtU0fRYHzoyQngKj0HVQRJBVxmwJHAjPJ9cQxrkK0F8pS5nw6P+ZhCZZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785680737; c=relaxed/simple;
	bh=u0NTwD5MqxPalwMPDH171voAEUuyRjBAUalaep7EXq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZIED3Wftd+sH+/ed22gPf7egCvAdd0pu6wBPSwwVWHBaSyAO9GH0Kn99jyowgomT2YhYFu+VPyFZ9vdthP3vBwSAii+eCwWxvyKWnHniyEW74jz1IJgOmagKYCBgRCQXZ8a41DdDfOY6BxTRxtrM21wHAPYRbfU7wpiXiQEUpP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFjJMjIq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFjJMjIq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14121F000E9;
	Sun,  2 Aug 2026 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785680735;
	bh=7U+9CVIPfdnYKjuhz32hd6acQkghvjuZiPmvNN09sQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WFjJMjIqUUCbomYs7SXjj9AZUx67das+WxhXDmtSC1jO5EpL7c12Rk3XM8RzJSdWf
	 PzCUJypP+xUieF5BNGDXly948rdMrwgrMwdl9m6nTQk+ISISyntw+vvDo2tiPrEORl
	 PgWbcZVAC8k785HfN4gLOhcrBRwTEmYrrc1ZnEhxuPqybNvrW6Pw7ERlBAAAHGOVjR
	 t1w/C18ryEGtcZai8wXGQKy3E5IkJuTLNDY/93obeHT5F19sIGxgxzilSYjTPlw3E8
	 0uPbFcaPvH+qZ7zQTTAnHnTZ8f78AEnPRH+s/wqScPg5GXfhMbg0RRRr6JlDahS6sK
	 m+4V0qabn2k2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260801142244.679437-9-coiaprant@gmail.com>
References: <20260801142244.679437-2-coiaprant@gmail.com>
 <20260801142244.679437-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 14:25:32 +0000
Message-Id: <20260802142533.C14121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Probe fails unconditionally on systems without a PM domain or with=
 CONFIG_PM_GENERIC_DOMAINS disabled.
- [High] Premature `pm_runtime_force_suspend()` in `remove()` breaks PHY te=
ardown, causes SErrors, and permanently disables PM runtime on rebind.
- [High] Concurrent unbinding of the XPCS driver during `xpcs_rk_create` le=
ads to a Use-After-Free of `pxpcs` and its MDIO bus.
- [High] Unchecked return value of `device_link_add()` allows Use-After-Fre=
e on supplier unbind.
- [Low] Unconditional assignment of `dev_pm_ops` and missing `pm_ptr()` wra=
pper causes unused function compiler warnings.
--

--- Patch [7]: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platfor=
m glue driver ---
commit 749227defaf729e0f171dc87722abef8ebe69759
Author: Coia Prant <coiaprant@gmail.com>
net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit introduces a platform glue driver for the Synopsys DesignWare X=
PCS
controller found on Rockchip RK3568 SoCs. It translates MDIO operations to
APB3 register accesses via a virtual MDIO bus. The generic xpcs driver then
creates a phylink_pcs instance on top of this bus.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index 0000000000000..36c1557b83367
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -0,0 +1,538 @@
[ ... ]
> +static int xpcs_rk_serdes_phy_poweron(struct dw_xpcs_rk *pxpcs)
> +{
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +	int ret;
> +
> +	ret =3D dev_pm_genpd_rpm_always_on(dev, true);
> +	if (ret) {
> +		dev_err(dev, "Failed to power on power-domains\n");
> +		return ret;
> +	}

[Severity: High]
Does this code unintentionally fail the probe on systems without a PM domain
or when PM generic domains are disabled?

When CONFIG_PM_GENERIC_DOMAINS is disabled, dev_pm_genpd_rpm_always_on()
returns -EOPNOTSUPP. If the device has no power domain (which appears to be
optional), it returns -ENODEV.

Because the probe is aborted on any non-zero return value, the driver will
fail to load on these hardware configurations or in COMPILE_TEST builds.
Should -ENODEV and -EOPNOTSUPP be explicitly ignored here?

[ ... ]
> +static void xpcs_rk_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_force_suspend(&pdev->dev);
> +}

[Severity: High]
Can this break PHY teardown and disable PM runtime permanently upon rebind?

Because the MDIO bus is registered using devm_mdiobus_register(), devres
will unregister it after xpcs_rk_remove() returns. However,
pm_runtime_force_suspend() is called here first, cutting the clock and
incrementing the PM runtime disable depth.

When devres subsequently unregisters the MDIO bus, attached PHY devices
are unbound, which triggers MDIO accesses for teardown. These accesses
will call pm_runtime_resume_and_get(), which fails with -EACCES because
PM runtime is disabled. This failure can cause a synchronous external abort
if the clock is cut during access.

Additionally, the double-disable (here and in devm_pm_runtime_enable cleanu=
p)
leaves the disable depth greater than zero on rebind.

[ ... ]
> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
[ ... ]
> +	pdev =3D of_find_device_by_node(pcs_np);
> +	of_node_put(pcs_np);
> +	if (!pdev)
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);

[Severity: High]
Is it possible for the XPCS driver to be unbound concurrently while
platform_get_drvdata() is reading the data?

The device structure itself is pinned by of_find_device_by_node(), but
without holding the device lock, a concurrent sysfs unbind could trigger
devres cleanup. This would free pxpcs and unregister the MDIO bus right
before xpcs_create_mdiodev() accesses pxpcs->bus, leading to a
use-after-free.

Should the device lock be held to verify the driver is still bound before
proceeding?

> +	if (IS_ERR(xpcs)) {
> +		put_device(&pdev->dev);
> +		return xpcs;
> +	}
> +
> +	device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER);

[Severity: High]
Does this ignore the return value of device_link_add() if the link creation
fails?

If device_link_add() fails (for example, due to a memory allocation failure=
),
no link is established. Later, if the XPCS supplier unbinds, the driver
core will not automatically unbind the MAC consumer. The XPCS devres
cleanup will free the MDIO bus while the MAC driver is still bound and
potentially using it, which can cause a use-after-free.

Should the return value of device_link_add() be checked?

[ ... ]
> +static const struct dev_pm_ops xpcs_rk_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(xpcs_rk_pm_runtime_suspend,
> +			   xpcs_rk_pm_runtime_resume,
> +			   NULL)
> +};
> +
> +static struct platform_driver xpcs_rk_driver =3D {
> +	.probe =3D xpcs_rk_probe,
> +	.remove =3D xpcs_rk_remove,
> +	.driver =3D {
> +		.name =3D "rk_xpcs-dwxpcs",
> +		.pm =3D &xpcs_rk_pm_ops,

[Severity: Low]
Will this generate unused function warnings when CONFIG_PM is disabled?

The xpcs_rk_pm_runtime_suspend() and xpcs_rk_pm_runtime_resume() callbacks
are defined as static. When CONFIG_PM is not set, SET_RUNTIME_PM_OPS expands
to nothing, leaving the static functions unreferenced.

Since xpcs_rk_pm_ops is unconditionally assigned to .pm without the
pm_ptr() wrapper, the struct is always referenced, but the callbacks inside
might not be. Should RUNTIME_PM_OPS() and pm_ptr() be used instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801142244.6794=
37-2-coiaprant@gmail.com?part=3D7
