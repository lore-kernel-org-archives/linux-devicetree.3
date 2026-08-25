Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C818F3515EE
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 17:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787679822; cv=none; b=rdMZmSXLrHFVv94N9KrEiqELKDD6TsabPS2cmDz00y1MAp1RV5RbcxI8nVt8O+O0fLAsDxOo/9lM3KZ31WnKpVWsPk8bG/dBX8UpWvShol6L9ioKQ0lhNAl4dIVRv3v2mhyyoY0/oV4pThg2jtjKZxTYxR/5qd6QhuqEeaUG+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787679822; c=relaxed/simple;
	bh=Dklc6CsbFR46ysitZ8qL2m5c+pPxoGL/dCIkUmn7fp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lOp9u03EWduRwHSgH4d7gSJD5bz1EBvAeo1XaQxbSq97zCfRoRA49Tx9r2owN/m3RHnny9RbOLwOSm7q68/zxmHCic+KTnnf6mDlXKeFFW90oIOmf7BWjHLQxrwgi9G9yWupkSznPlke3SsYKCkkEbUxlk5NTuFtCHYVLRi0XBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkoB8+7r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkoB8+7r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213AD1F000E9;
	Tue, 25 Aug 2026 17:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787679821;
	bh=N5/3GRv0VAaomLrKQ4TAsvIMWlPOkksNTpLSgL2vTYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FkoB8+7rKfZs84h9R1ZXJdlHKm03Ckdf04W2N/OlQT5uO7wnHOOoKszU5SaQ+7OIR
	 hcbaD4gBkbufezc3hp6/lbXSy1WXZ1IHMNuglKL5iFj7NzMTy8kGS+wefhAzCm7xdT
	 b7fd63LoDCsa0s0h+nVkrgydwSlGQKjjYGsK9ACrvFTAdWJG2kcgxcRgqIPSuNN/4u
	 Ix+4duGjS436o5iRjGsu51GHEoBKaiDsrSIQ8IW/IX9r2LP3fs7gA+cgCAVopVgT7A
	 1yIWRAhPM2+rQtfPvhrKBZma0drr2RjpPUvKLlrKtQgrxr4SDCyXHbelbIC/nybSkV
	 mSChoXNnYD60A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, robh@kernel.org, conor+dt@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20260825171737.776052-17-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-17-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:43:40 +0000
Message-Id: <20260825174341.213AD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unconditional overwrite of `spinand->cont_read_possible` bypasses =
system capability checks, risking unsupported continuous reads.
--

commit 6afbb44eacdd7b8d06d61615ac789bcc3b8a5186
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spinand: negotiate optimal controller operating point before dirmap cr=
eation

This commit introduces a mechanism to calibrate the PHY before creating the
dirmap so the validated max frequency is embedded into the dirmap operation=
s.
It adds a ranked fallback iteration to find optimal variants if the
pre-selected one fails, updating op templates and continuous read capabilit=
ies
accordingly.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index f839438a44ff2..cd353eb8b5374 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c

[ ... ]

> @@ -2050,6 +2121,198 @@ static void spinand_cleanup(struct spinand_device=
 *spinand)

[ ... ]

> +static bool spinand_try_ranked_variant(struct spinand_device *spinand,
> +				       struct spi_mem *mem,
> +				       enum spinand_bus_interface iface,
> +				       u32 *tried_mask)
> +{
> +	const struct spinand_op_variants *variants =3D spinand->all_read_varian=
ts;
> +	struct spinand_mem_ops *templates =3D iface =3D=3D ODTR ?
> +		&spinand->odtr_op_templates : &spinand->ssdr_op_templates;
> +	const struct spi_mem_op *best;
> +	int ret;
> +
> +	if (!variants)
> +		return false;
> +
> +	while ((best =3D spinand_op_find_best_variant(spinand, variants, iface,
> +						    *tried_mask, NULL))) {
> +		*tried_mask |=3D BIT(best - variants->ops);
> +		spinand->max_read_op =3D *best;
> +		spinand->max_read_op.max_freq =3D 0;
> +		spinand->max_write_op.max_freq =3D 0;
> +		ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +					     &spinand->max_write_op);
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			dev_dbg(&mem->spi->dev, "%s optimization failed: %d\n",
> +				iface =3D=3D ODTR ? "ODTR" : "SSDR", ret);
> +		if (!ret && spinand->max_read_op.max_freq) {
> +			templates->read_cache =3D best;
> +			if (spinand->all_cont_read_variants) {
> +				templates->cont_read_cache =3D
> +					spinand_find_cont_read_variant(spinand, best, iface);
> +				spinand->cont_read_possible =3D
> +					!!templates->cont_read_cache;

[Severity: High]
Does this code unconditionally overwrite the system capability flag for
continuous reads?

Earlier in the initialization sequence, spinand_cont_read_init() may have
cleared spinand->cont_read_possible due to system-level constraints, such as
pipelined ECC requirements or lack of controller support. By setting it here
based solely on the existence of an op template, it appears we might re-ena=
ble
continuous reads on hardware that cannot actually support it.

Could this lead to I/O timeouts or potential data corruption when the subsy=
stem
attempts unsupported continuous read operations?

> +			}
> +			return true;
> +		}
> +	}
> +	return false;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825171737.7760=
52-1-s-k6@ti.com?part=3D16
