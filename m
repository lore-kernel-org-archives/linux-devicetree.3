Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878278;
	b=r8M+zPDcbljZ8Wgw2tIXUu+0kacYj4sphGzAF1PdSYCs3cIg5wLfPzNgUTRpuA4VGBpN
	 tAtJVoteseWd2/7EB/Q7SfpzVB+VbP7k65Ke3v1R/RxGSUqNffBuKzg9NQectMIQcQ7Qb
	 VQmSTY21eRMK3fPWOueSiVMU3cDNszrQKGBUx8vT9uaZjJS02ZVYE6AAXiym9eZcHTqaJ
	 B6i92PFocuFBWTiLxNgbhFeY3wDnIcAfBCni8c+yh4Yul0RDFzwLvyz1Ar3qjmUm2W5tD
	 LnuAINx9HebXZOp6qt88ZsMgjMRcwvRh+Wpbw9VIq3EU+cjdzTn2RQV8JUO75kw0VuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878278;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Madmrg/Uo0DX2tmp+oGazWf0+/gvovwqd3iWeTOJMDE=;
	b=r5bIWqwH6u79Si1V2C1zVSG4ubkK3AEI4gEJNtaImMf/jVTAtIhk3GIzz/8bAKZx9m5M
	 uDKOFnSq2tfIn6TRMat4lQnJNlSZOhBMCx1RPcmUtCQDYKE4wkFzU2gR7SvsvuzkI5FzD
	 7NxQAkuDh5LBUpjquITnKNy6z4DDXJId1Qlnwwwp9wVbAIYU3LLklK9EiwRMQ6dBepdRA
	 J1F15xElRn+slVivs8C2CUxfQmkcUgAbxCu7ndYnlFIzjlEVMWXqLo/Up8kuBUWik7wdP
	 t7DmNN6NkcdoYc5ZCR66vqR3ugkLvQhq2+/+EpqOXWAd2Xt4WP/92CWHE1g4Z9z1rwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d02zMs42;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B8606A330
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 11:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d02zMs42
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085B61F00919;
	Thu,  5 Nov 2026 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878277;
	bh=Madmrg/Uo0DX2tmp+oGazWf0+/gvovwqd3iWeTOJMDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d02zMs42ob4rDW1+Ts6OKAHUxyjDIfl6nK51TVtG5Ao5pn8JpDyObXh4VpPIocqA6
	 G63thMqu0ECKypiSoMNo1K33pPrkFtwheQ1KODLSmD71VpakkiAS5D/61pFRZyzl/6
	 38f5p7dXh4tjsZYabmGqWcO+hMVrdTHcSquUbInIlbk9XbEoeS/YCayFFZBiAurpvB
	 VBl78FPbtmhsQhF2WLKf1B8zU4r0e2DJQYugqA7hZag+aNJLE3Q51UHKYBX64K0c5E
	 zRJeiJXfyeEXTKe4buhbEa3N2BCrhINY1MKYkqOkZExfyaL2KE02mYkH0ojC0dZtDJ
	 QxA7NShwpvFUA==
Message-ID: <sashiko-outbox-198953@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 16/19] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Santhosh Kumar K" <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-17-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-17-s-k6@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:31:16 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] mtd: spinand: spinand_create_dirmap() overwrites per-op max_freq l=
imits
- [High] mtd: spinand: missing configure_chip() call in spinand_try_ranked_=
variant()
- [High] mtd: spinand: spinand_op_find_best_variant() ranks and overclocks =
low-freq ops
- [Medium] mtd: spinand: broken cont_read_cache matching in spinand_op_shap=
e_matches()
- [Medium] mtd: spinand: missing cont_read_cache shape check on initial tun=
ing success
--

commit 8733b92e8d67a304d901c8ece339d2fe4c54f7ad
Author: Santhosh Kumar K <s-k6@ti.com>

mtd: spinand: negotiate optimal controller operating point before dirmap cr=
eation

This commit introduces spinand_optimize_controller() to perform PHY
calibration and ranked variant fallback before creating direct mappings in
spinand_probe(). It also re-pairs continuous-read templates by protocol sha=
pe
when falling back to another read variant and embeds the calibrated max_freq
into the dirmap operation templates.

> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index 9dc43c8c4162d..645528b6c2d77 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -1300,6 +1300,7 @@ static int spinand_create_dirmap(struct spinand_dev=
ice *spinand,
>  	info.length =3D nanddev_page_size(nand) + nanddev_per_page_oobsize(nand=
);
>  	info.primary_op_tmpl =3D *spinand->op_templates->update_cache;
>  	info.primary_op_tmpl.data.ecc =3D enable_ecc;
> +	info.primary_op_tmpl.max_freq =3D spinand->max_write_op.max_freq;
>  	desc =3D devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
>  					  spinand->spimem, &info);
>  	if (IS_ERR(desc))
> @@ -1310,9 +1311,11 @@ static int spinand_create_dirmap(struct spinand_de=
vice *spinand,
>  	/* Read descriptor */
>  	info.primary_op_tmpl =3D *spinand->op_templates->read_cache;
>  	info.primary_op_tmpl.data.ecc =3D enable_ecc;
> +	info.primary_op_tmpl.max_freq =3D spinand->max_read_op.max_freq;
>  	if (secondary_op) {
>  		info.secondary_op_tmpl =3D *spinand->op_templates->cont_read_cache;
>  		info.secondary_op_tmpl.data.ecc =3D enable_ecc;
> +		info.secondary_op_tmpl.max_freq =3D spinand->max_read_op.max_freq;
>  	}

[Severity: High]
Does unconditionally overwriting info.primary_op_tmpl.max_freq and
info.secondary_op_tmpl.max_freq in spinand_create_dirmap() discard the
per-variant datasheet frequency limits defined by flash drivers?

When mem->spi->post_config_max_speed_hz is 0, or when
spi_mem_execute_tuning() is unsupported (-EOPNOTSUPP) or fails in
spinand_optimize_controller(), spinand->max_read_op.max_freq and
spinand->max_write_op.max_freq remain 0.

In spinand_create_dirmap(), info.primary_op_tmpl and info.secondary_op_tmpl
are first initialized from *spinand->op_templates->update_cache,
*spinand->op_templates->read_cache, and
*spinand->op_templates->cont_read_cache, which carry per-variant frequency
caps in drivers such as drivers/mtd/nand/spi/winbond.c (e.g., 54 MHz,
80 MHz, 86 MHz, 104 MHz, 105 MHz, 120 MHz, 124 MHz, 133 MHz, and 162 MHz).

Overwriting max_freq with 0 causes spi_mem_adjust_op_freq() during
dirmap creation:

drivers/spi/spi-mem.c:spi_mem_adjust_op_freq() {
    ...
	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
		op->max_freq =3D mem->spi->max_speed_hz;
    ...
}

to raise the operation frequency all the way up to mem->spi->max_speed_hz
(for instance, clocking an 80 MHz 1S-4D-4D or 120 MHz 8D-8D-8D op at
166 MHz). Even when tuning succeeds, stamping spinand->max_read_op.max_freq
onto the dirmap templates ignores any lower per-variant max_freq ceiling on
read_cache or cont_read_cache.

> @@ -1559,22 +1562,51 @@ static int spinand_init_odtr_instruction_set(stru=
ct spinand_device *spinand)
>  	return 0;
>  }
> =20
> +/**
> + * spinand_op_shape_matches() - Check whether two ops share the same pro=
tocol
> + *				 shape.
> + * @a: first op
> + * @b: second op
> + *
> + * Compares cmd/addr/data buswidth, addr.nbytes, and DTR-ness, ignoring
> + * dummy cycle count and address value. A continuous-read op and its
> + * corresponding read_cache op are expected to differ only in those igno=
red
> + * fields: continuous read typically needs fewer dummy cycles, and always
> + * targets an internally tracked address rather than the caller's.
> + */
> +static bool spinand_op_shape_matches(const struct spi_mem_op *a,
> +				     const struct spi_mem_op *b)
> +{
> +	return a->cmd.buswidth =3D=3D b->cmd.buswidth &&
> +	       a->cmd.dtr =3D=3D b->cmd.dtr &&
> +	       a->addr.nbytes =3D=3D b->addr.nbytes &&
> +	       a->addr.buswidth =3D=3D b->addr.buswidth &&
> +	       a->addr.dtr =3D=3D b->addr.dtr &&
> +	       a->data.buswidth =3D=3D b->data.buswidth &&
> +	       a->data.dtr =3D=3D b->data.dtr;
> +}

[Severity: Medium]
As reported by Sashiko on v4 [1], can spinand_op_shape_matches() ever match
an SSDR continuous-read variant in spinand_find_cont_read_variant(), or pair
the right dummy-cycle sub-variant in ODTR mode?

In drivers/mtd/nand/spi/winbond.c (the only driver defining cont_read_cache
variant tables), all SSDR read_cache variants use a 2-byte address
(addr.nbytes =3D=3D 2, dummy.nbytes =3D=3D ndummy), whereas all SSDR contin=
uous-read
variants convert one address byte into dummy cycles:

