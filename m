Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE334CFD0
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 22:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709931; cv=none; b=L1fuulTl35gtxv7UvH/4seHcCMsW0pJTUA/7VHtt+H98wmF3qUqA2MPFt8/3mVloj7QA7sfREITsdhbhJkalN4VtxjtWaSc9MXs/xKuJwnyej4/u0Sc6qJyjHyCIeXtt/ztnYFhkWkKG/Md/Hqy2CrPtF+NzR8OCkzF5O6VnQBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709931; c=relaxed/simple;
	bh=1C6yXJRxz+LNVFgn/4BxA0f10mYok2FAcQW2LoIxblU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IzcVefwSZ8AsvbzHlKBo+o5Nn5MXklMHb5+HXpo0GWBvsOO/HquzB4kGMZXEZmQIcPQPO/G/k399riJePrPxMmVameQ9dDXU5my5qMkDZLVNFaR4wKO3M32WPaCF3Arz36C+0GuPZiReip0Qs4sXcxSdDEFciSMcSbAmulddmq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TP7K87H7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TP7K87H7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78509C19425;
	Wed, 13 May 2026 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709930;
	bh=1C6yXJRxz+LNVFgn/4BxA0f10mYok2FAcQW2LoIxblU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TP7K87H7Kt+aGntq+pASAgrGGhk4eI3Ff7drJJbb+72WJ26A4E8+pHBeJjMEiMeEn
	 OrKjsZ85MvaLccxBAlGStCb0ZROUpB7avjHYD8AhKugC2T6HxUMrHGbYCCGyjDwMsQ
	 rg6MWG3ep5Ezb6/0YwyIVQ6hY/qjljIbffyT8QASVB4865AjtSx5qCqeR6HWq52ebA
	 cQ26TbLUnbBLHBUg4uZCd/cuRspU7uzH+vw6ucTUNUpRWY7EUifKs/V4+973GHhBoG
	 GDuS9sae3qQeEA3m9SOEcPR016FrO9Ypsw+BCQadfgNPejZPBxoPR1YdhHIurBNIR0
	 5Mq+QGBp+mbdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] reset: eyeq: Add EyeQ7H compatibles
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512-clk-eyeq7-v6-2-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-2-0540cce18fb2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 22:05:29 +0000
Message-Id: <20260513220530.78509C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `valid_mask` definitions for most EyeQ7H sparse domains are in=
correctly calculated as contiguous bitmasks, rejecting valid device resets.
- [High] Severe contradiction between the documented domain type and the im=
plemented domain type for the EyeQ7H DDR reset domain.
--

commit 0720cebbbbe1a20186ece402d8172a4c6a7bfdca
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

reset: eyeq: Add EyeQ7H compatibles

This commit adds support for the reset controllers found in the EyeQ7H OLB,
introducing three new reset domain types (ACRP, CFG, ACC) to handle the
different register layouts and behaviors.

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 1a38579838970..ce758a1757fce 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
[ ... ]
> + * Known resets in EyeQ7H ddr (type EQR_EYEQ7H_CFG)
> + *  0. APB	2. DMI		3. DFI		4. PHY_SMS
> + *  5. CTL_SMS
> + *
> + * Known resets in EyeQ7H east (type EQR_EYEQ7H_CFG)
> + *  0. ISP	2. VEU		3. LBIST
> + *
> + * Known resets in EyeQ7H periph (type EQR_EYEQ6H_SARCR)
> + *  0. gpio	1.EXT TIMER	3.UART		4. SPI
> + *  5. I2C0	6. I2C1		7.I2C2		8. I2S
> + *
> + * Known resets in EyeQ7H south (type EQR_EYEQ7H_CFG)
> + *  0. PCI_PHY	1. PCI_CTL	2. S_NOC	3. GBE_PHY
> + *  4. GBE_CTL	5. XSPI		6. UFS		7. VDIO
> + *
> + * Known resets in EyeQ7H west (type EQR_EYEQ7H_CFG)
> + *  0. GPU	2. CAU		3. LBIST	4. GPU_LBIST
[ ... ]
> +static const struct eqr_domain_descriptor eqr_eyeq7h_ddr_domains[] =3D {
> +	{
> +		.type =3D EQR_EYEQ7H_ACRP,

The block comment above documents the ddr domain as type EQR_EYEQ7H_CFG, but
it is initialized here as EQR_EYEQ7H_ACRP.

Since these two types use incompatible register access patterns (CFG modifi=
es
two bits per device in a shared register, while ACRP accesses separate
registers), could this cause out-of-bounds MMIO accesses or fail to reset
the peripherals if the hardware expects the CFG layout?

> +		.valid_mask =3D 0x1F,

For the ddr domain, the documented indices are 0, 2, 3, 4, and 5. Should
this valid_mask be 0x3D instead of 0x1F?

A mask of 0x1F only covers bits 0-4, which would cause requests for offset 5
(CTL_SMS) to be rejected by the validation in eqr_of_xlate_internal(). This
pattern of using contiguous bitmasks for sparse domains seems to appear in
several places.

[ ... ]
> +static const struct eqr_domain_descriptor eqr_eyeq7h_west_domains[] =3D {
> +	{
> +		.type =3D EQR_EYEQ7H_CFG,
> +		.valid_mask =3D 0xf,

Similarly, the west domain lists indices 0, 2, 3, and 4. A valid_mask of 0xF
(bits 0-3) will reject reset requests for offset 4 (GPU_LBIST) because BIT(=
4)
falls outside the mask.

Could this valid_mask be updated to 0x1D to include BIT(4)?

This also appears to affect the east, periph, xnn0, and xnn1 domains, which
all have sparse indices but contiguous valid_masks that will reject resets =
for
the higher offsets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-clk-eyeq7-=
v6-0-0540cce18fb2@bootlin.com?part=3D2
