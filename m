Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467F25632BD
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882071; cv=none; b=J257bzo8Uz3mvXAWeT1nOqUNPjriLQeAESys0zi0by7qVIyX0XfzWsr+RM13NUK5fRSlznjR4GF9j7kjBAawsnCPhXtFU+/CaEz+eC3tsqhBmBec2qZu2FKgHBJ20LrPrF8AN1fTNZYwS6nJlCVzY3Bk9r0qMuH2vDlSKIkcZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882071; c=relaxed/simple;
	bh=ntpO5YCLn3VWli7WOkIQylmHtO+Qq+c25w3mF6Jt+Jc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AXFyYJu8I9hp9yFMNIjVM/z7jYwzcUaZwVZ/yoVlXUC5h2iYAZkgdZ/etB4QKxIWZTB1tKZQMMgnmjSALUmkvAeGhPvfibZU8SaNPnTZc8h0XDTg84vbblZQLcvwPOU5waodVgrpLDH2ouvvBx/vq+Y7L3tMJYI5q7I2utJTy2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6864E1F00A3A;
	Tue,  8 Sep 2026 15:41:08 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260907153713.2572547-9-coiaprant@gmail.com>
References: <20260907153713.2572547-2-coiaprant@gmail.com>
 <20260907153713.2572547-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 15:40:50 +0000
Message-Id: <20260908154108.6864E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in xpcs_rk_=
create allows a concurrent unbind of the supplier to free the MDIO bus, lea=
ding to a Use-After-Free.
- [Medium] Incorrect LIFO teardown ordering in devres clock cleanup action =
violates proper device initialization and PM hierarchy rules.
--

commit 7142dbf6b28b5ee94d0edc969bcf16d1183a5f41
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit adds a platform glue driver for the Synopsys DesignWare xpcs
integrated in the Rockchip RK3568 SoC. It creates a virtual mdio bus to
translate mdio operations to apb3 memory-mapped register accesses.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..68bcaa1a5cbbf
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
[ ... ]
> +static void xpcs_rk_exit_clk(void *data)
> +{
> +	struct dw_xpcs_rk *pxpcs =3D data;
> +	struct device *dev =3D &pxpcs->pdev->dev;
> +
> +	clk_disable_unprepare(pxpcs->eee_clk);
> +
> +	pm_runtime_force_suspend(dev);

[Severity: Medium]
Does this sequence result in the clock being disabled before the device is
suspended?

In xpcs_rk_init_clk(), eee_clk is enabled first, followed by a call to
pm_runtime_enable(), allowing the device to become runtime active. During=20
teardown, pm_runtime_force_suspend() invokes xpcs_rk_pm_runtime_suspend()
to disable csr_clk.

Calling clk_disable_unprepare() for eee_clk before pm_runtime_force_suspend=
()=20
violates last-in, first-out ordering, disabling the prerequisite clock while
the device is still considered active. Should pm_runtime_force_suspend() be
called prior to disabling the eee_clk?

> +}
[ ... ]
> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
[ ... ]
> +	device_lock(&pdev->dev);
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {
> +		device_unlock(&pdev->dev);
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> +	device_unlock(&pdev->dev);

[Severity: High]
Does dropping the device lock here introduce a time-of-check to time-of-use
race condition?

If a concurrent unbind of the rk_xpcs-dwxpcs supplier driver occurs=20
immediately after device_unlock() but before device_link_add(), the unbind=
=20
would trigger devres cleanup, freeing the mdio bus.

> +	if (IS_ERR(xpcs)) {
> +		put_device(&pdev->dev);
> +		return xpcs;
> +	}
> +
> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {

Since device_link_add() permits linking to devices without drivers, it could
succeed even if the supplier was just unbound. The consumer driver would th=
en
resume probing with the returned xpcs pointer referencing a freed mdio bus,
leading to a use-after-free when the mac driver attempts to read or write
pcs registers.

Could the device_link_add() call be moved inside the lock block protected
by device_lock() to safely establish the dependency before the lock is
released?

> +		xpcs_destroy(xpcs);
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	put_device(&pdev->dev);
> +	return xpcs;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907153713.2572=
547-2-coiaprant@gmail.com?part=3D7
