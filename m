Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19F282F1D
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 17:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782410317; cv=none; b=EdNWFwGV6Hsf0ue5rs2cvvrOk9E1/jT/QUm+3N4DbFCtH05jiPoQ4x4TITWZFohbP/aPSi1s0DeqpoNFQaDQyT9GDaEjozUjrwwrWuE0HaLmAJQ6b8bqYpIPOJynIBHGckU/ABRyJGKfUH4bUQg3z2FMTlexBBRFTyDyNGsHa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782410317; c=relaxed/simple;
	bh=7LOu2OJTm/9L4hHcPIXkIQVSnqzJcGkpzqnAAtGQ9nw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=myQajGQQzwA/WLbjLViZrIbtLT0Qmxof50NGzMyot5e52aSsZm9zacunG0zc0RJFzE2kkRnHe8swZOlfVypvTPNq891O3j4FKnVBFio0c3dHu4JajGK4y3bvXHAGxS5Z9A9SuCcSBthcho0BNYglDVRYAfGj7U+ybeYRBaW/hNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj4Hf1uW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj4Hf1uW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC26D1F000E9;
	Thu, 25 Jun 2026 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782410315;
	bh=LFxr+kkazsL5eaKgPpO7yTdT4eGb9hozazGeuujrHdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mj4Hf1uWMfCeXBS7WjMGsYsLy6gnKsv0LuRU3fMYjVsxyRcHD9ZNF0T6p5KZ0MXRq
	 5Su/oBjQiRrqMIGLxlXeFO8haHYYlsoavbq+95jz4n8SvxQcX2Pb7JAHD+/NAYgIsc
	 8Ryyk0NfeG96FPGXYgnLrZOWNz8ZrL1ba3e5RJESSR7sLZHmgkbqHdEEq3YhiWDlKE
	 rCIhOVHPbSLUXi5w5qvncktev3vZ1qZb0vTRsemXaJdEPh4rLXYOxdbJjTAhAVLIHd
	 I8X8MICUrxZtzwpMgPG08S6phivnYWZdN58pG66aCh1zAcMCYJu+nyjPd/7KbI61zX
	 DRNZYSD0b7OtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/27] phy: rockchip: usbdp: Drop seamless DP
 takeover
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-6-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
 <20260625-rockchip-usbdp-cleanup-v7-6-38eb3cf654fd@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 17:58:33 +0000
Message-Id: <20260625175834.AC26D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditionally disabling the DP PHY during probe can cause a fata=
l bus stall if the bootloader left the display pipeline active.
--

commit c915d0565d2bfe6851ea25d0f7d099f70a22703f
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Drop seamless DP takeover

This commit removes seamless DP takeover support by unconditionally disabli=
ng
the DP PHY during initial status checks. It aims to prevent clock resource
leaks on module removal since the DRM stack does not yet support seamless
takeover.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -939,9 +939,9 @@ static int rk_udphy_get_initial_status(struct rk_udph=
y *udphy)
> =20
>  	regmap_read(udphy->pma_regmap, CMN_LANE_MUX_AND_EN_OFFSET, &value);
>  	if (FIELD_GET(CMN_DP_LANE_MUX_ALL, value) && FIELD_GET(CMN_DP_LANE_EN_A=
LL, value))
> -		udphy->status =3D UDPHY_MODE_DP;
> -	else
> -		rk_udphy_disable(udphy);
> +		dev_dbg(udphy->dev, "Started with DP PHY pre-enabled; seamless takeove=
r unsupported\n");
> +
> +	rk_udphy_disable(udphy);

[Severity: High]
Will this unconditional call to rk_udphy_disable() cause a fatal bus stall
if the bootloader left the display pipeline active?

If the bootloader leaves the DP PHY enabled and streaming for a splash
screen, the Video Output Processor (VOP) is actively pushing pixels to the
PHY and depending on its clocks.

By shutting down the PHY, cutting its clocks, and asserting resets here
before the VOP is stopped, the VOP could stall the AXI bus when its
downstream sink abruptly stops. This can lead to an asynchronous external
abort (SError) or a complete system hang.

Even without seamless DRM takeover support, should the PHY remain enabled
until the DRM driver gracefully tears down the display pipeline in the
correct hardware-mandated order (VOP first, then PHY)?

> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-rockchip-u=
sbdp-cleanup-v7-0-38eb3cf654fd@collabora.com?part=3D6
