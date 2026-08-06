Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB9331EC2
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786037249; cv=none; b=CWpMUzueygUpWQfqsL1UPz7VK+/O5sOLBuIgDt5cxqDo81wQJiU5+p9HZo169m4ILHpgQUsKo3NqLBV19crwHcI4ay+6eAp/Cyq9EfmdB/GVCElkTvBGgsBZeqjyHh5BMBSGu13N7a0lPGsXpeFj0QAocpxSQJJsG10jDoQM1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786037249; c=relaxed/simple;
	bh=sUtzmB0R7eKlc+Ihxvjtn4uok7asp1ucQLxu1lJF9ZQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W2z2H1cOKTIxiIAKVjFHG6HpewcenHra74lLigCxa5Xr03h0N/MNmVbtp5a+iSD2CMMVPlyadR0KAxtqW1dmiyAJ649NFtAyhcR2tuf1mGyrHYHl8mOoPHl4k+QHYPlkreiPgoCAqZ8C0kfv+tMwZpJYuW4wRm+JzehGRxhkBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGQm5Qv4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGQm5Qv4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649EB1F000E9;
	Thu,  6 Aug 2026 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786037248;
	bh=AjdcomlDAAvvRiuWm+EQSYMkRwUptGsL45Hfjs4igjg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mGQm5Qv4oBfknVqEP03CTdPEytaJqEUHQsbWztygjmIVWEXhcEGQjd9zQl0+67fTV
	 QGFh5H2IynW4HUV5gG1NnKb0AAFHqyrY9nbojSlNT2/9SgupAP7x9OQ28/7AOTi0i8
	 Av/eiRng+G9r/fsarMauQxtIyY0S/1GKT46O9Vj7crITBvN+8QGMrBtE5O+9oXxQRz
	 OYlxUNby2dADA7RsYHjneWwt/Vf92+cr2+mONRYqZa0+NhbugenLQhYQJW91MwOcYZ
	 oVA17LpmB7oUbzLFSGuVriSecES7TbWCQKhuzxU8w3M1XDUygs6WFqs3zzAWbbQjR1
	 9C6a4sYPu5aEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 13/21] drm/rockchip: dw_dp: Implement out-of-band
 HPD handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806-synopsys-dw-dp-improvements-v11-13-0d508505f383@collabora.com>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-13-0d508505f383@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 17:27:26 +0000
Message-Id: <20260806172727.649EB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Missing runtime PM acquisition in out-of-band HPD callbacks defe=
ats the patch's purpose.
- [Medium] dw_dp_rockchip_get_vo_grf() hard-fails instead of implementing t=
he documented DT fallback for future platforms.
--

--- Patch [13]: [PATCH v11 13/21] drm/rockchip: dw_dp: Implement out-of-ban=
d HPD handling ---
commit 7506de24244286fa5e8735e9092296ca64dbef67
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Implement out-of-band HPD handling

This commit implements out-of-band hotplug handling to receive external
hotplug information from the USB-C state machine. It aims to prevent
massive SError problems once runtime PM is implemented in the DP driver
by moving the register access into the DP driver.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 38e8fe75718e4..9e49e7dbf420f 100644
> --- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c

[ ... ]

> @@ -23,12 +26,48 @@
> =20
>  #include "rockchip_drm_drv.h"
> =20
> +#define ROCKCHIP_MAX_CTRLS 2
> +
> +#define ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL BIT(10)
> +#define ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG BIT(11)

[ ... ]

> +static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
> +{
> +	struct rockchip_dw_dp *dp =3D data;
> +	u32 hpd_reg =3D dp->pdata->hpd_reg[dp->id];
> +
> +	regmap_write(dp->vo_grf, hpd_reg,
> +		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, force_hpd_from_s=
w));

[Severity: Medium]
Does this need to acquire a runtime PM reference before accessing the regis=
ter?

Since this callback can be triggered asynchronously by an out-of-band event
from the Type-C TCPM, writing to the vo_grf regmap while the DP controller
is suspended might trigger the exact SError this patch intends to fix,
once runtime PM is enabled.

> +}
> +
> +static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
> +{
> +	struct rockchip_dw_dp *dp =3D data;
> +	u32 hpd_reg =3D dp->pdata->hpd_reg[dp->id];
> +
> +	dev_dbg(dp->dev, "Force HPD connected=3D%s\n", str_yes_no(hpd));
> +
> +	regmap_write(dp->vo_grf, hpd_reg,
> +		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, hpd));

[Severity: Medium]
Similarly, does this asynchronous callback need to ensure the DP power
domain is active?

If an asynchronous hotplug event occurs without a runtime PM guarantee,
could this register access crash the system?

> +}

[ ... ]

> +static struct regmap *dw_dp_rockchip_get_vo_grf(struct rockchip_dw_dp *d=
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

[Severity: Medium]
Does this hard-fail prevent the documented fallback?=20

The comment mentions future platforms should add a VO GRF phandle directly
in the DisplayPort controller node, but it looks like we return
ERR_PTR(-ENODEV) here without ever attempting to parse the VO GRF property
from np.

If a future platform is missing the legacy phys property or uses a different
PHY compatible string, it will hit these ERR_PTR(-ENODEV) returns and probe
will fail instead of falling back to the documented scheme.

> +
> +	regmap =3D syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");
> +
> +out_put_node:
> +	of_node_put(args.np);
> +	return regmap;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-synopsys-d=
w-dp-improvements-v11-0-0d508505f383@collabora.com?part=3D13
