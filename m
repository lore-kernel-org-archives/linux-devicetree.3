Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006BA3B42C7
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718153; cv=none; b=qYohTOR3/yBMBvSZTtbEzcqRE45IsZ/85liabgZdEU3DvpFjAu7mZacSYPdiQ/V5UPd123/cwNtV7QnBY533DCxcmspFoDDiR/L5rgTHve2eA2H7ohn6Bvijs8lRmnwcp5d4FurR3UBFHAAwr4oaReTUhskSCMOFembuDZK0vh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718153; c=relaxed/simple;
	bh=KekjYWrvHsyyFrfwRPkNMqJv9lT9xl0+lnZ6hkbiJ/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Edq239gus81TSRu3JnN4lQgyxkg/RsMfwob2DF53iUrndXdJoq+3t7u0Tz01BtFag1PnMA6h4BqbTmxIhzpQTP1gi1WdNUWjlsSmQp6+jBW3C1+F49iPv8CqJyONkcgKH4PPLAUIYD5GJ28a9oLNx+wX6Obga1Hoo7zEnclNwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW1nQwT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW1nQwT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002EC1F000E9;
	Fri, 10 Jul 2026 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718150;
	bh=S4w/WzBaC7XVHQOu7BfUI05BFXtmiNaIGkXXpWGnD8Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bW1nQwT867HW/ulHPL3M9leiG9e+sWZtus+lPvDFb1ttCR43sjNI7sBbnrb7r/NsC
	 BC390hqYIC70H1NYocMiVJEFXyEuP3G9i10v4sFtYK+9i0tnliiOTJaTdlvKJIjeWs
	 757dAEtU28PqfmKU48az24/x1Ma5Eh+AWdvXH7yVfJ3hQFuFEZ8EISOnF8WshNYThe
	 /g2DT8t45X9KGDbeLN71ZZH0YwtKnPFiyDoauNYkYCwawMZYiVNKHmGnGuxYqavpcQ
	 T1G38GcZqvgdJ1QIRhg1Tja/X3kO9Z43c+TpgorOA50C22caSCLBGBzeb0TVTwojAZ
	 UogJQQxoBY2KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-19-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-19-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:15:49 +0000
Message-Id: <20260710211550.002EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Deferred hardware initialization via `phy_needs_reinit` fixes Disp=
layPort but leaves USB-only replugs broken if the USB PHY remains powered o=
n.
- [Medium] The function `rk_udphy_dp_phy_configure` accesses shared states =
locklessly, leading to a data race with concurrent orientation switches.
--

--- Patch [19]: [PATCH v12 19/36] phy: rockchip: usbdp: Re-init the PHY on =
orientation change ---
commit c45d3419a6f4b9509b416ffd7965a918e7fad8e4
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

Changing the cable orientation reconfigures the lane muxing, which requires
re-initializing the PHY. The patch introduces a flag to trigger PHY
re-initialization upon orientation change.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index e44d19c9d1193..4b454798c4ed4 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -620,6 +620,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_=
dev *sw,
>  				 enum typec_orientation orien)
>  {
>  	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> +	bool flipped =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> =20
>  	mutex_lock(&udphy->mutex);
> =20

[ ... ]

> @@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This is a pre-existing issue, but does this deferred initialization handle
USB-only replugs correctly if the USB PHY remains powered on?

When a user unplugs and replugs a Type-C cable, this sets
udphy->phy_needs_reinit =3D true. However, in configurations where the DWC3
controller remains active (e.g., fixed host mode) or during rapid replugs,
the USB controller doesn't restart and thus never calls phy_init() again.

Because rk_udphy_usb3_phy_ops only implements .init and has no .power_on
callback, rk_udphy_power_on() is never invoked to process the deferred
initialization flag:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on() {
    ...
	} else if (udphy->phy_needs_reinit) {
		...
		ret =3D rk_udphy_init(udphy);
    ...
}

Will this cause the USB SuperSpeed connection to fail to train if the
cable is inserted in reverse orientation?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);

[Severity: Medium]
This is a pre-existing issue, but can this lead to a data race with concurr=
ent
orientation switches?

While rk_udphy_orien_sw_set() acquires udphy->mutex and updates the shared =
lane
and mux selections here via rk_udphy_set_typec_default_mapping(),
rk_udphy_dp_phy_configure() iterates over and accesses the shared lane state
locklessly:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_dp_phy_configure() {
    ...
		for (i =3D 0; i < udphy->lanes; i++) {
			lane =3D udphy->dp_lane_sel[i];
    ...
						   udphy->lane_mux_sel[lane]));
    ...
}

Could this cause rk_udphy_dp_phy_configure() to read partially updated arra=
ys
if the DP controller triggers link training concurrently with an orientation
change?

>  	rk_udphy_usb_bvalid_enable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D19
