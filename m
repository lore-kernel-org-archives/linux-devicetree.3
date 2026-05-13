Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA921E8332
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706512; cv=none; b=Sou/WmJn4hCqC4gng3CNq+FIGhuHJX+2rDplyLcmOE40mxVxlHUQBQUINBMJcZEMdRw68YzLr0axYh8dPYkDO7TUroq0GbUOBnp9yJomm3If4XVMfQditWWFCv2dCnJW/yAhu17vS78JyzGjsGP3mZ3tMN2cUNzs03PPyoCgT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706512; c=relaxed/simple;
	bh=axsdM5jHVa+eaMxiTl7KMfeq2G0PSZwYX/Cx3NZ1kCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PCvDFBNfNMvPubB61gTyooxQY2z0qOoR8cHFrDxMqi43OJZgA4/+LPi2alx42GaeAzNTYzdm6sT7Ah9wzWYHdP0JqIM+ZdM0XFSZ8I22b+AH1Pkzx22AlnnQkBuKVujrYbMICeqlyEfq2uytwCnTbtnXUffI8nPVjq2ScwQ117s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxtWIFQn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxtWIFQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46283C19425;
	Wed, 13 May 2026 21:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778706511;
	bh=axsdM5jHVa+eaMxiTl7KMfeq2G0PSZwYX/Cx3NZ1kCo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mxtWIFQnKmj4di21XK8n8HRX/72gTZYVZRsJxC0Z69RLRBqd/hyDR5Ov1zbL+i+lC
	 J8rsbV741UMOo6gbR/FFsP90kWZcsyu3c2YaD5eclEIPKV0QcYOBLgA/1I8RasDUBY
	 DVjEFp9XL2nzIwMaYOgve6HRnTfHkpbFbM3ybmBqIXSdzNiVVg/eG+2jwSEuEWiUua
	 tN6yTajcn5TIESgCig4pGMA1n6N/GfW9zEP1IQ0ZxSoVuPQZAzV1JvL7/6JSM2rmrj
	 UqWdiDOs0drMEF//22dWj9u7JnRx6U6yOa3iyhy24COtFt+pbf19/0RfTu+aLbc/Zq
	 /bsPphrvAE8Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/10] drm/rockchip: analogix_dp: Enable hclk for
 RK3588
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512095644.1946084-6-damon.ding@rock-chips.com>
References: <20260512095644.1946084-6-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 21:08:30 +0000
Message-Id: <20260513210831.46283C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added `hclk` clock is explicitly kept permanently enab=
led, bypassing the driver's dynamic power management.
--

commit 55f729190dc3e9f8e6e9a2cd8960832ed10a25ba
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Enable hclk for RK3588

This commit explicitly acquires and enables the HCLK_VO1 bus clock for the
RK3588 eDP controller. It replaces an implicit enablement via the
rockchip,vo-grf phandle reference to align with updated device tree binding=
s.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 06072efd7fca3..d2af5eb29dbb5 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c

[ ... ]

> @@ -327,6 +328,11 @@ static int rockchip_dp_of_probe(struct rockchip_dp_d=
evice *dp)
>  		return dev_err_probe(dev, PTR_ERR(dp->pclk),
>  				     "failed to get pclk property\n");
> =20
> +	clk =3D devm_clk_get_optional_enabled(dev, "hclk");
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to get hclk property\n");
> +

Does keeping this clock permanently enabled bypass the driver's dynamic pow=
er
management?

Since the local variable clk is discarded after probe, the clock will
remain enabled as long as the driver is bound. The driver currently toggles
the APB clock (dp->pclk) in rockchip_dp_poweron() and rockchip_dp_powerdown=
()
to save power when the display is inactive.

Should hclk be saved in the rockchip_dp_device struct and managed
symmetrically with pclk to ensure associated power domains can fully enter
low-power states during display blanking?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512095644.1946=
084-1-damon.ding@rock-chips.com?part=3D5
