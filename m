Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B914499B9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625714; cv=none; b=g5siGqHyiXv8sk7zoDRzwLQvQ8vn3oCdnnFqJe4/togY554BDqkZq8U25azvlfWXt8dqs2yFWBSNdvaTu1Vpb1bfdvOoVt/0o39GsQNo/ojtkSmKMQB/BLimwxRpZx74OsHodDa9HxPopOl5SCnjhlBuCD6b7dZBTCtUzxsgFv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625714; c=relaxed/simple;
	bh=3BCbP4rZr/HuMGnAB1QxnTzUBAOgcfHWR39dHV3WPs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8o5/TnapMy3t7XUTYrNmcMvGiIafftrxunVyJbSrSVzIjUxottEp2t1Wgx1oXWA2QW59KwrCQy1AMioxwvDDHTbh7vUgT3cf2UQ9WBaLjevujumcL18+vvEyyDs+l+pBv46kigg5rL0AJZ/fQ6Ry4wSFdPzxG9Q5DpLGiu1Xm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsV5m5GK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsV5m5GK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EDA1F000E9;
	Thu,  9 Jul 2026 19:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625711;
	bh=//PSvNaFDhOc7sMde8qt3Bb/n34rOtOVhiD77ReltBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KsV5m5GKgLCOMn8vTzmoUN7noqmUvlWuVzynRRRjuVxCDXXi+fi9UDgWG3KRTKEA4
	 UaxUnViKVHdUsbi4IdPbBAtUjYxSFFOugCcewr9o9dXfoELQO6NHjvM+2LaHgvDKIb
	 289tVzcZiK7Qo2+fhO88S526ZhBj5bAFk3hUdcjn3SYER88yIzegCX+P6dEpTOuUOD
	 x3Gd+zW0fVp4QOJZPntglkc6ToWIilD5DChj51YMJjq4gP9PJOYzaWZs8RbnAuRDJo
	 CmZ5vqCQEEwjIxVl6zJvsuu/5qpKE98ft318T0I7vtGxmIwGQQt3iAUFmUt9ssUW6y
	 0MDdPIBvY6CNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 33/36] phy: rockchip: usbdp: Rename mode to hw_mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-33-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-33-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:35:10 +0000
Message-Id: <20260709193511.49EDA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] TYPEC_STATE_USB and TYPEC_STATE_SAFE mux events incorrectly config=
ure the PHY for DisplayPort instead of USB-only.
- [High] rk_udphy_power_off and rk_udphy_usb3_phy_exit incorrectly use hw_m=
ode to bypass power-off, permanently leaking the PHY state and preventing r=
k_udphy_disable() from being called.
--

--- Patch [33]: [PATCH v11 33/36] phy: rockchip: usbdp: Rename mode to hw_m=
ode ---
commit 6f61047a0ab430913024fc15e4a26038f67189e4
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename mode to hw_mode

Rename mode field to hw_mode to make clear that this is the modes
currently supported by the hardware, but not necessarily requested
by software. It is only set by either the USB-C state machine
or device-tree if the PHY is used in a fixed routing setup.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fb6eea2979b9..e2cd72643a7d7 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
[ ... ]
> @@ -616,12 +616,12 @@ static void rk_udphy_set_typec_state(struct rk_udph=
y *udphy, unsigned long state
>  			udphy->lane_mux_sel[2] =3D PHY_LANE_MUX_DP;
>  			udphy->lane_mux_sel[3] =3D PHY_LANE_MUX_DP;
>  		}
> -		mode =3D UDPHY_MODE_DP_USB;
> +		hw_mode =3D UDPHY_MODE_DP_USB;

[Severity: High]
This isn't a bug introduced by this patch, but since the switch statement l=
acks
explicit cases for TYPEC_STATE_USB and TYPEC_STATE_SAFE, do they fall throu=
gh
to the default case here and incorrectly configure the PHY for DisplayPort
instead of USB-only?

If a standard USB device is connected or the port is in a safe/unattached s=
tate,
the Type-C subsystem fires a mux event with state->mode =3D TYPEC_STATE_USB=
 (or
TYPEC_STATE_SAFE), and it seems they would erroneously be assigned=20
UDPHY_MODE_DP_USB with two DisplayPort lanes instead of just UDPHY_MODE_USB.

>  		udphy->dp_lanes =3D 2;
>  		break;
>  	}
[ ... ]
> @@ -1033,7 +1033,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
> =20
>  static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
>  {
> -	if (!(udphy->mode & mode)) {
> +	if (!(udphy->hw_mode & mode)) {

[Severity: High]
This is a pre-existing issue, but does using hw_mode here bypass the power-=
off
sequence and permanently leak the physical PHY state?

If a Type-C event changes the hardware mode to DP-only (hw_mode =3D
UDPHY_MODE_DP), the USB mode is dropped. If rk_udphy_power_off() is called
afterwards, this check will bypass physical shutdown since the requested mo=
de
was already removed from hw_mode, preventing rk_udphy_disable() from being
called.

>  		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
>  		return;
>  	}
[ ... ]
> @@ -1307,7 +1307,7 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
>  	guard(mutex)(&udphy->mutex);
> =20
>  	/* DP only or high-speed */
> -	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
> +	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {

[Severity: High]
This is a pre-existing issue, but this appears to have the same flaw as
rk_udphy_power_off() above.

When the USB consumer subsequently calls phy_exit(), and hw_mode has already
dropped the USB mode, this returns early without delegating to
rk_udphy_power_off(). If the PHY status reached UDPHY_MODE_NONE,
rk_udphy_disable() is never called, and the PHY remains physically powered =
on
indefinitely.

>  		udphy->status &=3D ~UDPHY_MODE_USB;
>  		return 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D33
