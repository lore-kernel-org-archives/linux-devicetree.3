Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FD7280CD2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624762; cv=none; b=L/WmwfO1NKc0xql7UqGrvx9peJivvr1povASgPrr2WgMsQOsv6j65UdyN4thCmfH3D7xpxH9fvBOogtq9h+nlUTDUlJOFYBv1iElCGWio7xEj1jh5b+4gG6BK9oTzu1XSbTv6Bcyqpp04oGWm4g1zJsCzU9uHleKHvnwF0lbzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624762; c=relaxed/simple;
	bh=gy9Psq+WkrGwUJ4kFQTsXxJhTt5sk7jRbqPEn49h/5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UY2qXKfNNjgZ12m9YHVClyxRsjECd7myJ2nY28v9q5PVFgutUVtzn0uPLw2zhWB48AcSM53FjdZkO17xF8phxEaFYjx9iv8NruqENkT9I3MiT/L961Loo3qWqNb8L+GJcdAgUxDdQGgeL1q3ujjxgICdIITaDaFAyOd8Yd4SfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wvf9SBdI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wvf9SBdI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B57BB1F00A3A;
	Thu,  9 Jul 2026 19:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783624761;
	bh=pDvZhuofFrlkfjiDZi9AXre9u3QgK/BBazHm7A9fn4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wvf9SBdIC3Pn1TbcIsYn/UuU/MmlYyTdTO85VxnlnSQXpSYDceFSNO/4/ERszzupV
	 HkkHoBkVHhGKC5Plt1YyRFQCOZ8glEUENKc5yuHg1CwMiY/+CibW/SZp/XJ9sNViDl
	 vPMzYEN/QQca2T6Kv88b3GePm30Gq8rZYXJfMq453BUcKgYMCSHEAuFrhBiJsHK7sL
	 VkCPuV1C5hQqst16NZ9Ts2MFzYO3YEqDtgeTge1ywcJCxYeEjlBNytct70/KAwG/ja
	 9ARbpaC2egA9SWMh7OlSnz7zBUfyYhCw+NBaVnenBwC2ZfDqJVYSwMZIkOxkE7jdff
	 LVX7pu6n53wnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-3-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-3-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:19:20 +0000
Message-Id: <20260709191920.B57BB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Preserving the USB status bit during a mode change to 4-lane DP pr=
events the PHY from ever powering off, breaking system PM.
- [Medium] Removing the unconditional clear of `udphy->status` introduces a=
 state desynchronization and unbalanced clock disable bug if `rk_udphy_setu=
p()` fails during a mode change.
--

--- Patch [3]: [PATCH v11 03/36] phy: rockchip: usbdp: Do not lose USB3 PHY=
 status ---
commit 183c8937bbbbcb2c04198e33a8cf6f50111a49a2
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Do not lose USB3 PHY status

By default DWC3 requests the USB3 PHY once and keeps it enabled all the tim=
e.
When DisplayPort is being requested later on, a mode change is needed which
re-initializes the PHY. During re-initialization the status variable has
incorrectly been cleared, which means the tracking information for USB3 is =
lost.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index a5ffdf7a6e76b..12dfdd470a782 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1008,7 +1008,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->mode_change =3D false;
>  	} else if (udphy->mode_change) {
> -		udphy->status =3D UDPHY_MODE_NONE;

[Severity: Medium]
If rk_udphy_setup() fails during a mode change, could this lead to an unbal=
anced
clock disable?

rk_udphy_power_on() calls rk_udphy_disable(), but if rk_udphy_setup() fails:

	} else if (udphy->mode_change) {
		if (udphy->mode =3D=3D UDPHY_MODE_DP)
			rk_udphy_u3_port_disable(udphy, true);

		rk_udphy_disable(udphy);
		ret =3D rk_udphy_setup(udphy);
		if (ret)
			return ret;

it returns early without clearing udphy->status since the unconditional
reset to UDPHY_MODE_NONE was removed.

Later, if rk_udphy_power_off() is called to unwind, it clears the old mode =
bit
from udphy->status, reaches UDPHY_MODE_NONE, and calls rk_udphy_disable() a
second time on already-disabled clocks.

[Severity: High]
Does preserving the USB status bit during a mode change to 4-lane DP prevent
the PHY from powering off?

When Type-C negotiates 4-lane DisplayPort, udphy->mode is updated exclusive=
ly
to UDPHY_MODE_DP.

Because the reset is removed here, rk_udphy_power_on() preserves the
UDPHY_MODE_USB bit in udphy->status when it updates the mode:

	udphy->status |=3D mode;

When the USB subsystem suspends and calls rk_udphy_usb3_phy_exit(), it
performs an early bailout:

static int rk_udphy_usb3_phy_exit(struct phy *phy)
{
	...
	/* DP only or high-speed */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		goto unlock;

This leaves the USB bit permanently trapped in udphy->status.

Finally, when DP is powered off, udphy->status resolves to UDPHY_MODE_USB,
which skips the physical rk_udphy_disable() call and leaves the PHY running.

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D3
