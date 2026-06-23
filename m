Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01635675B
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782246014; cv=none; b=G0rSMq62HGQ77HBOKDNBhsDyi4UnPLMxEaCIFmbG82HzeUmuyItSfjkXNWNVjUPqOySiW2Y75dii1GEernlGKrZYT3EbxDlOAZBzRiEK4vLy2CjH/usdumtqq0O1sQmhlcGgyNpTCkjMr7DrFMgOtuuZ3kB1Q8NTYjFzDZg6awo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782246014; c=relaxed/simple;
	bh=10rKWVzxUxu7Eti8Mv+mfsGDCNtNwBua2GkpT+mME4c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SPE3dl4lzQ/w8cDi3CN7Uig8XuUW2k1j/Pm3m0+zxqCq+NeufHOCSSs+AaE9ZRwhmVS00E9fom38kqqCvO6BqQYnhcCfTzzviSWCqzw11b1ELMRP8+lNPJFr7o/pKm2A+87gmu9u5H17tHNBXkHHCtiyjn+SOlz4ME+qRGSSCxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYhtzW5p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYhtzW5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29821F000E9;
	Tue, 23 Jun 2026 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782246013;
	bh=jws91bIyFlHJHOovsdMRA1onCqoErwopEmxsbYLwuFg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BYhtzW5plbtIhr4M7HOEVl3DtjzLWmwWroV/Xzlp6+G2QVNWcQECie6FPsaXgxJh7
	 J9RmTFFRqVK6Bw2Sz1y2I25QDT+G7+ckAOB066CzQgv9upi0dzALuUNH5FFXlbLR+L
	 FbFxcsBrk9XlPN5OsoEGDjet4tunGn8ziRIpAPm/vS1hkh6/ToVeW7Vy4S7rXvJit9
	 Bh3CpXoaoSW7kdn372F4kbiUBSGthc4qGhHUauQZlmudcRn7Ds0/IvOzg5unAtM2Fy
	 0WaOHVqkguZbAdYy558Hc4EZ9qLkGVe8K51Fe+i/7YDmRWyii4mv5174NM4sAFid/1
	 taZYHW5GjQeuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/10] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-synopsys-dw-dp-improvements-v3-6-dc61e6352508@collabora.com>
References: <20260612-synopsys-dw-dp-improvements-v3-6-dc61e6352508@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 20:20:12 +0000
Message-Id: <20260623202012.D29821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using IS_ERR() to validate the return value of platform_get_mem_or=
_io() fails to catch NULL, leading to a kernel crash when the resource is m=
issing.
- [Medium] The `dp_dp_rockchip_get_vo_grf` function fails to implement the =
documented fallback to read the `vo-grf` phandle from the DisplayPort devic=
e node.
--

commit 2739e6354d59ce0c07c5ba0c2a12b2779e399b4a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
drm/rockchip: dw_dp: Implement out-of-band HPD handling

Implement out-of-band hotplug handling to receive external hotplug
information from the USB-C state machine. This properly detects if a cable
is plugged in for adapters.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 35598ab9fe84a..9c53f1d2c29ab 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
[ ... ]
> @@ -72,14 +117,49 @@ static const struct drm_encoder_helper_funcs dw_dp_e=
ncoder_helper_funcs =3D {
>  	.atomic_check		=3D dw_dp_encoder_atomic_check,
>  };
> =20
> +static struct regmap *dp_dp_rockchip_get_vo_grf(struct rockchip_dw_dp *d=
p)
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
> +	 * Limit this workaround to RK3576 and RK3588, new platforms should
> +	 * add a VO GRF phandle in the DisplayPort DT node.
> +	 */
> +	if (!of_device_is_compatible(args.np, "rockchip,rk3576-usbdp-phy") &&
> +	    !of_device_is_compatible(args.np, "rockchip,rk3588-usbdp-phy")) {
> +		regmap =3D ERR_PTR(-ENODEV);
> +		goto out_put_node;
> +	}
> +
> +	regmap =3D syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");

[Severity: Medium]
Does this function actually implement the forward-compatibility behavior
described in the comment?

If a new platform follows the advice and adds a VO GRF phandle directly to
the DisplayPort DT node (dropping the "phys" property), it looks like the
unconditional of_parse_phandle_with_args() check for "phys" will fail and
return ERR_PTR(-ENODEV) early.

Should there be a primary lookup path for "rockchip,vo-grf" on the DP node
itself before falling back to this PHY workaround?

> +
> +out_put_node:
> +	of_node_put(args.np);
> +	return regmap;
> +}
> +
>  static int dw_dp_rockchip_bind(struct device *dev, struct device *master=
, void *data)
>  {
> -	const struct dw_dp_plat_data *plat_data;
> +	const struct rockchip_dw_dp_plat_data *plat_data_const;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct dw_dp_plat_data *plat_data;
>  	struct drm_device *drm_dev =3D data;
>  	struct rockchip_dw_dp *dp;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
> -	int ret;
> +	struct resource *res;
> +	int ret, id;
> +
> +	plat_data =3D drmm_kzalloc(drm_dev, sizeof(*plat_data), GFP_KERNEL);
> +	if (!plat_data)
> +		return -ENOMEM;
[ ... ]
> +	dp->pdata =3D plat_data_const;
> +
> +	res =3D platform_get_mem_or_io(pdev, 0);
> +	if (IS_ERR(res))
> +		return PTR_ERR(res);
> +
> +	/* find the DisplayPort ID from the io address */
> +	dp->id =3D -ENODEV;
> +	for (id =3D 0; id < plat_data_const->num_ctrls; id++) {
> +		if (res->start =3D=3D plat_data_const->ctrl_ids[id]) {
> +			dp->id =3D id;
> +			break;
> +		}
> +	}

[Severity: High]
Can this code cause a NULL pointer dereference if the resource is missing
from the device tree?

Looking at platform_get_mem_or_io(), it returns NULL when the resource is
not found, rather than an ERR_PTR. Because IS_ERR(NULL) evaluates to false,
the check "if (IS_ERR(res))" would let a NULL pointer slip through. This
NULL pointer would then be dereferenced when accessing res->start in the
loop.

Should this be updated to check "if (!res)" instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-synopsys-d=
w-dp-improvements-v3-0-dc61e6352508@collabora.com?part=3D6
