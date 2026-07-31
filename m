Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A219DF62
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517827; cv=none; b=M4JU8pab/E80RoAOz99LPIhtczI0WJ5/0QbqPF/RR7GYikwBFIFlpGj3k0DRpEGmfATjjxMw78O+3NsDB8mqJGArQ1oXsVaNRrxiUvxEzonEEPE8uUukRkc4eco9rLm6Ldd/CUJCYpbI5CHOE+793muvLr49DgGIoPlhSg8H6rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517827; c=relaxed/simple;
	bh=04sik7v5lf6gu9iKBteNn0jlvTsbyQu32AQAb//MdZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eXob5seW8o+mLezgqc9XFmOzYK0hs563ZOkY9J4F/nWB9WeOiC01MWrwGkMskUFlc91oMZ6J1H4kTuiuzkKYhchjtOiwJk29TZmC5oNYAP8hD5x99C5Z3bQfZjPnpHduQKDaBm1DxyrwV1FAF7Coo7tDyyDcdvo6lqzfdBlLAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyktFBw7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyktFBw7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197311F00AC4;
	Fri, 31 Jul 2026 17:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785517825;
	bh=XscTIa2Mo7UvG9fCspGZE/WFMGd8xvU4l27+JUe8Bjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nyktFBw7b+wBO092KQuHq+uia73cKHNyntNI6phyuOO8e/WqKuZcVNPv0jC5yb4fq
	 OdRK3sppTWBhfqN4o1gG1oxIqjPI7kx4B6gd1M4SitxEon45/dk5jMftVeXMLvf994
	 Sm5asOGiJZ42jbNThGgpO0SUEbkc+p5uRhJ5kazTdTL54UGYhgvB/BtQtL+0cK+3w+
	 Po+ZwgkhFW5DVF0m5k06qYKkVSEMjKUimUWYTt7Ml/Kx000iMY+NhweYs5Z7aQI2TB
	 BfwLx/Qpp1mGbRxAWDhbghIemQq3WcXGa9/0LwOX8JTTX1Hhaw/brdERWWfoJSdjwo
	 JBByyuo/0tOQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 13/21] drm/rockchip: dw_dp: Implement out-of-band HPD
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260731-synopsys-dw-dp-improvements-v8-13-ac1e6a75782f@collabora.com>
References: <20260731-synopsys-dw-dp-improvements-v8-0-ac1e6a75782f@collabora.com>
 <20260731-synopsys-dw-dp-improvements-v8-13-ac1e6a75782f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 17:10:24 +0000
Message-Id: <20260731171025.197311F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing runtime PM acquisition in `dw_dp_rockchip_hpd_sw_cfg` and =
`dw_dp_rockchip_hpd_sw_sel` causes potential SErrors when accessing `vo_grf=
`.
- [Medium] Logical flaw in `dw_dp_rockchip_get_vo_grf` prevents probing on =
future platforms, contrary to its comment.
--

--- Patch [13]: [PATCH v8 13/21] drm/rockchip: dw_dp: Implement out-of-band=
 HPD handling ---
commit 1e82a4f2c1a3fedc07fd8e258e2008997986261a
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

drm/rockchip: dw_dp: Implement out-of-band HPD handling

This commit implements out-of-band hotplug handling for USB-C by accessing
the vo_grf directly.

> diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/=
rockchip/dw_dp-rockchip.c
> index 005938dc66c9f..d516b3910b516 100644
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

[Severity: High]
Does this register access require a runtime PM reference?

The commit message notes that this register requires the power-domain from =
the
DP controller, and that moving the access here prevents massive SError prob=
lems
once runtime PM is enabled. However, it appears this code accesses the regi=
ster
without acquiring a runtime PM reference (e.g., pm_runtime_get_sync()).=20

If the DP controller is runtime suspended when a hotplug event occurs, won't
this regmap_write() still cause an SError?

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

[Severity: High]
Does this register access also require a runtime PM reference to prevent an
SError, for the same reasons as above?

> +}
> +
>  static int dw_dp_encoder_atomic_check(struct drm_encoder *encoder,
>  				      struct drm_crtc_state *crtc_state,
>  				      struct drm_connector_state *conn_state)

[ ... ]

> @@ -71,6 +110,35 @@ static const struct drm_encoder_helper_funcs dw_dp_en=
coder_helper_funcs =3D {
>  	.atomic_check		=3D dw_dp_encoder_atomic_check,
>  };
> =20
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
Will this compatibility check prevent the driver from probing on future
platforms?

The comment suggests that future platforms should add a "rockchip,vo-grf"
phandle in the DisplayPort controller DT node. However, if the PHY node does
not match the legacy compatibles, this code unconditionally returns
ERR_PTR(-ENODEV) and never attempts to parse the "rockchip,vo-grf" phandle
from the DP controller node.

Does this effectively break probe for any new platforms?

> +
> +	regmap =3D syscon_regmap_lookup_by_phandle(args.np, "rockchip,vo-grf");
> +
> +out_put_node:
> +	of_node_put(args.np);
> +	return regmap;
> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-synopsys-d=
w-dp-improvements-v8-0-ac1e6a75782f@collabora.com?part=3D13
