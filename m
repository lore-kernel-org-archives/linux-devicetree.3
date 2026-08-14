Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457433B3883
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786671705; cv=none; b=QTV3p5Wva/CwRvUUMjfjT1VCKTEWx9IO/JBKdC6G+NvNQyMnppdoOdA7jWfL/D3m7teeGj08akWPw5DZSIvQQlq9VwvdiLWh+OSiT9peRnEvQ92EYWT9iDUmPYohjKEJ1o9Jtw8XpCDqtnqNtZnc6TSQ/CLgq3S7IuD2Rv2ph1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786671705; c=relaxed/simple;
	bh=268Z1jMtA1v+TKVvdARuNECGqi8/rrt6v+epyIm9fJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=It/zK0IDkCLnfaoRXYu1oYQ5irAedULy7AFDYuFSgwOC31qrmkGxyQzBR21sL6ulg+y7wSPj/JqRVmPnojUDusIZzhzKcIuJxOOP1j28U/qf/ONMds2CQb6phd+dWjJqxGyOzFb8/sVUynNlUF0O+PKxQiRlNKpbT7sd+RYzPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGhL61Hj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGhL61Hj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646B01F000E9;
	Fri, 14 Aug 2026 01:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786671703;
	bh=/EenDhRSOJW4Ua5QWdGi+Vmps/qq91l9SEBZZaXRZHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YGhL61Hji3BZ/BJw4eMf+3UlRxqyLXdJS1kBDaMhflY3r8GSxooPzeOMdSCLHfuVr
	 y0zxV5ioboUMd+EIvo0vZNydB6k5HDzf1IRVHtJsyZl18rRCdCGS3/Jn0F9V975VX2
	 F+Sfpin1Emn0A6PMcGmQCn8ocLsFaGpnq5pT3tIHJD8wtEUSN4ivrY+X/XKN+I4zo+
	 ackzKZzFHUr0f2eHdc+cU9xDHi86MDCdniOlb3tXwhBJlM+CrNVGVv4FaxjYbYcxE3
	 jj/hpFWOfXDtf9+qPhb/ljXjcmgYIyZZz/yy/vEpd/hYxEF2swVz/lMIkc8vLPRNvc
	 nSrqfSA+we8/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 04/38] phy: rockchip: usbdp: Fix
 devm_clk_bulk_get_all check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, robh@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-4-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
 <20260813-rockchip-usbdp-cleanup-v14-4-b5ad9c68fa11@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 01:41:36 +0000
Message-Id: <20260814014143.646B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check on `udphy->clks[i].id` before passing to `strnc=
mp`.
--

--- Patch [4]: [PATCH v14 04/38] phy: rockchip: usbdp: Fix devm_clk_bulk_ge=
t_all check ---
commit 744151abc279ab01b34daf0e77ee2a3dbe3ad834
Author: Sebastian Reichel <sebastian.reichel@collabora.com>

phy: rockchip: usbdp: Fix devm_clk_bulk_get_all check

This commit changes the error handling for devm_clk_bulk_get_all() to
properly return its error code, such as -EPROBE_DEFER, rather than masking
it with -ENODEV. The change allows the driver to defer probing when
necessary. Missing clocks are now handled by the subsequent refclk search
check.

Closes: https://lore.kernel.org/linux-phy/20260612164107.C7DB21F000E9@smtp.=
kernel.org/

> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rock=
chip/phy-rockchip-usbdp.c
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -427,8 +427,8 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, =
struct device *dev)
>  	int i;
> =20
>  	udphy->num_clks =3D devm_clk_bulk_get_all(dev, &udphy->clks);
> -	if (udphy->num_clks < 1)
> -		return -ENODEV;
> +	if (udphy->num_clks < 0)
> +		return udphy->num_clks;
> =20
>  	/* used for configure phy reference clock frequency */
>  	for (i =3D 0; i < udphy->num_clks; i++) {
>  		if (!udphy->clks[i].id)
>  			continue;
> =20
>  		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer
dereference in rk_udphy_clk_init()?

If a device tree defines the clocks property but omits the clock-names
property, devm_clk_bulk_get_all() returns a positive clock count but
initializes clks[i].id to NULL.

Does this loop unconditionally pass that NULL pointer to strncmp(),
resulting in a kernel panic during probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813-rockchip-u=
sbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com?part=3D4
