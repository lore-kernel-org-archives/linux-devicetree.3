Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9FC9475
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782950932; cv=none; b=N0c49lqO8QeDRZXhhOvAqmtVWNQ6w+4EJethbGKA38dM/9rRYXR5MsRLIG+g3MYQ4jCLroWVtP458Zz//hsCsCK7Kv/NM54WkZZR0rn9/LIbylLO8J4S+4zKFjmeQlhebQ5MTTIQflZUypwgiQ20yYXXa52/xgPDqpD6tVePqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782950932; c=relaxed/simple;
	bh=ebuMN5T68NGj2SMVe/pWEYBUzstIF79r6HJ7tPgJBr4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hv1BWXj03dv7BwEYgy7CizUhIADQPLy/s696WiD2TtrbJLPtN8QjGQN8fP7f5W0KP6NLUa4RNnaHeb2XirjTrT5bfbVtpwb99vRyF3osyswjSvZtBTAa8caKsgCtyRxabHi03PDFX15b9bnqJMraXvbEVJSw8+9odtobWsQbETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxUmHHjM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxUmHHjM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415741F000E9;
	Thu,  2 Jul 2026 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782950930;
	bh=3GBHbnEuUDJymxwYTByZegdVO4PjJ9hGrWr01xx5Pjs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BxUmHHjMF/LOJ/xrpKU5TBbAvvMY2tgDMci47623RlgyOQAea8BURlfofd7mo+QpQ
	 KCKEuj+/gc8hAJ4UTBzHS3oH59aOiw6nIGr0FSqM4SBa6nkUZXW3E/mxvxnaUngJO9
	 r1OKCRVUbyCs9HHxsEWI9Lgv6RgbbnMWZneeRK2UY6WBZnWx4wjtmOyplr+DuYdval
	 zygWVGwbsYUtQf0JcKumaZuBIMTksXIHzFC/pN3EN9VYnVlrM83LzN7ZxXFokqwouQ
	 yQJ37ykkoMs8jHrNi4ZCqTf5OxxunGgrrocNZOj4yyYIN9Kw6/CrIZZvgw7EyItIye
	 amT0JA7Jl+NaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 36/38] phy: rockchip: usbdp: Rename phy_needs_reinit
 to orientation_changed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-36-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-36-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 00:08:49 +0000
Message-Id: <20260702000850.415741F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] rk_udphy_update_power_state() will unexpectedly power up the PHY a=
nd leak clock references if called when status and target_mode are both UDP=
HY_MODE_NONE but orientation_changed is true. This problem wasn't introduce=
d by this patch, but was introduced by a preceding patch in this series.
--

commit b963e04ecd7343df15170db1d1feeff729b0f62c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename phy_needs_reinit to orientation_changed

This commit renames phy_needs_reinit to orientation_changed to better
reflect its purpose, as mode changes are now tracked separately.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1020,7 +1020,7 @@ static int rk_udphy_update_power_state(struct rk_ud=
phy *udphy)
>  	u8 target_mode =3D udphy->hw_mode & udphy->sw_mode;
>  	int ret;
> =20
> -	if (!udphy->phy_needs_reinit && udphy->status =3D=3D target_mode)
> +	if (!udphy->orientation_changed && udphy->status =3D=3D target_mode)
>  		return 0;
> =20
>  	/*
[ ... ]
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
>  		/* Power up (incl. clocks) */
>  		ret =3D rk_udphy_setup(udphy, target_mode);

[Severity: High]
This is a pre-existing issue, but does this logic leak clock references if
called when both udphy->status and target_mode are UDPHY_MODE_NONE (0)?

If a Type-C cable is attached or the orientation is toggled while the DP
PHY client is powered off and the port negotiates a DP-only connection,
udphy->orientation_changed becomes true.

When rk_udphy_update_power_state() is subsequently called, the early return
at the top of the function is bypassed because udphy->orientation_changed
is true. Since udphy->status is UDPHY_MODE_NONE, the code takes this branch
and calls rk_udphy_setup(udphy, 0), which unconditionally prepares and
enables the clocks.

Because target_mode is 0, udphy->status remains UDPHY_MODE_NONE, meaning
subsequent genuine power-offs will fail to decrement the clock counts via
rk_udphy_disable(). Can this eventually overflow the clock reference counte=
rs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D36
