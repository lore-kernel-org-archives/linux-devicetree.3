Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866DB391E7B
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884223; cv=none; b=G3RvocN4F51/0MxIcIfA0t07Q/jb11nkG6d6zQduEAyPiwT7qrNF+XCbMpxBLlXKr90hD5yySSOLX8fZ01L9M9jMx2DcrKKIUq4Wwp4EGNBw6xBvkLMRIhefDmdMwZs38rf4DQ4g2pdrAtux7ZosOvkdvepyg7fWFGePejT2n5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884223; c=relaxed/simple;
	bh=TTjKUrb7ZSkaPK1Td8vnCEYp8e5zp2kFoNA6DeiQtLg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kkGVtCpdO1R5UXtDCFt8IEtBdrNgYYv9iJvFX7JyER0j9DYaZNJndXsc5w9k71VXPvCjoo0vlJ7vpTrEpmrIgaHslT9l6VpFaSS88LSdujYJPOljUOeN5KL7HazEUvZ1qNwmGkeC+u4q0YU+CMe9mrIk2EYZbTCQ7tkxJkZuPRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATck1WP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATck1WP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7361F000E9;
	Fri, 19 Jun 2026 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884221;
	bh=1KvQgX8Mt6MMz28IkS5EbsgiiuX0uc0jyn+gHbQ2bqA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ATck1WP4MCrlCVQhb41eKpRBb1jvqUKUHfnCwLF9kiNanbNuj2zCULBGxGIqiqleI
	 oDT3y2AiywprdZZ6eGbsPh5KgcgJPtgLp/x0ssQwRus+db51VkUuyGuhscFExGeZPR
	 XcSvMj7ixw9Tse/4zLD/fHIPIX9ef4C3zQbzaKg93R6vxkjbaGdeIT9x0xWzQiScr1
	 k6cj+72RGpfYj9hW/CtgeRP/1pEo29pqFbi6lF4rrYACczo1rECtKtwKj8GdDnzaus
	 agsIZphUkK38vkr6nnP3tKNL1RRSl7nvP2d56Qjh7+J3dO0HTdJmWQy/p85kdXYtOg
	 Q2aeC9rtJ945g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/23] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-7-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
 <20260619-rockchip-usbdp-cleanup-v6-7-3bb1f54b3f35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:50:20 +0000
Message-Id: <20260619155020.CC7361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Type-C mux callback completely ignores non-DP AltMode events, =
failing to reset lane mapping on AltMode exit.
- [High] Asynchronous `udphy->mode` updates cause `phy_exit` and `phy_power=
_off` to skip teardown, resulting in permanent clock and reset leaks.
--

commit ea283780e749d528861fc2fe55f998d22454a53b
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Keep clocks running on PHY re-init

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 6dff4dfc9363e..c05ee65a9f73a 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1011,8 +1011,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);

[Severity: High]
This is a pre-existing issue, but the Type-C mux callback completely ignores
non-DP AltMode events, failing to reset lane mapping on AltMode exit.

When exiting DP AltMode (e.g., via sysfs or renegotiation without a physical
cable unplug), the Type-C subsystem calls typec_mux_set() with state->mode =
=3D
TYPEC_STATE_SAFE or TYPEC_STATE_USB and state->alt =3D NULL.

However, rk_udphy_typec_mux_set() immediately returns 0 if !state->alt:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_typec_mux_set() {
    ...
	if (!state->alt || state->alt->svid !=3D USB_TYPEC_DP_SID)
		return 0;
    ...
}

Does this leave udphy->mode stuck in the previous DP configuration (e.g.,
UDPHY_MODE_DP with 4 DP lanes), which breaks subsequent USB3 initialization
because rk_udphy_usb3_phy_init() checks udphy->mode and skips powering on
the U3 port?

[Severity: High]
This is a pre-existing issue, but asynchronous udphy->mode updates cause
phy_exit() and phy_power_off() to skip teardown, resulting in permanent clo=
ck
and reset leaks.

udphy->mode tracks the target hardware mux state and is updated asynchronou=
sly
by Type-C events. However, rk_udphy_usb3_phy_exit() checks this current
udphy->mode rather than the initialized state (udphy->status) to decide
whether to power off:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_usb3_phy_exit() {
    ...
	/* DP only or high-speed */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		return 0;
    ...
}

The phy_power_off() implementation also suffers from this flaw,
short-circuiting before it can update udphy->status and tear down resources:

drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_off() {
    ...
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return;
	}
    ...
}

If the Type-C mux switches from a DP+USB mode to a DP-only mode while USB3
is active, UDPHY_MODE_USB is cleared from udphy->mode. When the USB3
controller later shuts down and calls phy_exit(), rk_udphy_usb3_phy_exit()
sees the bit missing and returns 0 early, skipping rk_udphy_power_off().

This prevents UDPHY_MODE_USB from being cleared from udphy->status. When the
DP controller subsequently calls phy_power_off(), udphy->status remains
non-zero, skipping rk_udphy_disable().

Since there is no driver removal cleanup fallback, do the clock enable
references get permanently leaked?

>  		if (ret)
>  			return ret;
>  		udphy->mode_change =3D false;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-rockchip-u=
sbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com?part=3D7
