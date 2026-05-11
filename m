Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2134DB46
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540660; cv=none; b=KVSHTW9C7W9zz/yHu0unxjCe0/DRXB6IPAULkBn2L2AYt+URsA2RJtUHBhY5wJ8bOC48Fq4nVM4C9b2OVT9cRuXEnlp/bZYThsQ+d2NEFpyAqLlB55ifeNM2Gjwo6yZdzvsXFIGAwINpUAcIXhDANKjksmtjxbriqEzgzQl7gH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540660; c=relaxed/simple;
	bh=k7RvWvky7UsyP+Uu0slp0Jv8+r0iB808mJLEmusNQAs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=izYFRQl+IlZr6p2k0ftjr0/3Fwg3A/OKsIlY8vcoooLU+hv4ekZp6UNwuyPAJ3B6lZv8ypLzW4YU+UB9CgEZwf8UqQfpgd5hAyJdMD+3xXxKVjqO33JZSAjDqpBjsIf3KBxtVxlO+/rgF3nEXunMLUUcxVz9YGA5aSwW4dVX/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb0vtFzp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb0vtFzp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86EDC2BCB0;
	Mon, 11 May 2026 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778540660;
	bh=k7RvWvky7UsyP+Uu0slp0Jv8+r0iB808mJLEmusNQAs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Tb0vtFzpeHDiWa65BbNMacgfyjwsh4L3t9SVawRrK48+0mU+zLqI+q1XJH71U6sut
	 dkIn+beQeCxi9LtMzGkxGYXdn/y1ltUj4HXKYGwpVVK1BlEiK8u2gNDxSjKCS746kH
	 I1XqPt/FtsXMkvSgUGUqKAgedJub5y8Hwd8kKvbJWuSZfZvmuQyQAaZX5XSZWkNagd
	 ISp1bE9SLjg0ONOl3L5i3VMhofGG/epFlrjQzbotKinPV7WlZW6mw7Ex5x9dO95ZQ/
	 7/avg3hfrZ1W1/Lwua4G0VPZI9A3ndxPYzhXaaokErMuUD8mnLyXIq3oQe0uJYX7KA
	 VO9s6y9k192pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 3/4] clk: zte: Introduce a driver for zx297520v3
 matrix clocks and resets.
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-zx29clk-v2-3-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-3-29f0edc300f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:04:19 +0000
Message-Id: <20260511230419.D86EDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Invalid error check for devm_platform_ioremap_resource() leading t=
o kernel panic.
- [High] Use-after-free and resource leak due to missing devm_ wrapper for =
of_clk_add_hw_provider().
- [High] Array overwrite due to duplicate clock ID ZX297520V3_GMAC_RMII.
- [High] Read-modify-write race condition in reset controller operations.
- [Medium] Conflicting mux register configuration for the PDCFG clock.
- [Medium] Unchecked return value from devm_clk_hw_register_mux().
- [Medium] Unreachable and conceptually flawed validation loop.
- [Medium] Potential stack-based buffer overflow in zx297520v3_composite().
--

commit 97af62a33c7b701e38b5f6d4317a6a87bdde1dc9
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 matrix clocks and resets.
   =20
