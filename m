Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF0634CFAB
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 06:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786687942; cv=none; b=l+NtlO8srwgwK8kwuVxp6hmvCBHwbWYQhfqR+rV9+Lf2Qt9RtgahgRPtmbMAs3fMUmj7vasX2tU7YXUvP43/G6CAkoTGA10vWzWqeddFVjM/cNawhbNLMobyHACBqGJupsagOVZMEWS/JryKkaWCo/NAbyHM/hDfuJqrNX6ga50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786687942; c=relaxed/simple;
	bh=10Kv2FmJUnjrrO2pajAEBNT0DNrUDPOaOU1/K3fMwlA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sS8l82b3L3iJyvupxJTJwLG4U0N5k/90QZPr4xyY73Dm7a0OSGadOPJUZeGTIGa8zverhnG2cEEL4qKhAcMwTjOxsVmAKPwYLcqz4GbkXbQ7EL2E/SvLnC8Cb59vf8cx5m4NU9PgzbEn5mIgi//J1NYbE5ROXYZGA2bu6pUUBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0Ngs/3y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0Ngs/3y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A8541F00A3A;
	Fri, 14 Aug 2026 06:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786687940;
	bh=0QGhHeW9YcqLHztoxW0E6BfBeGTn/wrVNhcdEL0Ua7M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0Ngs/3yTE6GZSGPhauxuCzhoYh4VfapjNAbSzOsx81lK1fOQEiipzblYlHdnwtLN
	 gQH4Ga0tdL2CB5ymqC7l23rQF0OY0V/fJnqvPlLfRU+OBuVv5z1c1UE2MQEM0G7Qis
	 dClOio56R832WXNV9gmf6qBonMg6LkQDwJLqWffo840q9aUxxp750cqcE6pTt5vDFK
	 dqYLflwtFjjkuQZov20b0+Q69aecove1Pm4lV7oxYiOkWWFYw9SxTRuV02EFWQ/5P9
	 sSgeadDO1/NA6LEduXuYNL6Rftcnd+AuM+ny9nmFXsOJs9+7UVKGAIgKclA5JT5ktE
	 MUeV5Y0agpgCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 33/38] phy: rockchip: usbdp: Add phy reset
 notification support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-33-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-33-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 06:12:16 +0000
Message-Id: <20260814061217.3A8541F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbalanced PM runtime reference decrement in the DWC3 PHY reset no=
tifier due to mishandling of `-EINVAL`.
- [High] The PHY reset notification handler in the DWC3 Rockchip driver acc=
esses `dwc->gadget` without adequate synchronization, leading to a potentia=
l Use-After-Free during a concurrent USB role switch.
- [Medium] The return value of `phy_notify_reset(..., PHY_NOTIFY_PRE_RESET)=
` is ignored in `rk_udphy_power_on()`, potentially forcing a hardware reset=
 even if a consumer rejects the request.
--

--- Patch [33]: [PATCH v14 33/38] phy: rockchip: usbdp: Add phy reset notif=
ication support ---
commit 101376e3124c8975c12127c9a52db0a5300092c4
Author: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: phy: rockchip: usbdp: Add phy reset notification support

To resolve issues with running into permanent cmn ana lcpll lock timeout
errors after a few device replugs, this commit adds support for reset
notifications. These notifications will be handled by the DWC3 driver to
gracefully handle the PHY being disabled. This avoids corrupting the
controller's internal state.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 59b836a3796ce..21f282216aef7 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1005,24 +1005,39 @@ static int rk_udphy_power_on(struct rk_udphy *udp=
hy, u8 mode)
>  	}
> =20
>  	if (udphy->status =3D=3D UDPHY_MODE_NONE) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> +

[Severity: Medium]
Is it intentional to ignore the return value of phy_notify_reset() here?

In rk_udphy_update_power_state() the return value is checked and propagated,
but here the reset proceeds even if a consumer rejects the request. Can this
force a hardware reset when the consumer is unready, risking state corrupti=
on?


[Severity: High]
Does triggering this notification expose a PM runtime usage counter underfl=
ow
in the DWC3 driver?

If the PHY mode change triggers a PRE_RESET notification while runtime PM is
disabled for the device:

drivers/usb/dwc3/dwc3-rockchip.c:dwc3_usb3_phy_notify() {
    ...
    ret =3D pm_runtime_get_if_active(dwc->dev);
    if (!ret)
        return NOTIFY_OK;
    ...
}

The pm_runtime_get_if_active() call returns -EINVAL if PM is disabled. Beca=
use
this is non-zero, the driver bypasses the !ret check without incrementing t=
he
usage count.

However, during POST_RESET, it unconditionally calls:

    pm_runtime_put_autosuspend(dwc->dev);

Will this internally force a decrement of the usage count and cause an
underflow?


[Severity: High]
Does triggering this notification also expose a potential use-after-free in=
 the
DWC3 driver during a concurrent USB role switch?

When the POST_RESET notification is handled, dwc3_usb3_phy_notify() drops
the lock and calls dwc3_rockchip_vbus_handler():

drivers/usb/dwc3/dwc3-rockchip.c:dwc3_usb3_phy_notify() {
    ...
    spin_unlock_irqrestore(&dwc->lock, flags);
    dwc3_rockchip_vbus_handler(dwc, dwc_rk->role =3D=3D USB_ROLE_DEVICE);
    ...
}

Inside dwc3_rockchip_vbus_handler():

    if (!dwc->gadget || !dwc->gadget_driver)
        return;

    usb_udc_vbus_handler(dwc->gadget, present);

Since this runs asynchronously, a concurrent USB role switch to host mode
could trigger dwc3_gadget_exit(), which unregisters and frees dwc->gadget.

Is there a time-of-check to time-of-use window between the NULL check and t=
he
dereference of dwc->gadget?

> +		rk_udphy_u3_port_disable(udphy, true);
> +		udelay(10);
> +
>  		ret =3D rk_udphy_setup(udphy);
> -		if (ret)
> +		if (ret) {
> +			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  			return ret;
> +		}
> =20
>  		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
> +
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
>  	} else if (udphy->phy_needs_reinit) {
> +		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
> +

[Severity: Medium]
Similarly here, the return value of phy_notify_reset() for PHY_NOTIFY_PRE_R=
ESET
is ignored before proceeding with the hardware reset. Should it be checked?

> +		rk_udphy_u3_port_disable(udphy, true);
> +		udelay(10);
> +
>  		ret =3D rk_udphy_init(udphy);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D33