#define WINBOND_CONT_READ_FROM_CACHE_1S_8S_8S_OP(ndummy, buf, len, freq) \
	SPI_MEM_OP(SPI_MEM_OP_CMD(0xcb, 1),				\
		   SPI_MEM_OP_ADDR(1, 0, 8),				\
		   SPI_MEM_OP_DUMMY(ndummy - 1, 8),			\
		   SPI_MEM_OP_DATA_IN(len, buf, 8),			\
		   SPI_MEM_OP_MAX_FREQ(freq))

Because spinand_op_shape_matches() requires a->addr.nbytes =3D=3D b->addr.n=
bytes,
spinand_find_cont_read_variant(spinand, best, SSDR) rejects every SSDR entry
and always returns NULL, which causes spinand_try_ranked_variant() to set
spinand->cont_read_possible =3D false on every SSDR fallback.

Conversely, for ODTR variants where WINBOND_CONT_READ_FROM_CACHE_8D_8D_8D_OP
also has addr.nbytes =3D=3D 2, spinand_op_shape_matches() ignores dummy cyc=
le
counts and spinand_find_cont_read_variant() passes skip_mask =3D=3D 0 to
spinand_op_find_best_variant(). If read_cache falls back to a different
dummy-cycle sub-variant, won't spinand_find_cont_read_variant() still pick
the first cont_read_cache sub-variant with a mismatched dummy cycle count,
even though both ops share a single hardware VCR dummy clock register?

[ ... ]

> @@ -2073,6 +2144,199 @@ static void spinand_cleanup(struct spinand_device=
 *spinand)
>  	kfree(spinand->scratchbuf);
>  }
> =20
> +/**
> + * spinand_try_ranked_variant() - Try controller optimization on variant=
s in
> + *				  performance order.
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
> +				/* Only clear; never re-enable a denied capability. */
> +				if (!templates->cont_read_cache)
> +					spinand->cont_read_possible =3D false;
> +			}
> +			return true;
> +		}
> +	}
> +	return false;
> +}

[Severity: High]
Doesn't spinand_try_ranked_variant() need to update templates->read_cache a=
nd
call spinand->configure_chip(spinand, iface) for each candidate variant
before running spi_mem_execute_tuning() (and restore it if all candidates
fail)?

On ODTR-capable Winbond flashes (W35N01JW, W35N02JW, and W35N04JW),
spinand->configure_chip (w35n0xjw_vcr_cfg() in drivers/mtd/nand/spi/winbond=
.c)
inspects spinand->odtr_op_templates.read_cache or
spinand->ssdr_op_templates.read_cache to program the flash chip's Volatile
Configuration Registers with that variant's exact dummy clock count
(W35N01JW_VCR_DUMMY_CLOCK_REG) and I/O mode (W35N01JW_VCR_IO_MODE_REG:
OCTAL_DDR, OCTAL_SDR, or SINGLE_SDR):

drivers/mtd/nand/spi/winbond.c:w35n0xjw_vcr_cfg() {
    ...
	switch (iface) {
	case SSDR:
		ref_op =3D spinand->ssdr_op_templates.read_cache;
		break;
	case ODTR:
		ref_op =3D spinand->odtr_op_templates.read_cache;
		break;
	default:
		return -EOPNOTSUPP;
	}

	dummy_cycles =3D ((ref_op->dummy.nbytes * 8) / ref_op->dummy.buswidth) /
		(ref_op->dummy.dtr ? 2 : 1);
    ...
}

In spinand_optimize_controller(), configure_chip() is only called once befo=
re
Pass 1 (during spinand_init_flash()) and once before Pass 2 using the initi=
al
read_cache template. When spinand_try_ranked_variant() iterates across
variants in read_cache_octal_variants that have different dummy cycle counts
(e.g., 24 vs 16 dummy bytes in ODTR, or 20, 16, 12, and 8 dummy cycles in
SSDR) or a different VCR I/O mode (1S-8S-8S OCTAL_SDR vs 1S-1S-1S
SINGLE_SDR), the flash hardware remains programmed for the initial template=
's
dummy cycles and I/O mode both during spi_mem_execute_tuning() and after
templates->read_cache =3D best is committed.

