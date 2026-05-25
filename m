Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A483E5A1F
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699095; cv=none; b=XLUut9vbb95WCLAPWeawHIYQ6TURafIBklN9+z8o9D4Sa60bz5fm+RThLwCimAjpE9PU3JcTRFNqsnAeTbJwBHxowos2ZjHa43VzfHQNBTWuCW13IwGMzKqbSIP596cvc2exKU7RrnvNHLVPYnlXPsPU+T9bWk76dm7c6XizCkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699095; c=relaxed/simple;
	bh=Zbnq4nVouh2tLKfym5eJlvrjRep9DIypEy3NGdo1Xwk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fruXnIpm+hxs2u9lFsmZu08qiSIvXGbkU/tN9gKpy8BX+LHhj1OEzwFTlmyDZrPFkmkr1AuhAPUqixzvI2uuv5AnnDTSXjOHxYuzNqwNwXJmkW5LSx8cFwi42y8+P8JPz60IYmzeDR0rWy79D4PNAQAR+hkpr1aPW6YWs/ksDWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE9HmvBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PE9HmvBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E081F000E9;
	Mon, 25 May 2026 08:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699090;
	bh=F37OX8fnagYNDRFJjeXB9Y84J1ea3DB791PXUgjEpb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PE9HmvBJyz1BzQAt+S9K29oCLGxxdE4puAmc20+qwNd3w2ftq5quaTLWDTlN3PJrD
	 KEY7yQ4a84OPlawe15UqUpbTmV/oAnLZYfmydlKgpnVnPenymiA/qInI9ZS5SRVykv
	 aWb2Mi+rjSkamdhCsFE37/PntORctK4kvYhKLVfUQTSR4YZHjXWmeKDzF69l+s4sY1
	 NhCKLEKWK+1q1PQApmVgl+sxCOGa7+e/PwWbZt0KL0jqlTrfGfts6x6s12LbvDz+oe
	 QbgBhcWhMhvd0TOlzrGT5WZEVg68mAHbnoWGEwrHttNb4xUWWHMF1hRZFOmUGAgy4z
	 4Ac+ktH/9IsbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/10] drm/rockchip: analogix_dp: Add support for
 RK3576
Reply-To: sashiko-reviews@lists.linux.dev
To: "Damon Ding" <damon.ding@rock-chips.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260525082033.117569-11-damon.ding@rock-chips.com>
References: <20260525082033.117569-11-damon.ding@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 08:51:30 +0000
Message-Id: <20260525085130.96E081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing GRF `.edp_mode` initialization or dead device tree requi=
rement for RK3576
--

commit f660558fa407a4832fc6ade863a03b6fd050bfd2
Author: Damon Ding <damon.ding@rock-chips.com>

drm/rockchip: analogix_dp: Add support for RK3576

This commit adds dedicated chip data and a device tree matching entry to br=
ing
up basic eDP functionality for the RK3576 platform.

> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index d2af5eb29dbb5..d4c5dd61e95bb 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
[ ... ]
> @@ -522,6 +522,14 @@ static const struct rockchip_dp_chip_data rk3288_dp[=
] =3D {
>  	{ /* sentinel */ }
>  };
> =20
> +static const struct rockchip_dp_chip_data rk3576_edp[] =3D {
> +	{
> +		.chip_type =3D RK3576_EDP,
> +		.reg =3D 0x27dc0000,
> +	},

[Severity: Medium]
Does the RK3576 require GRF register programming for eDP mode?

The newly added rk3576_edp data table omits the .edp_mode and .lcdc_sel
GRF register fields. Because they are zero-initialized, their internal
valid flags evaluate to false, causing rockchip_grf_field_write() to
silently skip GRF configuration.

However, rockchip_dp_of_probe() unconditionally requires the rockchip,grf
phandle and fails the probe with -ENODEV if it is missing.

If the RK3576 combo PHY requires GRF programming to enter eDP mode (similar
to the RK3588 design mentioned in the commit message), will the driver
fail if the bootloader hasn't already configured the PHY, or fail after a
system suspend and resume cycle?

Alternatively, if the RK3576 genuinely does not require any GRF programming
for eDP, should the rockchip,grf requirement in the driver be bypassed for
this platform so the device tree isn't forced to supply an unused phandle?

> +	{ /* sentinel */ }
> +};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525082033.1175=
69-1-damon.ding@rock-chips.com?part=3D10