This controls the CPU, DSP, DDR RAM, ethernet, SDIO controllers and a
few more devices. It also contains a number of clock gates to pass
clock signals down to the next controller.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index aa304dd34b7ba..d4b683cb63544 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static const struct zx297520v3_composite matrix_clocks[] =3D {
> +	/* Both 0x24 and 0x28 bits 1 and 2 stop the CPU. There is also a bit in=
 topclk+0x138, which
> +	 * ZTE's uboot calls "A53 reset", which also stops the CPU. I can't rea=
lly tell the
> +	 * difference between matrix+28 and top+138. The clock can be disabled =
and enabled from the
> +	 * Cortex M0 and it will nicely stop and restart the A53, retaining all=
 state.
> +	 *
> +	 * 0x50, bits 0-3 have the DDR clock. A lot of DDR gates and resets are=
 in 0x100.
> +	 */
> +	ZX_CLK_CRIT(CPU,    0x28,  1,  0x24,  1,  2, 0x20,  0, 2, cpu_sel,     =
0,     0, 0),
> +	/* TODO: 0x54 bit 14 and 0x54 bit 6 are supposed to be card detection c=
locks. */
> +	ZX_CLK(SD0,         0x58,  1,  0x54, 12, 13, 0x50,  4, 3, sd0_sel,     =
0,     0, 0),
> +	ZX_CLK(SD1,         0x58,  0,  0x54,  4,  5, 0x50,  8, 3, sd1_sel,     =
0,     0, 0),
> +	/* This is some "denali" NAND, not the qspi connected one. */
> +	ZX_CLK(NAND,        0x58,  4,  0x54, 20, 21, 0x50, 12, 2, nand_sel,    =
0,     0, 0),

This driver registers multiple resets (like SD0, SD1, NAND) that share the
same physical register (0x58). Does the reset framework serialize
concurrent reset operations on different devices sharing this register? If
not, could unprotected read-modify-write sequences in the reset operations
cause data races and corrupted hardware states?

> +	ZX_CLK(SSC,         0x94, 24,  0x84,  1,  2, 0,     0, 0, clk_unknown, =
0,     0, 0),
> +	ZX_CLK(EDCP,        0x68,  0,  0x64,  2,  1, 0x50, 16, 2, edcp_sel,    =
0,     0, 0),
> +	/* PDCFG. Like PMM, either clock bit will allow the device to function.=
 */
> +	ZX_CLK_CRIT(PDCFG,  0x94, 20,  0x88,  0,  1, 0x50, 16, 2, clk_unknown, =
0,     0, 0),

PDCFG and EDCP appear to share the same mux configuration (register 0x50,
shift 16, size 2). Is this a copy-paste error that might cause the two
clocks to interfere with each other's hardware state?

> +	/* There are a lot more VOU related controls in these registers, but tu=
rning off the main
> +	 * clock seems to shut off the entire VOU MMIO range.
> +	 */
> +	ZX_CLK(VOU,        0x16c,  0, 0x168,  0,  1, 0,     0, 0, clk_main,    =
   0,     0, 0),
> +};
> +
> +static const struct zx297520v3_gate matrix_gates[] =3D {
> +	/* ZTE's driver has a statemt to the effect of *(matrix->base+0x11C) =
=3D 5, with a comment
> +	 * suggesting that this sets a 50 mhz clock. The clock code itself list=
s the parents of
> +	 * these clock as 50mhz pll output, but the GMAC driver never enables t=
he clocks.
> +	 *
> +	 * The clocks below are enabled by the boot loader though, so they are =
on. And it turns
> +	 * out that they are necessary for proper operation of the ethernet har=
dware. As far as
> +	 * I can see trough experimentation, bit 1 affects the PHY whereas 0 an=
d 2 affect the
> +	 * MAC chip itself.
> +	 *
> +	 * Chain the wclk and rmii clk together for now. I haven't found a way =
to make either
> +	 * the mdio node or the phy node enable a clock. According to ethernet-=
phy.yaml it is
> +	 * supposed to be possible, but I can't find code to that effect in of_=
mdio.c.
> +	 */
> +	{ZX297520V3_GMAC_PCLK,	"gmac_pclk",		"gpll_d4",	0x110,	  0},
> +	{ZX297520V3_GMAC_RMII,	"gmac_rmii",		"gpll_d4",	0x110,	  1},
> +	{ZX297520V3_GMAC_RMII,	"gmac_wclk",		"gmac_rmii",	0x110,	  2},

Both "gmac_rmii" and "gmac_wclk" use the same ID (ZX297520V3_GMAC_RMII).
Does this cause "gmac_wclk" to overwrite "gmac_rmii" in the onecell data
array, leaving the intended slot for "gmac_wclk" uninitialized?

[ ... ]

> +static int zx297520_matrixclk_probe(struct platform_device *pdev)
> +{
> +	struct zx29_clk_controller *matrix;
> +	struct device *dev =3D &pdev->dev;
> +	struct clk_hw *hw;
> +	unsigned int i;
> +	int res;
> +
> +	dev_info(dev, "Registering zx297520v3 matrix clocks\n");
> +
> +	matrix =3D devm_kzalloc(dev, offsetof(struct zx29_clk_controller,
> +					    resets[ZX297520V3_MATRIXRST_END]), GFP_KERNEL);
> +	if (!matrix)
> +		return -ENOMEM;
> +
> +	matrix->clocks =3D devm_kzalloc(dev, struct_size(matrix->clocks, hws,
> +				   ZX297520V3_MATRIXCLK_END), GFP_KERNEL);
> +	if (!matrix->clocks)
> +		return -ENOMEM;
> +	matrix->clocks->num =3D ZX297520V3_MATRIXCLK_END;
> +
> +	matrix->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	WARN_ON(!matrix->base);

Does devm_platform_ioremap_resource() return an error pointer (like
ERR_PTR(-EINVAL)) instead of NULL on failure?

If it does, this WARN_ON will evaluate to false on failure, and the driver
will proceed to use the error pointer as a base address, which might cause
a kernel panic when dereferenced later. Should this check use IS_ERR()
instead?

> +
> +	/* One stray mux: The TDM mux is in matrixclk and it is passed to the L=
SP controller. In a
> +	 * way the link gate (LSP_TDM_WCLK) could be considered a matching gate=
, but there is no
> +	 * reset and no pclk.
> +	 */
> +	hw =3D devm_clk_hw_register_mux(dev, "tdm_mux", tdm_sel, ARRAY_SIZE(tdm=
_sel), 0,
> +				      matrix->base + 0x50, 24, 2, 0, &reg_lock);

Should the return value of devm_clk_hw_register_mux() be checked for errors?
If registration fails, the error seems to be silently ignored as the "hw"
variable is overwritten shortly after.

> +
> +	res =3D zx297520v3_composite(dev, matrix->base, matrix->clocks, matrix-=
>resets,
> +				   matrix_clocks, ARRAY_SIZE(matrix_clocks));

Looking at the implementation of zx297520v3_composite(), clock names are
copied into 32-byte arrays on the stack using strscpy(), followed
unconditionally by strcat(wclk_name, "_wclk").

Could a sufficiently long clock name cause strcat() to append characters
past the end of the 32-byte array and cause a stack overflow? Would it be
safer to use snprintf() there?

> +	if (res)
> +		return res;
> +
> +	res =3D zx297520v3_gate(dev, matrix->base, matrix->clocks,
> +			      matrix_gates, ARRAY_SIZE(matrix_gates));
> +	if (res)
> +		return res;
> +
> +	for (i =3D 0; i < ZX297520V3_MATRIXCLK_END; i++) {
> +		if (IS_ERR(matrix->clocks->hws[i])) {
> +			pr_err("zx297520 clk %d: register failed with %ld\n",
> +				i, PTR_ERR(matrix->clocks->hws[i]));
> +			return -ENODEV;
> +		}
> +	}

Since zx297520v3_composite() and zx297520v3_gate() check IS_ERR() internally
and return early, and unpopulated array elements in matrix->clocks->hws are
NULL rather than ERR_PTR, will this loop ever catch any errors?

Additionally, if an error were detected here, should it return the actual
error code (PTR_ERR(matrix->clocks->hws[i])) rather than hardcoding -ENODEV
to allow mechanisms like -EPROBE_DEFER to work?

> +
> +	res =3D of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, mat=
rix->clocks);

If the subsequent devm_reset_controller_register() call fails, devres will
free matrix->clocks. Because this uses of_clk_add_hw_provider() without a
.remove callback, will the clock framework retain a dangling pointer to the
freed matrix->clocks in its OF provider list?

Would using devm_of_clk_add_hw_provider() prevent this potential
use-after-free?

> +	if (res)
> +		return res;
> +
> +	matrix->resets[ZX297520V3_DMA_RESET].reg =3D matrix->base + 0x70;
> +	matrix->resets[ZX297520V3_DMA_RESET].mask =3D BIT(0) | BIT(1);
> +	matrix->resets[ZX297520V3_GMAC_RESET].reg =3D matrix->base + 0x114;
> +	matrix->resets[ZX297520V3_GMAC_RESET].mask =3D BIT(0) | BIT(1);
> +
> +	matrix->rcdev.owner =3D THIS_MODULE;
> +	matrix->rcdev.nr_resets =3D ZX297520V3_MATRIXRST_END;
> +	matrix->rcdev.ops =3D &zx297520v3_rst_ops;
> +	matrix->rcdev.of_node =3D dev->of_node;
> +	return devm_reset_controller_register(dev, &matrix->rcdev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-zx29clk-v2=
-0-29f0edc300f5@gmail.com?part=3D3
