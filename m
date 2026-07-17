Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F923D2A4
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315756; cv=none; b=ag9elXkFkhbAOtJ9KnNQ4Vq4HRTp4TSavPyX6gjDnDlUH2E27GNyu6LCIIoqWAFyc9ogGv/+0Odl6ObUWgfmeNQTpsken13A/RLcByrpfWHDX5XRLM4L7i7n6DjiJr4dz5GWE2ALcoxd2V5DU+qe+D6af7bQHQXPC8ZAwHyNT6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315756; c=relaxed/simple;
	bh=7nrlR0DgFZBkGpcTAI+OOMlsdntN5Wn0ULxzYCiA0IY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T19ZIW61kOWuV2IGh8Os3YbgyoIqrtkhohJdrOUzMOUDInHVNCflBhP/ZDsP4qQKG36z2XiSpxj6m1tDFsrJLXl6+eTxWi7PYZaqFG1w3Ik3ZrVsNZX+ocDqb35jyUk8m14F/Y27uxhQIbHvz54zkq3p0S+KYSryq3vWkIxKNPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2b7eD11; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2b7eD11"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438D91F000E9;
	Fri, 17 Jul 2026 19:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315755;
	bh=uMIkB7BvnyncC4raU1rh4LMfph/MuPQanSj/jalBGb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2b7eD11PkBLI5lqBQwmupYLSnegp7nOQ3VjoTyMiJ43AFNgjDOe7o+nU5MHc8Ghj
	 gR8NvRxJzfstHTe//i4NFrM2clx33HTnms2LtPmH5mRsKOkLQM/Kbxe4LBfdPitAGC
	 YxMZqDLuSgnkLNo6PM+RtIYw8niyo2xhVXVeuaf/ailGAmMetEiO5hfio6XUoehnyG
	 Zs9tnoym3lpTcx10khviT6y0MrC4gH4duw4exdiYhwupvEosodb+sW+LMyFhLCXUIG
	 qdiw5dFOH4LNwEoDxOX6w5Fhose5UT7hL7Dvz8+R7YQs+6pboOe7JPMvgH+lwgG0Yy
	 qW5YCr1yj4NQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/17] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717185116.2065505-16-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-16-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:15:54 +0000
Message-Id: <20260717191555.438D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Ranked fallback optimization fails to downgrade continuous read ca=
che variants, leading to execution of untuned operations at tuned high freq=
uencies.
--

--- Patch [15]: [PATCH v5 15/17] mtd: spinand: negotiate optimal controller=
 operating point before dirmap creation ---
commit 7c43cf072fbe0a771ec2adb617714b7d258f3161
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spinand: negotiate optimal controller operating point before dirmap cr=
eation

This commit moves dirmap creation to the probe function, after controller
optimization is completed. It introduces a ranked fallback mechanism that=20
iterates through read variants if the pre-selected variant fails controller
tuning, applying the validated PHY frequency to the dirmap descriptors.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index b6896760b0b87..58bf7f26b49ba 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c

[ ... ]

> @@ -2050,6 +2055,175 @@ static void spinand_cleanup(struct spinand_device=
 *spinand)
>  	kfree(spinand->scratchbuf);
>  }
> =20
> +/*
> + * spinand_try_ranked_variant() - Try controller optimization on variant=
s in

[ ... ]

> +static bool spinand_try_ranked_variant(struct spinand_device *spinand,
> +				       struct spi_mem *mem,
> +				       enum spinand_bus_interface iface,
> +				       u32 *tried_mask)
> +{
> +	const struct spinand_op_variants *variants =3D spinand->all_read_varian=
ts;
> +	const struct spi_mem_op *best;
> +	int ret;
> +
> +	if (!variants)
> +		return false;
> +
> +	while ((best =3D spinand_op_find_best_variant(spinand, variants, iface,
> +						    *tried_mask))) {
> +		*tried_mask |=3D BIT(best - variants->ops);
> +		spinand->max_read_op =3D *best;
> +		spinand->max_read_op.max_freq =3D 0;
> +		ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +					     &spinand->max_write_op);
> +		if (ret && ret !=3D -EOPNOTSUPP)
> +			dev_dbg(&mem->spi->dev, "%s optimization failed: %d\n",
> +				iface =3D=3D ODTR ? "ODTR" : "SSDR", ret);
> +		if (!ret && spinand->max_read_op.max_freq) {
> +			if (iface =3D=3D ODTR)
> +				spinand->odtr_op_templates.read_cache =3D best;
> +			else
> +				spinand->ssdr_op_templates.read_cache =3D best;

[Severity: High]
If the controller tuning fails for the best variant but succeeds for a slow=
er
fallback variant, this code updates the read_cache to the fallback variant
but does not update or disable cont_read_cache.

Earlier in spinand_create_dirmap(), the untuned continuous read operation
is assigned the high PHY-validated frequency of this fallback variant:

spinand_create_dirmap() {
    ...
    if (secondary_op) {
        info.secondary_op_tmpl =3D *spinand->op_templates->cont_read_cache;
        ...
        info.secondary_op_tmpl.max_freq =3D spinand->max_read_op.max_freq;
    }
    ...
}

Could this result in executing rejected, untuned continuous read operations
at the high frequency of the fallback variant, potentially causing data
corruption?

> +			return true;
> +		}
> +	}
> +	return false;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185116.2065=
505-1-s-k6@ti.com?part=3D15
