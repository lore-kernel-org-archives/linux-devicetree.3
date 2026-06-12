Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6443721773D
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781282317; cv=none; b=j70E5jWiEppVgHLUzSUiTWNv7D7XgFKbqPKsLZsdTrPkjBqMn4ZwBVFCKp9vNvXdgcw9FOQ9HMuEYSOXG2YWpzI7cnhAKw4JNM2z+w3abg4qXfo9u4kiv1mcT44ApucqsRYkkpiNQHA0IlB15PKd4bfCEjfWeb5dqvYZT7jtoDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781282317; c=relaxed/simple;
	bh=RLRsy1dM4Ror35YK6sJF2mQKlunbxTDJFwWX+fyoVoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nwb6ISZjOBmzuXANLdQ5vtnJ75hrXRAmgAwul8BaefG4bbmbhpNVCw6dihDShAP0hyJPDwSEdEaTmVYAuS+M6iYTQEYTHZyZfzVfyatSaHzkua+U83miWbzGbUc+/oXSrqE8xTleHOAV4zNaFBLo0+GW4DyH57NmUIdPW+USSpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzz6wV3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzz6wV3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5471F000E9;
	Fri, 12 Jun 2026 16:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781282316;
	bh=QUwoA2La5hrRAZoRb8RcYx50H7iw1ZedS5O39tRcvv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bzz6wV3Jk0QxRGg5BllRx3qrB0qLEBdgiffID9PbPrPgjCH10lEw2KXfG31JcHLEX
	 ezK3nhoQcaGYnJMs8SGerwOEiy6SHwlYgnLoa800drA2czsRfUL4QUjPATWzp6sWnQ
	 adcBnRYDkH89UDgzUUoei1/gGhVr/PhMC3dGYoZOpHI0gvbsoqU7MdVYWqQyVXddAX
	 PxPWwq89hBr8gUfqWa9SoLHFe/s5jD9ijQZ3QBZn0C1t+z78jbtTigdlOnUC54AX1X
	 gZ2gJxJ3syx/fKHqLLbRvWXFDuie+XNH6KpfPXaee5dzpBawg1Zugl23G7GrlSgPvZ
	 hEnuBeIzc2IJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 02/18] phy: rockchip: usbdp: Do not lose USB3 PHY
 status
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-2-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-2-efc83069869f@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 16:38:35 +0000
Message-Id: <20260612163835.8D5471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] State desynchronization on `rk_udphy_init` failure causes subseque=
nt power-on retries to falsely return success without re-initializing the h=
ardware, leading to dead PHY or bus hangs.

Pre-existing issues:
- [High] Subsystem power-off requests permanently leak `udphy->status` bits=
 if the Type-C mode has physically changed, causing a perpetual resource le=
ak of the PHY clocks.
--

commit 93e296ece1bf03449fcdb7d0485cb77da80dd9b7
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Do not lose USB3 PHY status

This commit fixes an issue where the USB3 tracking information is lost
when the DisplayPort is re-initialized. It does this by preventing the
status variable from being cleared during mode changes in the PHY driver.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index fba35510d88ce..744cc7c642f49 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1009,7 +1009,6 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			rk_udphy_u3_port_disable(udphy, false);
>  	} else if (udphy->mode_change) {
>  		udphy->mode_change =3D false;
> -		udphy->status =3D UDPHY_MODE_NONE;

[Severity: High]
If rk_udphy_init() fails (for example, returning -EPROBE_DEFER after a lock
timeout), will this lead to a permanent state desynchronization?

By removing the clearing of udphy->status, if the initialization fails,
udphy->mode_change is already set to false but udphy->status remains
non-zero.

If the subsystem later retries rk_udphy_power_on(), it will see
udphy->status !=3D UDPHY_MODE_NONE and udphy->mode_change =3D=3D false. Cou=
ld
this cause it to bypass all initialization, blindly update the status, and
falsely return success while the PHY hardware remains disabled and in reset?

[Severity: High]
This is a pre-existing issue, but removing the forced clearing of
udphy->status here exposes a potential permanent resource leak of the PHY
clocks.

Looking at rk_udphy_power_off():

	if (!(udphy->mode & mode)) {
		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
		return;
	}

and rk_udphy_usb3_phy_exit():

	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
		return 0;

If the Type-C multiplexer switches from DP_USB to a DP_ONLY mode,
udphy->mode loses the USB bit. If the USB controller then unbinds and calls
phy_exit() while in DP_ONLY mode, the early returns above prevent clearing
the UDPHY_MODE_USB bit from udphy->status.

When DP eventually powers off, will udphy->status remain non-zero due to
this orphaned USB bit, preventing rk_udphy_disable() from ever executing
and leaking the PHY clocks and power?

>  		if (udphy->mode =3D=3D UDPHY_MODE_DP)
>  			rk_udphy_u3_port_disable(udphy, true);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-rockchip-u=
sbdp-cleanup-v5-0-efc83069869f@collabora.com?part=3D2
