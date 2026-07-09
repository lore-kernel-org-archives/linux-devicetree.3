Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91F3B42D6
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625186; cv=none; b=pdbcYzuGei5MY04MTsGYWlNkn8juokR9xqwgsJRDas8amtVOVwDuurb8F9qIGczq+KivYYVKyUJv3zc9DT2mJ96cjzjyjF7E2f/tHt1sugdI/zI6+QNvqVIAtakUArHcol/VEgRIdwB7+PWFHWc7M+hLdnf+ykmcmLH3vjiV5RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625186; c=relaxed/simple;
	bh=h5tNGe0Rqw/f/AVHpMuIwWbNTpca0caCMRvaa/h0gnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fzu5HK8QpnPGvqKzQGlSj3sGAQRDAcjOdyGv0wuuJVbzPeKou2Xz1bhs1rDlc54vqjkw8yio987nwemLDvKLIWGh0qF1Xx84YhHxKfB8BNLhyg4zQmKNbqAX+srIT+Ut943eNePzHQi7Svw41HK2x+ChMHwuO+p7RHNn5fJ9/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJaA6s9l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJaA6s9l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294D81F000E9;
	Thu,  9 Jul 2026 19:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783625184;
	bh=f/V8UmMi87TKTb0msRzTC4tzI6eIXmFO3rct+enhaR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJaA6s9ldubRTi8sBBVSjcXqwrp1+tDAGjtMp6Bl72CuNERtPKPhfWyNTUCK5cYga
	 fLUsOfL4ORYZ2I4jIVtY/Gby7Sp4bR1p3/QZpE0IMO+648L4UYC3WYH0eZbVBGTI6S
	 r01zQfSraIWKgc+yWn1eYXgHWd8Zsb+fmhV9uIIIrXMV1qhh2d5lcpoOmHsR3dznRD
	 4ruNPKY+20lTu/j5ZrpV24W2EWMyX7NweLWeFs7LYFE2et2AKYZrFdMxwkvHG4brkq
	 CRaaQyeDxjcG/igIpITGiaoNkHVKWEQ3VCqJ9E40AHxaf5ESfy/3Xyq6k3k3rBi8/D
	 +HvC17jhthx/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 19/36] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, vkoul@kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-19-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-19-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:26:23 +0000
Message-Id: <20260709192624.294D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The USB 3.0 PHY hardware is not re-initialized during an orientati=
on switch for USB-only devices, causing USB 3.0 to silently fail.
--

--- Patch [19]: [PATCH v11 19/36] phy: rockchip: usbdp: Re-init the PHY on =
orientation change ---
commit 68cb52c178c7db7d63bbe3d9ed1bf373d3c040be
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Re-init the PHY on orientation change

This commit updates the Type-C orientation switch callback to track cable
orientation changes. It sets a flag to trigger PHY re-initialization when
the cable is flipped to fix DisplayPort functionality.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
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
> @@ -631,7 +632,10 @@ static int rk_udphy_orien_sw_set(struct typec_switch=
_dev *sw,
>  		goto unlock_ret;
>  	}
> =20
> -	udphy->flip =3D orien =3D=3D TYPEC_ORIENTATION_REVERSE;
> +	if (udphy->flip !=3D flipped)
> +		udphy->phy_needs_reinit =3D true;

[Severity: High]
This is a pre-existing issue, but does this actually fix the orientation sw=
ap
for fast replugs on USB-only devices?

If a user rapidly unplugs and replugs a Type-C cable upside down, the DWC3
controller's 5-second runtime PM autosuspend delay means the PHY active sta=
te
is not dynamically cycled via phy_init or phy_power_on.

Because rk_udphy_orien_sw_set() only sets a deferred phy_needs_reinit flag,
the hardware lane muxing will remain stuck in the old orientation if the PHY
is already active. This causes USB 3.0 connections to silently fail and fall
back to USB 2.0 speeds.

Is there a mechanism to force the hardware re-initialization immediately if
the PHY is currently active during this swap?

> +
> +	udphy->flip =3D flipped;
>  	rk_udphy_set_typec_default_mapping(udphy);
>  	rk_udphy_usb_bvalid_enable(udphy, true);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D19
