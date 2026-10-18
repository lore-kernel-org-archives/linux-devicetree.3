Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F481684B0
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302340; cv=none; b=kU76XsvptVRfVDh7w2l7sxpsN2lzcqy9c4Tb3wBEPHraChbaHWcJVKJhrXbmwwqKa0TbF3csywGNJDkmp0Jf9BxIU13QoFWMkkTS/TcKfAaqTzoAfajheW4oBfAOdSfvRHYPHRBx7+NjVaAqxSU+wR7WcNTLxMj621DM64j8peU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302340; c=relaxed/simple;
	bh=LhcweGVBT25tVquTnAzhUKCDjyD0Mnbfa9OHf7CX5n8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dv0KF3mYde1ZDF7vUvBNcB49d6/Sk0Gu34BiCZekm3LQMs27UuSlD7RobT+wI6Gx00tTHKx7UsMZ87yC5nOg6Yi2dw6b2tIGjrGzRs2jZSK/M2HYxv0knEJxVxOQQJ/fXu6IrfRglco8cBmjwFjiHjg3ceQXQD/R7BebF1qWYX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqEdSA1X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqEdSA1X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF85B1F000C4;
	Sun, 18 Oct 2026 05:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792302339;
	bh=0/UmJarMk4vQFR1uC9kh1X6IG2eSci5Tk6U2hOMJvGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jqEdSA1XSrggHVaTtN5crOHqOG5yRzwleF0A6Lcjyoq0RicaCYSYXA6XfHKu5q2n/
	 6YF6MYcdaWFdCdGyyNNH7xwUWa14sbOdMh+C5a0VdtGBuAbn/DAThcvdRgVQBGFiqg
	 qpNY5u7GW0rVsPd59jQYGHKDQDSaSZOCYpcpzGWB3UX7mdoSPOq4FRX9g+05a74yZX
	 TfFZUvosYau7TM/JizzaDGCcWZk48UTMOdJEdosy6NfI7h30wa0QBACVm8KZjffUEd
	 212L06EyHRGuPWNqBccUkDwxGrvqTaxG5HceFSQtvoDfkhl6oodPeZ4jV8ksu/Ib2q
	 slshVe4gGNeQg==
Message-ID: <sashiko-outbox-175952@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 3/6] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261017054406.1828061-4-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
 <20261017054406.1828061-4-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 05:45:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: pcs: xpcs: xpcs_rk_system_suspend() relies on unset active_=
wakeup
--

commit 51040950622ac8bc620e18e37d9000b98191388d
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit adds a platform glue driver for the Synopsys DesignWare XPCS
on Rockchip RK3568 SoCs, creating a virtual MDIO bus over APB3 registers
and managing the SerDes PHY, clocks, and power domain.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf (Page 2078)

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..698a43b753341
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> @@ -0,0 +1,598 @@

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
> +	return 0;
> +}
> +
> +static int xpcs_rk_system_resume(struct device *dev)
> +{
> +	return 0;
> +}

[Severity: Medium]
Does calling device_set_wakeup_path(dev) in xpcs_rk_system_suspend()
actually keep the RK3568_PD_PIPE power domain powered on during system
suspend?

The commit message notes that genpd leaves the domain powered because the
Rockchip power domain driver sets GENPD_FLAG_ACTIVE_WAKEUP on PD_PIPE.
However, in drivers/pmdomain/rockchip/pm-domains.c, rk3568_pm_domains
defines RK3568_PD_PIPE with wakeup set to false:

drivers/pmdomain/rockchip/pm-domains.c:
	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, false),

In rockchip_pm_add_one_domain(), GENPD_FLAG_ACTIVE_WAKEUP is only set when
pd_info->active_wakeup is true:

	pd->genpd.flags =3D GENPD_FLAG_PM_CLK | GENPD_FLAG_NO_STAY_ON;
	if (pd_info->active_wakeup)
		pd->genpd.flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;

When the system suspends via genpd_suspend_noirq() -> genpd_finish_suspend()
in drivers/pmdomain/core.c, genpd checks:

	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
	    !device_out_band_wakeup(dev))
		return 0;

Because genpd_is_active_wakeup(genpd) is false for RK3568_PD_PIPE, genpd
ignores device_awake_path(dev) and powers off the domain once all consumers
are suspended. This powers down the shared SerDes PHY and XPCS controller,
breaking MAC Wake-on-LAN and losing hardware state across suspend and
resume since xpcs_rk_system_resume() is a no-op.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261017054406.1828=
061-1-coiaprant@gmail.com?part=3D3
