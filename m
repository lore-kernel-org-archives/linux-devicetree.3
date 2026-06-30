Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51B2DF3DA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806439; cv=none; b=N1TovSxnQY7CHLw1JQ6DPEi7zC4tR2vWzL3MYGqxSU0DkZG4Gk8wpSyhhMu58z5e8Hn27KvJfSmDxkJWIIkCQXa8P6RdliemEr3ZWWK0wmYEacGAVu7sP3Nj5akzzi0TiAg/YgV2Rg/k2eYi1127xmEHHkfkZMdt5pYvm+Zyp/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806439; c=relaxed/simple;
	bh=KvbnJuw1dsIYC55qHxS71LrJG2C/OkHcB+GpqJuwerM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ufVitCPzfgn+My7HLGeanw2UptH43OCSMO4dlno6WCymEbI/LoS2hhQrrfjagw8JLrLve7rPUTQmRZyMmgNnsSg1rZcyWQ4zIeBz4fFGhrJNLeLILfliM9onnU8MtiRmCyqRWHh7MSZUMOP48U5yKOZXFJJJEab0FG510y4JMrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+jtMy76; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+jtMy76"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CE21F000E9;
	Tue, 30 Jun 2026 08:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782806438;
	bh=aklCtIdwAuaV/IkYc3oYr7mTqO/RWDS/WnA9iYfqABI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n+jtMy76AtRUPWNey7Uh6bCpahTZ15+A+d5vimKhXap0eKxXdW+zpGiUzwliEf3Vm
	 /CDYW/kLw2E8/y8UWTfGcI2DZadOm/ejXe1eqqq+oOdlgMfU+QGtuXiGjARIVAFII9
	 15sMxCzyLbxSFRDkWRVssYHA64gZmOLdmc5zItyorHySHMUKXOnX/PzY0XCDAuqMyU
	 wJXPEew2/xCHf2+tabUGwuX6OqbQKP9JDjQg+L3yW1UJHFVzfgU8+1Qe1C5jddTiCY
	 9MgBIpJcBb2wbsXLiVo0cNVIuMDmDWufXalyoBjQiWft+4s3XoEhIHwTKWFTyRj6lp
	 ZKxT1nXgRx54w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] phy: rockchip: phy-rockchip-inno-csidphy: fix
 rk1808 hsfreq table
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerald Loacker" <gerald.loacker@wolfvision.net>
Cc: robh@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260630-feature-mipi-csi-dphy-4k60-v3-1-176792ab71fa@wolfvision.net>
References: <20260630-feature-mipi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net>
 <20260630-feature-mipi-csi-dphy-4k60-v3-1-176792ab71fa@wolfvision.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 08:00:37 +0000
Message-Id: <20260630080037.B5CE21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Valid low-frequency configurations are incorrectly rejected becaus=
e a `cfg_bit` value of `0x00` conflicts with the default 'not found' sentin=
el.
- [High] The `rk3368_grf_dphy_regs` array is missing an explicit size and o=
nly initializes index 0, meaning it is compiled as an array of size 1. `roc=
kchip_inno_csidphy_power_on()` unconditionally indexes into this array at i=
ndices 1 and 2, causing an out-of-bounds read and an erroneous write to an =
undefined GRF register offset.
--

commit 4cc350ff3a3bfdcb6204ddc2357172385fbe4d2a
Author: Gerald Loacker <gerald.loacker@wolfvision.net>

phy: rockchip: phy-rockchip-inno-csidphy: fix rk1808 hsfreq table

The rk1808 hsfreq table previously capped at 2499 Mbps. This commit
extends the final entry to 2500 Mbps to support this exact data rate,
which is essential for the RK3588 platform reusing this array.

> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-csidphy.c
> index c79fb53d8ee5c..5281f8dea0ad3 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
> @@ -170,7 +170,7 @@ static const struct hsfreq_range rk1808_mipidphy_hsfr=
eq_ranges[] =3D {
>  	{ 299, 0x06}, { 399, 0x08}, { 499, 0x0b}, { 599, 0x0e},
>  	{ 699, 0x10}, { 799, 0x12}, { 999, 0x16}, {1199, 0x1e},
>  	{1399, 0x23}, {1599, 0x2d}, {1799, 0x32}, {1999, 0x37},
> -	{2199, 0x3c}, {2399, 0x41}, {2499, 0x46}
> +	{2199, 0x3c}, {2399, 0x41}, {2500, 0x46}
>  };

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the frequency
tables I noticed a potential problem in how the selected configuration is
evaluated later in the driver.

If a data rate maps to a configuration where the cfg_bit is 0x00, will
rockchip_inno_csidphy_configure() incorrectly reject it?

In rockchip_inno_csidphy_configure():
    if (!hsfreq)
        return -EINVAL;

It seems this check uses 0x00 as a not found sentinel, but valid low
frequency ranges might legitimately use 0x00 as their configuration value.
This same logic is also present in rk_dphy_configure() in
phy-rockchip-dphy-rx0.c. Does this prevent the hardware from operating at
those low frequencies?

[Severity: High]
This is also a pre-existing issue, but I noticed an out-of-bounds array
access in this driver for the RK3368 platform.

The rk3368_grf_dphy_regs array is initialized with only a single element:

static const struct dphy_reg rk3368_grf_dphy_regs[] =3D {
    [GRF_DPHY_CSIPHY_FORCERXMODE] =3D PHY_REG(RK3368_GRF_SOC_CON6_OFFSET, 4=
, 8),
};

However, rockchip_inno_csidphy_power_on() unconditionally accesses
indices beyond this:

    write_grf_reg(priv, GRF_DPHY_CSIPHY_CLKLANE_EN, 0x1);
    write_grf_reg(priv, GRF_DPHY_CSIPHY_DATALANE_EN,
                  GENMASK(priv->config.lanes - 1, 0));

Could this read past the end of the 1-element array and cause an erroneous
write to an undefined register offset if the adjacent memory evaluates as
valid?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-feature-mi=
pi-csi-dphy-4k60-v3-0-176792ab71fa@wolfvision.net?part=3D1
