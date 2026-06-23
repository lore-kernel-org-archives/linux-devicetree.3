Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69739769D
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782245497; cv=none; b=KkkTnojUfX5Pex96bAeOdFMB6LnqS5pN+tcmCMtdslsjcutBBdj76PjDKigclJPpCTV0hnzrQzK6BOyO5yn/+lGoqRTH/2quKiaBNKLTcCTRvemI8RRTdOO0spheGIfLc/Alvlz1m7RMryo2ZJFwlAsU3NiKiPb8KcwH02Tz/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782245497; c=relaxed/simple;
	bh=k2e7PzmT2hrGRQdgOKTY4mg+Pi3LGo9rRT7mPuNSOMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uleOv1Tjqobz2fQ3bfTpOJvVoEtoO2Ke0vML8o8e9Ae8fT1KdsIcupkZg6FDtYe7jqgUYC9U2MOeypfelVYF+oNEkaMqqiM5bFmfy/s+WohgpbO3+zESHhqSCyKCRTF3rPoihfIVpkXhy9j6HyBrXzakmnMZV0XWpeDEDvVOR78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IRGy6bG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IRGy6bG3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BF61F00ACA;
	Tue, 23 Jun 2026 20:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782245496;
	bh=E4OQBvD/43yxCYHKK6cL5tCtMdhI9W+U0R4DGTGo988=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IRGy6bG3m9Px4v20b7iKO8eq+tdgUTXzQSGHGL/ZCR2FRg+/iDdfOnVVXHN14FXZy
	 CqtrQ6prE0S1Y+vbaoKcMw90RlZOj5JdRgSR3NtuF+hwiLSc8QlxTF42L6G2oUkUe0
	 F7b9B3R1b9s7l2LwVI+dhhKyYI52JBDNwWt/20jxeYmCBWReggrw6WyCXhbZeNv75m
	 VfmASingrlCV+g6Ym5p54gbY6jZlxsq2QqNrvF71AbLHJFAcjt0IHaqDoT7t510LwG
	 To4sWDL3uBiraYF2ZrmLFKYGfzl7ZGDX1PXVsaKuCoGMq0lNAp/u31euXAZgbS6Kt3
	 TpZyGJfGmFC9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 05/10] drm/bridge: synopsys: dw-dp: Support software
 triggered OOB HPD
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-5-dc61e6352508@collabora.com>
References: <20260612-synopsys-dw-dp-improvements-v3-5-dc61e6352508@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 20:11:35 +0000
Message-Id: <20260623201136.15BF61F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Reference leak of the downstream bridge in `dw_dp_bind()` on both =
success and error paths.
- [High] The driver incorrectly treats the absence of a downstream bridge a=
s a fatal error, breaking backward compatibility.

Pre-existing issues:
- [High] Missing `cancel_work_sync()` for `dp->hpd_work` during unbind lead=
s to a Use-After-Free.
--

commit 121b9fc711d52bcdbd8b50a6dc50a5308864d167
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/bridge: synopsys: dw-dp: Support software triggered OOB HPD

Add support for USB-C DP AltMode out-of-band hotplug handling. The
handling itself is implemented in the platform specific driver as the
registers to force HPD state are not part of the Designware DisplayPort
IP itself. Instead the platform integration might provide the necessary
functionality to mux the HPD signal.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/br=
idge/synopsys/dw-dp.c
> index 98cff435dfb87..7fa38145e35ce 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c

[ ... ]

> @@ -2078,6 +2107,13 @@ struct dw_dp *dw_dp_bind(struct device *dev, struc=
t drm_encoder *encoder,
>  		goto unregister_aux;
>  	}

[Severity: High]
Does dw_dp_bind() leak the reference to the downstream bridge?

of_drm_get_bridge_by_endpoint() returns a bridge pointer with an incremente=
d=20
reference count, which is stored in next_bridge:

	next_bridge =3D of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
	if (IS_ERR(next_bridge)) {
		ret =3D PTR_ERR(next_bridge);
        ...

The reference is not dropped after drm_bridge_attach() succeeds, nor is it=
=20
dropped on the error path before jumping to unregister_aux. Could this leak=
=20
the reference on both success and error paths, preventing the downstream=20
bridge from cleanly unloading?


[Severity: High]
Should the absence of a downstream bridge be treated as a fatal error?

If the device tree defines the DP controller as the end of the display chain
(i.e., no endpoint 1 is defined), of_drm_get_bridge_by_endpoint() returns
-ENODEV. The code unconditionally aborts initialization here instead of=20
gracefully ignoring it:

	next_bridge =3D of_drm_get_bridge_by_endpoint(dev->of_node, 1, 0);
	if (IS_ERR(next_bridge)) {
		ret =3D PTR_ERR(next_bridge);
		dev_err_probe(dev, ret, "failed to get follow-up bridge.\n");
		goto unregister_aux;
	}

Could this break backward compatibility and cause the driver to fail to pro=
be=20
on boards that do not define a downstream bridge?

> =20
> +	if (dw_dp_is_routed_to_usb_c(encoder)) {
> +		dev_dbg(dev, "USB-C mode\n");
> +
> +		if (dp->plat_data.hpd_sw_sel)
> +			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
> +	}
> +
>  	dw_dp_init_hw(dp);

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does dw_dp_unbind() leave=20
pending work scheduled?

During bind, the driver initializes dp->hpd_work and schedules it in the=20
interrupt handler dw_dp_handle_hpd_event(). However, dw_dp_unbind() does no=
t=20
cancel it:

void dw_dp_unbind(struct dw_dp *dp)
{
	drm_dp_aux_unregister(&dp->aux);
}

Because the dp context is allocated with devm_drm_bridge_alloc(), it is=20
automatically freed shortly after unbind returns. If the scheduled work=20
executes after dp is freed, could it cause a use-after-free in=20
dw_dp_hpd_work()?

Should cancel_work_sync(&dp->hpd_work) be added to dw_dp_unbind()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-synopsys-d=
w-dp-improvements-v3-0-dc61e6352508@collabora.com?part=3D5
