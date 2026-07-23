Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EFE48033D
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808172; cv=none; b=a1YA67lOs+za5MquXi2DF3Rryq34kK8h8KJM5h/b6r6SganQ+engKbW2py3e4SlNjNH4qxzh2IesHIi629rbDjOPUYJxELS+UifZUrKHOH1O4TUGhzwXnhMmUKJNBS2tBEmsoJ9gZDZPXEDGBEf1Fv4DwwVAtyq5IZ/7xRPODBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808172; c=relaxed/simple;
	bh=/Z2JHEDajsBeUtliOEfQu3PWpKtZgQRnG0LBhxfC/l4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V4XLDnLiPuGo2Wg6sQCRBnbchACdcLpiW2AZafhjPWE3eYS7cHcFhQDxCiTMo2u57YIIMjrIDGRzm3k2HKRi9CXf5VT6NF5VqpG1sbCzCnP483qTQHkSR6FOggiAuTs+lAQnJZZl1WKhlw7pEuHz69FrhmO6utZ3/J66SohYzBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P877VxzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P877VxzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1BD1F000E9;
	Thu, 23 Jul 2026 12:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784808168;
	bh=p/mnT76kGAGAC44i7kdmyJtDcquYqd+hW243bo6OZEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P877VxzSfJXozdMWMHEYxMUE/gCmwLQpnZdFyTGUWuAd4L8+HtVZNvP8ycji9H19u
	 H7C0LHVaP81d0DErgj8MiLdey7qHGhgFEht4XR6GZHBnIrHhcpUqiMqSCpFpQ1U4TE
	 TljLGSxUGKfd6eWBg5f2xZmPqV++b668jBuIhfqihr932F5QCH2+FU7UepIcM1fu8J
	 AqVhE/evcrRePXe1lwZwBiS9239s2oWxAr1IRNxZmWsxoCisc422qukNpZS6Xnznfq
	 bTI4JHfHVUIpfoqRMEnH3SUKpSGXmcbQCTTVCpnJ8pCN43cAyJgyHwRxQf3FsSds7y
	 SDLhS3lU7Aykw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 15/17] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, devicetree@vger.kernel.org, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, conor+dt@kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, robh@kernel.org, "Richard Weinberger" <richard@nod.at>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>
In-Reply-To: <20260723110219.3180747-16-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
 <20260723110219.3180747-16-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 12:02:23 +0000
Message-Id: <20260723120247.8E1BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Ranked controller optimization downgrades the read variant on tuni=
ng failure but fails to update or disable continuous read, leading to poten=
tial controller lockups and data corruption.
- [High] The SPI NAND chip is unconditionally restored to ODTR mode upon sy=
stem resume, even if controller optimization dynamically fell back to SSDR =
mode at probe time, breaking statically configured dirmaps.
- [High] SPI controller PHY tuning state is lost across suspend/resume cycl=
es.
- [Medium] `spinand->max_write_op` is not reset between iterations in `spin=
and_try_ranked_variant()`, leaking `max_freq` modifications across tuning a=
ttempts.
--

--- Patch [15]: [PATCH v6 15/17] mtd: spinand: negotiate optimal controller=
 operating point before dirmap creation ---
commit dc7c5dff1e36808c28c6f5690c48c5cbe8f6d925
Author: Santhosh Kumar K <s-k6@ti.com>
Subject: mtd: spinand: negotiate optimal controller operating point before =
dirmap creation

This commit moves dirmap creation after negotiating the optimal controller
operating point, so the validated frequency is embedded in the descriptors.
It introduces a ranked fallback mechanism to try variants in performance
order if the initial optimization fails.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index f839438a44ff2..e082e6233c7c1 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
[ ... ]
> @@ -2050,6 +2055,175 @@ static void spinand_cleanup(struct spinand_device=
 *spinand)
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

[Severity: Medium]
Should spinand->max_write_op.max_freq also be reset to 0 here?

If the controller driver modifies the write op's max_freq during a failed
tuning attempt, the non-zero max_freq leaks into the next loop iteration. T=
his
could limit the frequency negotiation artificially, causing subsequent valid
fallback variants to fail tuning or operate at suboptimal speeds.

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
Is it necessary to update or disable cont_read_cache to match the new
controller capabilities?

If spinand_optimize_controller() falls back to a slower ranked variant, it
only updates read_cache here, leaving cont_read_cache and cont_read_possible
unchanged. When spinand_create_dirmap() constructs the secondary read dirma=
p,
it will use the unmodified, incompatible cont_read_cache but incorrectly as=
sign
it the max_freq of this slower fallback variant.=20

When the kernel executes a continuous read, will it send an unsupported com=
mand
at an incompatible PHY frequency, potentially crashing the controller or
silently corrupting data?

> +			return true;
> +		}
> +	}
> +	return false;
> +}
[ ... ]
> +static void spinand_optimize_controller(struct spinand_device *spinand,
> +					struct spi_mem *mem)
> +{
[ ... ]
> +	/*
> +	 * Pass 2: switch to SSDR and try all SSDR variants in performance
> +	 * order. configure_chip is guaranteed non-NULL here: reaching ODTR
> +	 * mode requires it.
> +	 */
> +	if (WARN_ON(!spinand->configure_chip))
> +		goto use_odtr_fallback;
> +
> +	if (spinand->configure_chip(spinand, SSDR))
> +		goto use_odtr_fallback;
> +
> +	spinand->op_templates =3D &spinand->ssdr_op_templates;
> +	spinand->bus_iface =3D SSDR;

[Severity: High]
Does falling back to SSDR mode here require clearing the ODTR templates?

If ODTR tuning fails during probe, the device is switched to SSDR and dirma=
ps
are created using SSDR templates. However, because odtr_op_templates are not
cleared, when the system resumes from suspend, spinand_mtd_resume() calls
spinand_init_flash() -> spinand_configure_chip().=20

The configure chip logic will see that the ODTR templates exist and
unconditionally force the chip back into ODTR mode. Will subsequent I/O
operations then send SSDR-formatted SPI commands to a chip expecting ODTR
commands, resulting in data corruption?

> +	spinand->max_write_op =3D *spinand->ssdr_op_templates.write_cache;
> +	spinand->max_write_op.max_freq =3D 0;
[ ... ]
> @@ -2072,6 +2246,20 @@ static int spinand_probe(struct spi_mem *mem)
>  	if (ret)
>  		return ret;
> =20
> +	/*
> +	 * Negotiate the best controller operating point before creating dirmaps
> +	 * so the validated frequency is available at dirmap construction time.
> +	 */
> +	spinand_optimize_controller(spinand, mem);

[Severity: High]
Will the PHY tuning state negotiated here get restored across suspend/resume
cycles?

During probe, spinand_optimize_controller() calibrates the controller PHY d=
elay
registers via spi_mem_execute_tuning() and embeds the validated max_freq in=
to
the dirmaps. During suspend, the SPI controller loses power.

On resume, neither the SPI core, spinand_mtd_resume(), nor the controller
driver appear to restore the PHY tuning registers or re-invoke
spi_mem_execute_tuning(). Could the dirmaps continue executing I/O at the h=
igh
max_freq with uncalibrated PHY timings, resulting in I/O errors or data
corruption?

> +	ret =3D spinand_create_dirmaps(spinand);
> +	if (ret) {
> +		dev_err(&mem->spi->dev,
> +			"Failed to create direct mappings for read/write operations (err =3D =
%d)\n",
> +			ret);
> +		goto err_spinand_cleanup;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723110219.3180=
747-1-s-k6@ti.com?part=3D15
