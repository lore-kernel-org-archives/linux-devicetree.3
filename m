Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78833B4EBD
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718586; cv=none; b=fHJv8daSOVEnTr4MQDFRpeNK0i6UUthXyMXV+NKxF1jwNijG6IPUl6un2pN7Yni7CX3yhz/Y/F19TP247KR+IBks30a3/k4L7a5bBa9UJQ9aMokUZzSTFzOHnYQ5M8ESwKw16d6K9A+HWuP6pNVgzyzjvlsZpdTGopdUr1hAJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718586; c=relaxed/simple;
	bh=2mAfid+oI1LKCC5SV1urOj8jQ50EdmDMbrFsQoeaS4k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cXbI43Dnj2CeKB1HmajpM52OwvByJlLG7TzTogU2+wYbvsQ6p05v+CMHrj89YwSLOQ+mZF6V3ZYBW5LPRwI6q6/gNB6ayP8lGMiwOf5mapqdnW1vcoGkXca581v85ZDbmdNHTOqM5MM4hz7Yw2PGmLzxuUX/LJ4K81elyH+0ZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOtZOByI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOtZOByI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61CA71F000E9;
	Fri, 10 Jul 2026 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718584;
	bh=rLu1s6acMApeaTTTTx6XZckWnxGdT3vp0+avcOoZfeM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOtZOByI4S9NJ5GYu7A/HgwGGyfDEjyNAIfyjtyDq6kKvKI/m3k3NtFgWZI1A8wXc
	 MNgLv+GZDn4eeGCAbzaoGHybn2r0F4XaaHixwA7AfiCo8uSL9Zlu8/0nxPG7Sh2caY
	 AlKLsKgsB0N+/0m9/XZNBTnw3/LCyliiai9G6vM3d8/QkEBysBxh6N8Z1xyUoVMXmc
	 cQTp8hTcMkOZjYa/3WXKLdCtZ4Sv1hDrV2MYj7PZ66/ESWds2Cs6tMKbOVMpO/tIeS
	 w1RqiRgkJIacmyJL1Km2E45gOD+Cb3Y9aNZzRdQgr1/wfCGLHm+N2qHryjcIHQLdJV
	 hzeLcLFGHt5zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 33/36] phy: rockchip: usbdp: Rename mode to hw_mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-33-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
 <20260710-rockchip-usbdp-cleanup-v12-33-8b41a9a9bef0@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 21:23:03 +0000
Message-Id: <20260710212304.61CA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compilation failure due to an incomplete rename of `udphy->mode` to=
 `udphy->hw_mode` in `rk_udphy_power_on()`.
--

--- Patch [33]: [PATCH v12 33/36] phy: rockchip: usbdp: Rename mode to hw_m=
ode ---
commit e122bf8f901705d3a0997d20cdd65f61c58d31c9
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Rename mode to hw_mode

This commit renames the mode field in struct rk_udphy to hw_mode. It
updates references across the driver to clarify that this represents the
hardware-supported modes.

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> index cf173276bfc01..7bce642f1e968 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c

[ ... ]

> @@ -1006,7 +1006,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy=
, u8 mode)
>  			return ret;
>  		}
> =20
> -		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
> +		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
>  			rk_udphy_u3_port_disable(udphy, false);
>  		udphy->phy_needs_reinit =3D false;
> =20

[Severity: Low]
Does this code miss another rename of the mode field slightly further down =
in
rk_udphy_power_on()?

Looking at the else if (udphy->phy_needs_reinit) branch in the same functio=
n,
there is another reference to the old mode field:

		if (udphy->mode & UDPHY_MODE_USB)
			rk_udphy_u3_port_disable(udphy, false);

Will this cause a compilation failure since the mode field was removed from
struct rk_udphy?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-rockchip-u=
sbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com?part=3D33
