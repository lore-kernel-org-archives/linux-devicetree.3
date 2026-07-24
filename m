Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C68E416863
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 18:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917646; cv=none; b=a4CjgSWhGgQSwLDhm61ImuOqKCbTWkDqiGwEbb+jIFJzUa6mSQhNsvc0PmGTz+Utwjcy6x/iYdY8aDSIWKrLtcZEn+hq6WO5XAehKvlZjZXgn6fdWoiunuUqIPnLr5LiOxa3Fk1K0lK4s5humPpxnOwziEFw+QpZNKYLzcwJdl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917646; c=relaxed/simple;
	bh=cstABUWNHqortM4IAN60Qz4sxBKrQ17SPWYH/ilKiNo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q/xBsRENMJlS8v9GCUw7hPU1RZJdNaUC3AtKh4oS1QxA6Dk1GZ8ZYvPvxHU18gqRe46i2nautIp7mwh5rgvsI0ASpvH3zMstC68Gd80kzpQFPcL7lk35hyNll8jyxrWSVbwzujP940AvSbaukHFavT/dYb06FCfOqIVB10osLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JB/MXlNn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JB/MXlNn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1D91F000E9;
	Fri, 24 Jul 2026 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784917645;
	bh=TfOh/sKx1AqeZI03b8TTJPy1BPILWZ07q36+0gQ1tvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JB/MXlNnrUnl8kR7VQjD3BZYYFXNQhjp33Iu6QjBIsyCzh3AsoLAqxNGwhzNSJlVy
	 j3COGXPs/mSfIMqQWKwG1CmUWTio6sqWk34Mctt05t4EkhqNBQpfTNkkJ8J76xGNmd
	 H0ciqqnm1b/G7iVpWoijsTEpyiIkrsRBgnbfOHETa1+TderZmFGj0S1m1kxdvO5gvX
	 2Hu7rrfRNi1pOtNLkEg+85tDxGLLFq5wgEb8Hok6uElGl1WyiSlwB53OwyzFNXZbmy
	 PF+0dx9EUsSjJhdA5CJpKaMsrmHk6b+q/1C7HrRNNA3k0i8g0Cr00xbUyB1wc10sj6
	 0bMwixNWwCCHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/16] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-10-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
 <20260724-synopsys-dw-dp-improvements-v6-10-041d99a19c4e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 18:27:24 +0000
Message-Id: <20260724182724.BC1D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Broken forward compatibility in dp_dp_rockchip_get_vo_grf.
- [Low] Typo in the newly introduced function name `dp_dp_rockchip_get_vo_g=
rf`.
--

--- Patch [10]: [PATCH v6 10/16] drm/rockchip: dw_dp: Implement out-of-band=
 HPD handling ---
commit 75a9965306b4d818663f8d48b44dc43031d1cb8f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Implement out-of-band HPD handling

This commit implements out-of-band hotplug handling to receive external HPD
information from the USB-C state machine via a syscon regmap (vo-grf). It
prevents SError problems on RK3576/RK3588 platforms when runtime PM is
enabled.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> @@ -71,6 +116,35 @@ static const struct drm_encoder_helper_funcs dw_dp_en=
coder_helper_funcs =3D {
>  	.atomic_check		=3D dw_dp_encoder_atomic_check,
>  };
> =20
> +static struct regmap *dp_dp_rockchip_get_vo_grf(struct rockchip_dw_dp *d=
p)
                        ^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
This isn't a bug, but there is a typo in the function prefix. Should this be
named dw_dp_rockchip_get_vo_grf to match the rest of the driver's naming
conventions?

> +{
> +	struct device_node *np =3D dev_of_node(dp->dev);
> +	struct of_phandle_args args;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_args(np, "phys", "#phy-cells", 0, &args);
> +	if (ret)
> +		return ERR_PTR(-ENODEV);
> +
> +	/*
> +	 * Limit this workaround to RK3576 and RK3588, potential future platfor=
ms
> +	 * reusing the driver should just add a VO GRF phandle in the DisplayPo=
rt
> +	 * controller DT node.
> +	 */
> +	if (!of_device_is_compatible(args.np, "rockchip,rk3576-usbdp-phy") &&
> +	    !of_device_is_compatible(args.np, "rockchip,rk3588-usbdp-phy")) {
> +		regmap =3D ERR_PTR(-ENODEV);
> +		goto out_put_node;
> +	}
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");

[Severity: Medium]
Will this break forward compatibility for future platforms as described in
the comment above?

If a future platform omits the "phys" property or uses a different PHY
compatible, this function unconditionally returns ERR_PTR(-ENODEV) and abor=
ts.
It never attempts to look up the "rockchip,vo-grf" phandle directly from the
DisplayPort controller DT node (np) as a fallback.

Does this need a fallback path to check syscon_regmap_lookup_by_phandle(np,=
 ...)
if the PHY checks fail?

> +
> +out_put_node:
> +	of_node_put(args.np);
> +	return regmap;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-synopsys-d=
w-dp-improvements-v6-0-041d99a19c4e@collabora.com?part=3D10
