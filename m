Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE2449990
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624709; cv=none; b=ZOkobb2GatwltOKOYw76Fi1KbwVz/R+n1K+5N1kk+/M/46+BF7beuP2jL2Ic+kuU5K8szZ3hqIwZpWeWDaeJpJEyZCjKfazqKgx2pyVDjajgi3kx+9mYB7JuCSPrtp47lK/ZKQGcmDGz9GNV43kM/MMuYzmZSXoNu+4SbPH2PnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624709; c=relaxed/simple;
	bh=Ig1r9p1Z+FUPDZwXV940iwqpp1f+SwGSC0/u1O4y+nk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UoIFt7Z4fXRtycNXFHjEfWGni9Rkc9LKvX+LM/2IUzw3mVBC+9WOaI13GfO76+l5tKYMxMvJhHaRjQTPO+bp85GaVh95Q+sXjpFD0N3g6UUPkKlh3qZCcVZ9w4mVFlXeA1opmjpfAm/1QHHePKEq1hVz7pEkr0/nkGkhMfmZJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eATCDbB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eATCDbB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080291F000E9;
	Thu,  9 Jul 2026 19:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783624707;
	bh=WsrB3XUH4fJ4nQ7zyDo33pCbgs15xIKA0URJ9X4XOMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eATCDbB/EF90iE7Jfoliqb1QuF9pU5J70z+BSgzzDxBBbxkQveCeIkZuY5t9dD60A
	 xWz2teVTqbzjdWHAGrWrMPrFjQC8G1qwcTH3gZKp8ROXgvpGENe/tL6V6335hlWPEl
	 96gM4UDLM3m8lgGkN6JqYlAP5XGSzKbRdlvad9p1j+vCfKnWi7zAfUhZjp5StjIHak
	 5p9ac1EX2sLl/gGiyJnlGLP2hoOunruOCsKqDkby5xpVkKsdH4wkkSo6COpU79Wxqx
	 llR/8dSMoZQxrCQMZG/J5F3RMjgzbUKyRNAGXT5OK22CVsvvdnSQMG22zSN9VjD9P3
	 mTvJ+gBfHxo3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 07/36] phy: rockchip: usbdp: Keep clocks running on
 PHY re-init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-7-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-7-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:18:26 +0000
Message-Id: <20260709191827.080291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The USB3 (U3) port is not re-enabled when the PHY dynamically swit=
ches from DP-only mode to DP+USB mode, breaking USB3 functionality.
- [High] PHY clock and power leak due to early exit during power off based =
on current mode instead of active status.
- [High] The DisplayPort PHY init function fails to replay a cached HPD (Ho=
t Plug Detect) event if the Type-C cable was connected before the DP contro=
ller probed.
--

--- Patch [7]: [PATCH v11 07/36] phy: rockchip: usbdp: Keep clocks running =
on PHY re-init ---
commit 79bb98238750965863b0b02f66603b673864fa91
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Keep clocks running on PHY re-init

This commit optimizes PHY re-initialization by avoiding the redundant disab=
le
and re-enable of clocks. Instead of calling rk_udphy_disable() and
rk_udphy_setup(), it directly calls rk_udphy_init().

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 6cb9f6b4dbf6d..e3f5a26c876a5 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -987,8 +987,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, =
u8 mode)
>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
> =20
> -		rk_udphy_disable(udphy);
> -		ret =3D rk_udphy_setup(udphy);
> +		ret =3D rk_udphy_init(udphy);

[Severity: High]
This isn't a bug introduced by this patch, but does this logic leave the US=
B3
port disabled when dynamically switching from DP-only back to DP+USB mode?

When the Type-C mux transitions from DP+USB to DP-only mode,
rk_udphy_power_on() executes rk_udphy_u3_port_disable(udphy, true) because
udphy->mode =3D=3D UDPHY_MODE_DP.

If the mux later switches back to DP+USB mode (where
udphy->mode =3D=3D UDPHY_MODE_DP_USB), rk_udphy_power_on() is called again =
with
udphy->mode_change =3D=3D true, but there is no corresponding
rk_udphy_u3_port_disable(udphy, false) call here to re-enable the U3 port.

Consequently, the USB 3.0 port appears to remain disabled in the GRF regist=
ers
until a full PHY power cycle.

>  		if (ret)
>  			return ret;
>  		udphy->mode_change =3D false;

There are also two other pre-existing issues in this file that might need
attention.

[Severity: High]
This is a pre-existing issue, but does rk_udphy_usb3_phy_exit() permanently
leak PHY clock and power resources if the Type-C mode changes before the USB
controller exits?

If the mode changes (e.g., from DP+USB to DP-only) before the USB controller
calls phy_exit, the mode will be updated. When rk_udphy_usb3_phy_exit() is
subsequently called:

static int rk_udphy_usb3_phy_exit(struct phy *phy)
{
	...
	/* DP only or high-speed */
	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		goto unlock;

	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
	...
}

Since udphy->mode was already updated, this condition evaluates to true,
causing an early return. The UDPHY_MODE_USB bit is never cleared from
udphy->status, permanently skipping rk_udphy_disable() and leaving clocks
running even when all devices detach.

The same logic flaw exists in rk_udphy_power_off():

static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
{
	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return;
	}
	...
}

Checking udphy->mode instead of the active udphy->status prevents the status
bit from being cleared.


[Severity: High]
This is a pre-existing issue, but does rk_udphy_dp_phy_init() silently miss
the initial connection event if the Type-C cable is connected before the
DisplayPort controller driver probes?

When a connection occurs, rk_udphy_dp_hpd_event_trigger() is called:

static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
{
	...
	udphy->dp_sink_hpd_sel =3D true;
	udphy->dp_sink_hpd_cfg =3D hpd;

	if (!udphy->dp_in_use)
		return;

	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger,=
 hpd);
}

If the DP controller hasn't probed yet, the event is merely cached and not
written to the GRF register.

When the DP controller later probes and calls rk_udphy_dp_phy_init():

static int rk_udphy_dp_phy_init(struct phy *phy)
{
	...
	udphy->dp_in_use =3D true;
	...
	return 0;
}

The init function sets dp_in_use to true but never checks or applies the
cached HPD state (dp_sink_hpd_sel and dp_sink_hpd_cfg), leaving the display
blank until a physical replug.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D7
