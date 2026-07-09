Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549933AC0C9
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624790; cv=none; b=vDaOCTDVZYJ0ZFg3rYqhSklHSZ1ARyGlyuNNJSdCtsd7+u/d6Ra2JiulFKOcmpoYnb8WS6iPiXU3JkXkpGbxqB3h3h+GBtCNxmMOf3w/7yPItUUQEjmvkf/Ruy+U3uofqXZLqpZnan29JOkJXosldokxPBLbEFrNXdfsZ/R4WoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624790; c=relaxed/simple;
	bh=DlMrOzlfJEdCa8wkqHwcRpgQFhe6MsyxnrXWMSiV9ro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nfqXXO02uIS2Uy6clkWYy3haAAqVVn1KomMSv6JFJaB/UaBGYbHt89V3bq8Ay20jlsZbs9I9G3UYFQ1pZ5NnxVqlQ4iT35lD4zgcg+DtfCeV1SRt69XRxOzi0+ib6bwpF2TP52/xVW8gBqbwZLqc5GAZdhVcMmg+1z6P8fR1CIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nETXf4fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nETXf4fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794A61F000E9;
	Thu,  9 Jul 2026 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783624789;
	bh=3CjEJdRn0UIWts05HSYdcEDNDG0EozPTMrCsJizSYRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nETXf4faBIAYo3uFRBW3JLCJYOGuHor8ba0FcO+7DV0VwK4SzYwq6Kp2wULquqzaO
	 rGGqcjh7+K+p3zC+NbzfreYEkZepK8Z2JIKw2FcVe5BN6IgB0R4Aq2ZVMVNfnvPz2j
	 nkOU58LMLLVAa8EIJ0cCHWgCW+txa7FxwXlocxrXKHRun9i7x3AvD4L4JrExFMieZy
	 MEDjQdYmThA/Bne5Il7XJHmCugikwD1lyfbbwSCIRFyfPTqWcN3ORsIDrrwCBj8G6D
	 P6CVLTAAullCAe53dETgOv3T3dGVQvoJGNwgdYIwiA43gb60niF7P1dOsmUTlz0jNn
	 4FOsJ77wJ6YXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 06/36] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-6-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
 <20260709-rockchip-usbdp-cleanup-v11-6-a149ac60f76c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 19:19:47 +0000
Message-Id: <20260709191948.794A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If PHY setup fails during a mode change, the error path leaves the=
 state machine inconsistent, leading to an unbalanced clock disable when th=
e PHY is later powered off.
--

--- Patch [6]: [PATCH v11 06/36] phy: rockchip: usbdp: Drop seamless DP tak=
eover ---
commit 6e8a746d34fb8b93e5acd40e0d0766f740b5b995
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop seamless DP takeover
   =20
This commit removes the initial status checking code from the Rockchip USBDP
combo PHY driver, dropping support for seamless DP takeover. The feature is
currently unsupported by DRM drivers and bootloaders, and would require
complex TCPM state synchronization for USB-C alternate modes. Removing it
cleans up unused code until it can be properly implemented.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index 3fc8222fcaec2..6cb9f6b4dbf6d 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1495,10 +1468,6 @@ static int rk_udphy_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D rk_udphy_get_initial_status(udphy);
> -	if (ret)
> -		return ret;
> -
>  	mutex_init(&udphy->mutex);
>  	platform_set_drvdata(pdev, udphy);
> =20

[Severity: High]
This is a pre-existing issue, but I noticed a potential state inconsistency
in the PHY mode change error path.

In drivers/phy/rockchip/phy-rockchip-usbdp.c:rk_udphy_power_on():

	} else if (udphy->mode_change) {
		if (udphy->mode =3D=3D UDPHY_MODE_DP)
			rk_udphy_u3_port_disable(udphy, true);

		rk_udphy_disable(udphy);
		ret =3D rk_udphy_setup(udphy);
		if (ret)
			return ret;

If rk_udphy_setup() fails (e.g. due to a PLL lock timeout), the function
returns an error directly without updating udphy->status.

Since the hardware has already been disabled by the preceding call to
rk_udphy_disable(), but udphy->status still reflects the previous active
state, could this lead to a double-disable of the bulk clocks when the
consumer later tears down the initial mode and calls phy_power_off()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-rockchip-u=
sbdp-cleanup-v11-0-a149ac60f76c@collabora.com?part=3D6
