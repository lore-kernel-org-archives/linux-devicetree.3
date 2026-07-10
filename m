Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EFC3A5E70
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717835; cv=none; b=SAbJ3YTmLq1S91eAIKBYjXJ090lyddYAhgt7NK0DK/86eY6ywkJ8jCNhRDnY7Ye1esw5soMu6xkPLMF1iQUOclj4Z+RrcZqP0au3tIABDelU0YdAKdEkaXPBmYSYJV9bhnhjZ3a0LHplF9A3e9CjWkceUI8xZYbyuNKZmymZR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717835; c=relaxed/simple;
	bh=Po98MiSyR9RK9+MhtZSMzAv4BsMaERX9+FzQI+YYQw4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j707fCJGjKyK/4uJG9zJ+OZCIoGmQwXR5Q3vMqcnrnACR7QCTDgPqLRQt7ChGwIPMeGQMnx+DkykSPFUTIhYWwmubggsltXX+YZBW3N4MeqKAUaet475l5eUMEvg9FNFk95qGvKK8rMB/ah/8ARYSTo5THJt47Z5Iphbvi79M/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+g8vPie; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+g8vPie"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07D621F000E9;
	Fri, 10 Jul 2026 21:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783717834;
	bh=UaaL8DVjnmwhzEkXotsyF7hIwgscLRo9iV92jQsHgbM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y+g8vPieozjgeaOTdtmvDKD7v72yLyDAi0cHOiUXYG6HUpsjBT3CaSJVYTPFNNnlm
	 JiF8odHPicx+3zA5ornyNJoHEfx3/nKCkncIfS/iioh2v4qbYez/ChowIOPT4agXT1
	 yod2mRZBBBU53AWwZuWnvsZ/12UXewBohVqkYIrAfO/bRyMkd/OsJQsl67ZUNpDTet
	 tmtIsWTGROn2bBgojnQ4Bh8BAberd1R57KJmLIbu7Ag6qDR6FJTH5pTWLxxudatH+I
	 mIqQbXT3jCSLiy4IJs1xVrUFANpep5VAEHJwZUR7S+IiEbGRmOz7QYjwUsucCdxC9q
	 2CpCqwEJnGEmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-18-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-18-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:10:32 +0000
Message-Id: <20260710211033.07D621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware hang due to unclocked memory-mapped register access.
--

--- Patch [18]: [PATCH v12 18/36] phy: rockchip: usbdp: Rename mode_change =
to phy_needs_reinit ---
commit 879ba283150f41ae77236ca40a0536af8b8e8236
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename mode_change to phy_needs_reinit

This patch renames the mode_change property to phy_needs_reinit to better
reflect that the PHY requires re-initialization not just on mode changes, b=
ut
also on cable orientation switches. This prepares the driver to handle DP
re-init properly on orientation changes.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 24108816e3b95..e44d19c9d1193 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)

[Severity: High]
This is a pre-existing issue, but can this lead to a system hang when the P=
HY
is unsupported?

Looking at rk_udphy_power_on(), if the requested mode is unsupported,
it returns 0 early without enabling the clocks:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return 0;
	}
...
}

Because this returns 0 instead of an error code, rk_udphy_dp_phy_power_on()
assumes the PHY is clocked and proceeds to call rk_udphy_dp_lane_enable():

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_power_on() {
...
	ret =3D rk_udphy_power_on(udphy, UDPHY_MODE_DP);
	if (ret)
		goto unlock;

	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
...
}

This results in accessing memory-mapped PHY registers via pma_regmap when t=
he
corresponding PHY clocks are gated. Could this trigger a synchronous extern=
al
abort and a kernel panic?

Additionally, this same sequence appears in rk_udphy_dp_phy_power_off()
which calls rk_udphy_dp_lane_enable(udphy, 0) unconditionally without check=
ing
if the PHY was successfully powered on:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_power_off() {
	mutex_lock(&udphy->mutex);
	rk_udphy_dp_lane_enable(udphy, 0);
	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
...
}

Should rk_udphy_power_on() return an error like -EINVAL when the mode is not
supported, and should rk_udphy_dp_phy_power_off() avoid calling
rk_udphy_dp_lane_enable() if the PHY is not powered on?

> =20
>  		if (udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
> -		udphy->mode_change =3D false;
> -	} else if (udphy->mode_change) {
> +		udphy->phy_needs_reinit =3D false;
> +	} else if (udphy->phy_needs_reinit) {
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
>  		ret =3D rk_udphy_init(udphy);
>  		if (ret)
>  			return ret;
> -		udphy->mode_change =3D false;
> +		udphy->phy_needs_reinit =3D false;
>  	}
> =20
>  	udphy->status |=3D mode;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D18
