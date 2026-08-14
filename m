Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F264535DA55
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786676107; cv=none; b=rxKbS13Fn5hZUhXvInIThCXJZlVKrDax89dajx+e4Rk0GtXh5sXmcguHPkKLr7rwf38Y2XFBCohdwQOj46w+k6zGi9hYtvuY/MGji12o66yiGtU4uoUwemGXsWlyzX6TN6ki16LCKS5OSF83v+LyWQuuPlgkvzKkbkFXOgKcYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786676107; c=relaxed/simple;
	bh=WYOQLlouBJvTMhyPRgwjY2pyGneRZJeEaYWQW04RXic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z1fZhY7kbN7sf/dnfeci/+59i9nqht1naH5vZX4sFAppzNn+CnYk2fN5O5Tbsh79oMI1bQ+vXQuV8J3VfymDbDVe1/Ka+Ic8NcR8gaq/OTJcWBhYeRHmxSUGZIwK+D0q4a+qa72agtIFY5l2WdoH/fzflrVCnY8sSO14vqCeHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJaAxGxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJaAxGxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AF81F000E9;
	Fri, 14 Aug 2026 02:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786676105;
	bh=rwPRnyptNPDBWJdKf9G8LpSZVBgrZjgwStyoBKkGHtA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WJaAxGxKAAW6iT0Nda+StyRMIjNtuiV1aPrCcHpOz9KXHYG91CDBhW0JafK2SjQZk
	 d+aig03L/Vog0X7dxKLsBX5wb3dyhKV7Pcy04BjUbOOKE6gdSclDLg8vNHx1AXvfv0
	 3LmtXaSPUQLvGQr00Y+U8S3V9HlKNW1qgG0wUhYVwPoTANPU1xTBYLsiGklhanCydX
	 lJGw4eHCgojPC67UVGNOueI+joprdoNxOcfJNY0h/RBwNSKe8RLzvo3Au9j+Gmedrl
	 pxo3w6HKG2cB16yvRor6xiLDESq8p8ajfu5ApMlGflztR3AHwQtk7nsWRgKeD0pJS1
	 rby0O8uawBp1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 11/38] phy: rockchip: usbdp: Support single-lane DP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-11-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-11-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 02:55:01 +0000
Message-Id: <20260814025505.23AF81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Prematurely caching `udphy->dp_lanes` based on Type-C state causes=
 unintended DP physical lane enablement when DP mode is not active.
--

--- Patch [11]: [PATCH v14 11/38] phy: rockchip: usbdp: Support single-lane=
 DP ---
commit 9992535ad6ec018fe7cd04829eeaaa211b9c6078
Author: Zhang Yubing <yubing.zhang@rock-chips.com>

phy: rockchip: usbdp: Support single-lane DP

Implement support for using just a single DisplayPort line.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 7540c897dde13..c4d62b234ea80 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1050,18 +1039,17 @@ static int rk_udphy_dp_phy_exit(struct phy *phy)
>  static int rk_udphy_dp_phy_power_on(struct phy *phy)
>  {
>  	struct rk_udphy *udphy =3D phy_get_drvdata(phy);
> -	int ret, dp_lanes;
> +	int ret;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> -	dp_lanes =3D rk_udphy_dplane_get(udphy);
> -	phy_set_bus_width(phy, dp_lanes);
> +	phy_set_bus_width(phy, udphy->dp_lanes);
> =20
>  	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
>  	if (ret)
>  		goto unlock;
> =20
> -	rk_udphy_dplane_enable(udphy, dp_lanes);
> +	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);

[Severity: High]
Does this code inadvertently enable physical DP lanes when DP mode is not a=
ctive?

By using the unconditionally cached udphy->dp_lanes instead of evaluating it
dynamically with rk_udphy_dplane_get(), could this be bypassing a safety ch=
eck?

If HPD is not asserted or the mode is unsupported during rk_udphy_typec_mux=
_set(),
udphy->mode is not updated to include UDPHY_MODE_DP. Later, rk_udphy_power_=
on()
will return 0 because it ignores unsupported modes.

This would result in calling rk_udphy_dplane_enable(udphy, udphy->dp_lanes)
with a >0 lane count on a PHY that is not fully configured for DP, instead =
of
safely asserting reset as it did when the lane count evaluated to 0.

[ ... ]

> @@ -1341,6 +1329,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
>  		udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
>  		udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		mode =3D UDPHY_MODE_DP;
> +		udphy->dp_lanes =3D 4;
>  		break;
> =20
>  	case TYPEC_DP_STATE_D:
> @@ -1357,6 +1346,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
>  			udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		}
>  		mode =3D UDPHY_MODE_DP_USB;
> +		udphy->dp_lanes =3D 2;
>  		break;
>  	}

[Severity: High]
Is it safe to unconditionally cache udphy->dp_lanes here before verifying H=
PD
assertion, knowing that it might desynchronize from the actual udphy->mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D11
