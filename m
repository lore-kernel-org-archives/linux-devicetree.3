Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA75E63B9
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 00:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782951134; cv=none; b=HOkKLfciR+Q5ICzjbERzI6U941kcdcUR/EegcR4zIye9D4gNfqVm8C+FX7lPWtg8+ASCUo3rNACvPYJFHpem4zsf4xPKZ/8IDUjU2Ie4tu3cO+XNBI73DH3V43KfkK9sO6+qHZcVab57hX+476pNZLb+FacXLZ8ek6W11Ubu8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782951134; c=relaxed/simple;
	bh=sIdQ0Kw/PcM1dkIMVk47vT3Y8R4fqSOir3d/3YsWmJA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GH71YMDFG1Savj0Ump5f40iqXw9lKy3iPEoS24Vw3E1ewdogXdF9G22WAJ841NppQa9s2ih/+qmXIJQUfqDcslqdLCD5p26/Cs/IHqswip5qA6KLrrS/znIH5TfoScbR+qwrIsHlLZGmHhFjuTI7mH0eJGEDV+2JIrV4FMDLUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1rFURwy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1rFURwy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2D91F000E9;
	Thu,  2 Jul 2026 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782951132;
	bh=T73oHlPSx5J6i0sPi8/MKT318vDDBC6kL8Kyz/7zLSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b1rFURwyBJXWt6TVGcS2pstypMI3pkol5MXCqAQ1Tex/G4tWhqC68z8L/u3t457Xn
	 /AVRudQI9htax8iBQOElsEp4W7fJaihbBJcC4YkbW3TQZWKzTAqUAOIJ0KLaAbPreC
	 7+ak2yBCjs+HoZgBdwDCz59chs3EP6psQdYhjdvfcHtOYRHiBxpwOOUNCGxUOXcSKE
	 3M1URRdUNkkM46xYmTh7SJaVVhVavEUGR2CmgT2LQtc11ccuwZeH3xlfMVXgaDaG1l
	 /WV20wYa0NcJ1jfMITXvbMhE0lG6pxRnPgjvIj/yEbGpY+t/3Hbu7T8a4T6EwF6SLz
	 gPluLRNJ864uQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 37/38] phy: rockchip: usbdp: Re-init PHY on mux
 change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-37-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
 <20260702-rockchip-usbdp-cleanup-v9-37-e31efbb62d2e@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 00:12:11 +0000
Message-Id: <20260702001212.1C2D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The return value of `rk_udphy_update_power_state()` is ignored in =
`rk_udphy_typec_mux_set()`, silently masking hardware initialization failur=
es from the Type-C framework.
- [High] A logic flaw in `rk_udphy_update_power_state()` causes a permanent=
 clock reference leak and PHY state desynchronization if a mux change occur=
s when no PHY consumers are active.
--

commit 53a5cecf0aaba3a0de5eba24ab8177288b8ff3ea
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init PHY on mux change

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized when cable
orientation changes or when switching from DP-only to a mode with
USB support.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 735ce1bfac7af..d056da53cb1c8 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1372,6 +1372,8 @@ static int rk_udphy_typec_mux_set(struct typec_mux_=
dev *mux,
> =20
>  	rk_udphy_set_typec_state(udphy, state->mode);
> =20
> +	rk_udphy_update_power_state(udphy);
> +

[Severity: High]
Is it safe to ignore the return value of rk_udphy_update_power_state() here=
?=20

If hardware setup steps like PLL lock timeouts or clock enablement fail, the
error is discarded and the Type-C framework is left unaware. Could this lead
to asynchronous SErrors or kernel panics if the DWC3 controller is accessed
while the PHY is broken or disabled?

[Severity: High]
Does calling this function during a mux change when no PHY consumers
are active lead to a permanent clock reference leak?

If a Type-C mux or orientation change occurs while no PHY consumers are act=
ive
(for example, the DP driver isn't bound or USB is in runtime suspend),
udphy->sw_mode is 0, making target_mode 0.

Looking at rk_udphy_update_power_state(), it bypasses the early exit because
udphy->orientation_changed is true. Since udphy->status is 0, it calls
rk_udphy_setup() which increments clock refcounts:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_update_power_state() {
    ...
	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
		/* Power up (incl. clocks) */
		ret =3D rk_udphy_setup(udphy, target_mode);
    ...
}

It then assigns udphy->status =3D target_mode (which is 0). Because the sta=
tus
remains 0 despite clocks being enabled, the next time a consumer activates
the PHY, rk_udphy_setup() is called again, double-incrementing the clock
refcounts.=20

During teardown, rk_udphy_disable() would only be called once, preventing t=
he
SoC from entering deeper low-power states. Can this logic be adjusted to
properly track when clocks are enabled or avoid enabling them if target_mode
is 0?

>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-rockchip-u=
sbdp-cleanup-v9-0-e31efbb62d2e@collabora.com?part=3D37
