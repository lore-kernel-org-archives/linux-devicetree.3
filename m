Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65947471253
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657760; cv=none; b=F1XfATNtF3LeykW83BnAmmR5PClP9syfMVOqagRapdl1oMQNKYm51r2fA2Ux+2FcH/FExAl48NeB4mMVd0sKxG4Rwmjwh9/4n/f4duzcfEqlOk266zkqjlWmOtDunYahIJIiOR3Jv6XqPsNl4kon/PIAazi1wZEhdNd+3AUU9PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657760; c=relaxed/simple;
	bh=1G5Ke/SSkiUIBSn9LFFBaCm/Hy4gW3ia2lP1PlMsnCc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0xnd4dSCa5AmPEX9hnR5ShzZKEeHiZ9DNw2lS+GAOUbeTnbaYMsP/6m83eC/g4hysdxhXwvNHD3tDQ3bbg4y5LxkWu+Vwxf/iIf1u14to51U33cj/jm03pCNGdv5R/BZ0PgNeJ9PgYRYDKhhfGDTdguqnJV60xCfg9Ci29H/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBC3Akd2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBC3Akd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9B11F000E9;
	Tue, 21 Jul 2026 18:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784657759;
	bh=B/m+owWUBM6VQS1O2fFdRNrAMYihKIj+X1ZPFE5jqhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LBC3Akd2OsuipYisFRaFBUKZGTmiLJKqzSSRorFJFFeNgKLPgyHBkoreUndRKDzL9
	 q99qWWW+wdioMBKyixeV+E4+ZUCmYqPsJGilwtU4AKMoywtiqIagyvZhrSGYJ99y2A
	 IUaLSd1NJuZV9MCJzZWG5s2KUMgUHMNl+tLMsvIa/JE0+mZei4q0gWITxZ6Rlit+1w
	 3wrtWzZgaQd020XSeD63YG9CArlfM4WIzO/dlNrqE5yPipk1jrdeK6MhxZH49v518G
	 7J+lGvn9STujiqczbUsiKa/a5aAV4FxDvv4nPRZmvpotSHfvyvwNimQpHfl9+1lqrv
	 vsimACew7lqng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260721-synopsys-dw-dp-improvements-v4-6-f0f4a4ede712@collabora.com>
References: <20260721-synopsys-dw-dp-improvements-v4-0-f0f4a4ede712@collabora.com>
 <20260721-synopsys-dw-dp-improvements-v4-6-f0f4a4ede712@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 18:15:58 +0000
Message-Id: <20260721181558.DE9B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The VO GRF regmap lookup fails to parse the DisplayPort DT node =
for new platforms, contradicting its documented design.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but missing cancel_w=
ork_sync() for hpd_work in dw_dp_unbind() causes a Use-After-Free.
--

--- Patch [6]: [PATCH v4 06/10] drm/rockchip: dw_dp: Implement out-of-band =
HPD handling ---
commit 78e1ce0dbd7ef8a004080f25b4449ba54b71de3a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Implement out-of-band HPD handling

This patch implements out-of-band hotplug handling to receive external
hotplug information from the USB-C state machine. It uses the vo-grf
registers to control HPD signal routing and configuration.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 005938dc66c9f..0ecbad24dd4e8 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
[ ... ]
> @@ -71,6 +116,34 @@ static const struct drm_encoder_helper_funcs dw_dp_en=
coder_helper_funcs =3D {
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
Will this fail to probe on new platforms?=20

The comment states new platforms should add a VO GRF phandle in the
DisplayPort DT node, but the code only looks up "rockchip,vo-grf" on the
phy node (args.np) after explicitly rejecting any phy other than rk3576 and
rk3588.=20

Should it try to parse the property from the DisplayPort node (np) instead?

> +
> +out_put_node:
> +	of_node_put(args.np);
> +	return regmap;
> +}
[ ... ]

While reviewing this patch, I also noticed a pre-existing issue in the
related dw_dp_unbind() teardown path:

drivers/gpu/drm/bridge/synopsys/dw-dp.c:dw_dp_unbind() {
	...
	disable_irq(dp->irq);
	phy_exit(dp->phy);
	drm_bridge_put(dp->next_bridge);
	drm_dp_aux_unregister(&dp->aux);
	drm_bridge_remove(&dp->bridge);
}

[Severity: High]
This isn't a bug introduced by this patch, but can this cause a
use-after-free if an HPD interrupt fires right before disable_irq() is
called?=20

If dp->hpd_work is scheduled and the devm-allocated struct dw_dp is freed
during device removal, the background worker might execute dw_dp_hpd_work()
on freed memory.=20

Does dw_dp_unbind() need to call cancel_work_sync(&dp->hpd_work)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-synopsys-d=
w-dp-improvements-v4-0-f0f4a4ede712@collabora.com?part=3D6