> +
> +/**
> + * spinand_reset_max_freq_ops() - Copy op templates and zero max_freq on=
 both.
> + * @spinand:    SPI NAND device
> + * @templates:  op template set to copy from
> + *
> + * Called before execute_tuning so max_freq starts at zero; execute_tuni=
ng sets
> + * it to the validated clock rate only on success. A non-zero max_freq m=
eans
> + * controller-optimized; zero means the base rate applies.
> + */
> +static void spinand_reset_max_freq_ops(struct spinand_device *spinand,
> +				       struct spinand_mem_ops *templates)
> +{
> +	spinand->max_read_op =3D *templates->read_cache;
> +	spinand->max_read_op.max_freq =3D 0;
> +	spinand->max_write_op =3D *templates->write_cache;
> +	spinand->max_write_op.max_freq =3D 0;
> +}

[Severity: High]
As reported by Miquel Raynal on v3 [2], won't evaluating variants at the
pre-config base clock in spinand_op_find_best_variant() and then zeroing
max_read_op.max_freq before spi_mem_execute_tuning() select low-dummy-cycle,
low-frequency variants and overclock them at post_config_max_speed_hz?

When spi-max-post-config-frequency-hz is set in DT, mem->spi->max_speed_hz
holds the lower pre-configuration base clock (e.g., 25 MHz) while
mem->spi->post_config_max_speed_hz holds the high-speed target (e.g., 120 M=
Hz
or 166 MHz).

In spinand_op_find_best_variant(), spi_mem_adjust_op_freq() clamps every
candidate in variants->ops[i] (such as Winbond's read_cache_octal_variants:
8D-8D-8D with 24 dummy bytes @ 120 MHz vs 16 dummy bytes @ 86 MHz, or
1S-8S-8S with 20 dummy bytes @ unlimited, 16 @ 162 MHz, 12 @ 124 MHz, and
8 @ 86 MHz) down to the 25 MHz base rate in mem->spi->max_speed_hz.

At the same 25 MHz frequency, same-buswidth ops differ only in dummy cycle
count, so spi_mem_calc_op_duration() ranks the variant with the fewest dummy
cycles and lowest frequency limit (e.g., 86 MHz) as the fastest variant, and
ranks the 20-dummy-cycle 166 MHz variant last.

Then spinand_reset_max_freq_ops() and spinand_try_ranked_variant() zero
spinand->max_read_op.max_freq =3D 0, discarding the 86 MHz limit and allowi=
ng
spi_mem_execute_tuning() to set max_read_op.max_freq to
post_config_max_speed_hz (120 MHz or 166 MHz), violating the flash datashee=
t's
minimum dummy cycles for that clock rate.

> +
> +/**
> + * spinand_optimize_controller() - Negotiate the optimal controller oper=
ating
> + *				   point for the SPI NAND device.
[ ... ]
> +static void spinand_optimize_controller(struct spinand_device *spinand,
> +					struct spi_mem *mem)
> +{
> +	u32 tried_mask;
> +	int ret;
> +
> +	/* Skip entirely when no post-config target is configured. */
> +	if (!mem->spi->post_config_max_speed_hz)
> +		return;
> +
> +	spinand_reset_max_freq_ops(spinand, spinand->op_templates);
> +
> +	ret =3D spi_mem_execute_tuning(mem, &spinand->max_read_op,
> +				     &spinand->max_write_op);
> +	if (ret && ret !=3D -EOPNOTSUPP)
> +		dev_dbg(&mem->spi->dev, "Controller optimization failed: %d\n",
> +			ret);
> +
> +	/*
> +	 * Any non-zero return or a set max_freq means we are done (error,
> +	 * unsupported, or success). Fallback only for the op-specific "skip"
> +	 * signal: ret =3D=3D 0 with max_freq still 0.
> +	 */
> +	if (ret || spinand->max_read_op.max_freq)
> +		return;

[Severity: Medium]
As reported by Sashiko on v3 [3], if the initial spi_mem_execute_tuning()
call succeeds here, doesn't spinand_optimize_controller() return without
verifying that spinand->op_templates->cont_read_cache matches the protocol
shape of spinand->op_templates->read_cache?

In spinand_match_and_init(), cont_read_cache is selected independently from
info->op_variants.cont_read_cache without checking addr.nbytes equality
against read_cache. When the initial tuning succeeds, spinand_create_dirmap=
()
stamps spinand->max_read_op.max_freq onto info.secondary_op_tmpl even when
cont_read_cache has a different addr.nbytes (e.g., 1 address byte instead of
2 address bytes on Winbond SSDR variants) or a different protocol shape that
was never validated by spinand_op_shape_matches().

[1] https://lore.kernel.org/r/20260618080209.5701E1F000E9@smtp.kernel.org
[2] https://lore.kernel.org/r/87mrxjg9zi.fsf@bootlin.com
[3] https://lore.kernel.org/r/20260527190440.9DB221F000E9@smtp.kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105105832.2134=
313-1-s-k6@ti.com?part=3D16
