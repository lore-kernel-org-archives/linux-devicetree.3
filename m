Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074BB54A7E7
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061520; cv=none; b=pB0tE4E5l+t5UCPnNLaqgfporyjaC21gvSc6VvT6jeyWsFtpjq0VrbkSzrvpxD+6XHfOVnmM95IkjJlfnhBmhonDnUBI2DWqhcayyTf4V3QBU0jnn2W7gqwSzTobPWnXo4FXDrpriS+FhlX/1J7+7n4KLDsAdrf12+YAVY4iMnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061520; c=relaxed/simple;
	bh=c9TyEP0bh//VEXhAtqxqjDQYcAJxBEcdPTjTHPk+vgo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AdGmjApdvN9Z4ezox6iDVMkX5jPjcaWOmEngz4r01+p0LsjDwkXUdX8+Ympp278bXELX9XI6E1wNjgV4JafJAqTLYPgx1RP4xYVU9oI6cp4yPZyFO+gWzTIMkq1yiaOZVLOYDybYwbtqwiCVvFxn7J7uEDa7MoP+x8uBAucwrhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRGFGJnv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRGFGJnv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F77B1F0089C;
	Thu, 10 Sep 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061506;
	bh=3wmwpv4+eI+KSE6dzETrvkbpYeGlUg3JDepng9Z7piw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRGFGJnv9AANjK1r/KOq8aNrY2cA2JwJxSa4Y4T4dCtG38gIucY0pVSHzhuKZVT+l
	 C33/LNbJwORKsDBkQ0b35Y6BQn6yL80EJu1wV127gmYLNLIhHIirImqH8zhuv+YRtj
	 hXFfvAAp8v3thP8YrVHcNddwFyOHnxAwvH04WD0J6w1lXBYR7pZOKTKpoyQ+QFz6bL
	 2gSTQK5y8vJbQ3oy1GpzCocVcBDPRYvet1W9ooY1TctHbcBl74SZi9HOGe7T+erEo+
	 rSfQU0pEkNR5xvkfvNAdgBQlV1a2apP3W0UffuBn6O0lAwUMFfs+lPaqI6aF4BqpQl
	 swIXsa85pyFSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 10/10] net: ethernet: ravb: Add gPTP support
 for Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260909173027.2201560-11-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-11-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:45 +0000
Message-Id: <20260910173146.1F77B1F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Memory leak of the OF node reference `priv->of_gptp` on `ravb_pr=
obe()` error paths.

Pre-existing issues:
- [High] Early return on `pm_runtime_resume_and_get()` failure in `ravb_rem=
ove()` bypasses all device unregistration and cleanup, causing Use-After-Fr=
ee (UAF) and memory leaks.
--

commit 48076f5d1eda0f850642f3a64b86b20eefb56947
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add gPTP support for Gen4

This commit adds gPTP support for R-Car Gen4 devices by utilizing a
system-wide gPTP clock. It adds the ptp-timer property parsing and modifies
device initialization and teardown to manage the external clock reference.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 8617c30dbb14e..c8aa40136c3da 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2755,6 +2755,57 @@ static const struct ravb_hw_info ravb_gen3_hw_info=
 =3D {
>  	.magic_pkt =3D 1,
>  };
> =20
> +static int ravb_gen4_ptp_probe(struct net_device *ndev)
> +{
> +	struct ravb_private *priv =3D netdev_priv(ndev);
> +
> +	priv->of_gptp =3D of_parse_phandle(priv->pdev->dev.of_node, "ptp-timer"=
, 0);

[Severity: Medium]
Does this code leak the device node reference on error paths?

In ravb_probe(), this new ravb_gen4_ptp_probe() is called via
info->ptp->probe(ndev) and acquires the reference.

If a subsequent step in ravb_probe() fails (for example,
devm_clk_get_optional() or register_netdev()), the function jumps to shared
error labels like out_reset_assert or out_rpm_disable.

None of these error paths call of_node_put(priv->of_gptp), which leaves the
node reference permanently leaked.

> +	if (!priv->of_gptp)
> +		return 0;
> +
> +	if (!of_device_is_available(priv->of_gptp)) {
> +		of_node_put(priv->of_gptp);
> +		priv->of_gptp =3D NULL;
> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -3191,6 +3242,7 @@ static void ravb_remove(struct platform_device *pde=
v)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	clk_unprepare(priv->refclk);
> +	of_node_put(priv->of_gptp);

[Severity: High]
This is a pre-existing issue, but does the early return in ravb_remove()
cause a use-after-free and memory leaks?

Earlier in ravb_remove(), there is an early return if
pm_runtime_resume_and_get() fails:

	error =3D pm_runtime_resume_and_get(dev);
	if (error < 0)
		return;

When this fails, ravb_remove() abruptly returns without calling
unregister_netdev() or any teardown logic.

Since the driver unbinds anyway, devres will automatically unmap the device
memory (e.g., priv->addr).

However, because unregister_netdev() was skipped, the network device remains
active and will attempt to access the unmapped memory during network operat=
ions
or interrupts, leading to a kernel crash.

Additionally, this early return will also skip the newly added
of_node_put(priv->of_gptp) call, leaking the OF node reference.

>  	reset_control_assert(priv->rstc);
>  	free_netdev(ndev);
>  	platform_set_drvdata(pdev, NULL);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D10
