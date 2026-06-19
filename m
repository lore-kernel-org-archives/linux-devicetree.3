Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E872391E77
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884435; cv=none; b=oGcgZbXNxnA5w1aA2ByGnFEdqCRPspZ2LaT7X3c1ZLGfOxMTyDxiZ81oo6HExSA4W8zo9du9QkMS7hyhz9nAteI6RyZNQOtUY+0D3B9X5xh73WHdqJ3WBk/6i0zenUj/IkwbIgskgCtWJKUQKYAfXPZ8+nwKRI3Kgj9ZLvgDGlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884435; c=relaxed/simple;
	bh=RJpMQlPPSaRdhNjWSzNuAlRuihIxjzdSjGyXme1V5Xk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W776x1BLXEDlnEx1oNewHzo/avJxhq9oUr52KxbRqfRb1nFGGlejBDiVIBBiNryh1YkZKR2+di8kR0Gi94u+aFGydZ7cxjee2UxSuPGM8w6foNnGxk9r9y0ssvFLS2fXHb2IJGUchQjHveaWPyg/Em4IRZvNpoutT4wbUz/BDLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cnCHxp0v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cnCHxp0v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D26E1F000E9;
	Fri, 19 Jun 2026 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884429;
	bh=Ch1IXfBaGeNuff+ir6cUHYNM0gw+J62FEjZ7EvLU8Bo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cnCHxp0vX3EpvpigQP5yGNuY7p/P+1kG4Pl7poBoi0NV64vhyr3EBMWJknzRmNO7r
	 YaLC8Jz+icEftibxBEL21dE7ynWMrlt9jUTUMQ+nbNEAQy1LCWbHSYx4PYnnnkfU91
	 88xu1fGw5IdkTxA0D690mhRKI9eYSuqJpeiyO8RIqtIRo5WGi3NvjC1Q0Gv8ygnBcC
	 iM3lZ29DmK23EJw5dO3SJxCcCkr10ARmajXYus0+zqh4HKuxCuF3Rb6IzJfyykma4P
	 6iVPoHUDcY0RPJYN2dN92QGr8vP/Z2oNWGc3SrmYeTA3LrYMoOEVskIsW0zL/hG68w
	 ETgJm/bPcpuyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 18/23] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-18-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
 <20260619-rockchip-usbdp-cleanup-v6-18-3bb1f54b3f35@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:53:48 +0000
Message-Id: <20260619155349.0D26E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing Hardware Initialization
--

commit 2a50b346fcf7d166779e0cb198d3572f5bdd300c
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

This commit updates the cable orientation configuration to re-initialize
the PHY when the orientation changes. It sets a flag to trigger the
re-initialization to prevent DisplayPort functionality from breaking on
reverse cable plugs.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index c210aaeb283a5..402f3cafcf0ae 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -622,6 +622,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_=
dev *sw,
>  				 enum typec_orientation orien)
>  {
>  	struct rk_udphy *udphy =3D typec_switch_get_drvdata(sw);
> +	bool flipped =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> =20
>  	mutex_lock(&udphy->mutex);
> =20
> @@ -633,7 +634,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This is a pre-existing issue, but does setting udphy->phy_needs_reinit =3D =
true
here actually trigger a hardware update for pure USB3 connections?

When a device is plugged in, the hardware lane muxing is typically updated
inside rk_udphy_init(), which is called conditionally by rk_udphy_power_on(=
).

However, looking at the phy_ops struct for USB3:

static const struct phy_ops rk_udphy_usb3_phy_ops =3D {
	.init		=3D rk_udphy_usb3_phy_init,
	.exit		=3D rk_udphy_usb3_phy_exit,
	.owner		=3D THIS_MODULE,
};

Because rk_udphy_usb3_phy_ops omits the .power_on callback, and the DWC3
controller only calls .init once during probe, the USB subsystem won't
trigger the PHY re-initialization required to apply the orientation changes.

Will the phy_needs_reinit flag remain set indefinitely, causing pure USB3
devices to fail to link at SuperSpeed if plugged in the reverse orientation?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-rockchip-u=
sbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com?part=3D18
