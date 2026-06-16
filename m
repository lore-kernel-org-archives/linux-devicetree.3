Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3737FF6A
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642618; cv=none; b=UlnR0GXIC3DMUCCguxy8KcH8ZQTAwolQF7VxSSfzFOhSxs5Yy4LmjD5mrV4cRrcRBX9ZR6clQC+q422v7/jQsf5MkLEWGLqN0X+6+/fGYSl2Z/1JIkdaDiv1Oak8MoSgeVMBfJJu+JF6psRjHwinZ6dhpQiJMJBCL586I5bGOwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642618; c=relaxed/simple;
	bh=watumehJ6EexMytjlX780i5ZE3ij6Ibj/p4wKNTHppY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c65jc6FwYMmtrDMOWWoSlg2RZ1+7Uu6R0SeAaTHuxMD4JtXfCUAkHHBJiaDsssVtFDGBqKqjWDqPqhe5Yj+eMtMOMDiTyY2+ZpesntHdR+BwSg6ppw4NRf2tRxZIoY0KrAK5vwTx2uaM48ykGLMSz90v8e4odOV1IM7OryAC6XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfQZJAdP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfQZJAdP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CAB1F00A3A;
	Tue, 16 Jun 2026 20:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642617;
	bh=rXgK0ID5s+weO3hNI8Y0r5eMUS0FJZUl9jje2rnotGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QfQZJAdPtEbb20Vyh6RRTE7dfbf71zjo6YZlRgeQBsphVi6PXTZClWhV1XFQuyzb1
	 rOQXRGPIVCepdUOJ/IH9IKh+1qryM7yO+UGb85v/VEhc9weBOlCdxdeKSsISL/yM1B
	 mqVmqASWDnvslnfBxLanhShzFrzFOdrFWCJ0mIosspMfIOODwNPut4DCB4yq0XUN9Q
	 hAyeZ5QFdfCs52QTWxA2ANYcmhdL8DMz1eZeY5jcyvku/whhX3k93CiYtByGKcz3oD
	 JlKGDPTfroOGWEsxFkkr/RNhOtK4+dXgvQZN4SVHmMvM5JY+guKO+OeixKXghjWnMF
	 HmmHM/3dXZPIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 07/12] clk: zte: Introduce a driver for
 zx297520v3 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-zx29clk-v4-7-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-7-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:43:36 +0000
Message-Id: <20260616204337.02CAB1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The 'dpll' and 'unknownpll' clocks are incorrectly configured with=
 a single parent, leading to incorrect rate calculations and potential cloc=
k orphaning.

Pre-existing issues:
- [High] The `struct auxiliary_device` is allocated with `devm_kzalloc`, de=
coupling its memory lifecycle from its embedded kobject reference count.
- [High] The driver fails to properly validate the return value of `device_=
node_to_regmap()`, resulting in an invalid pointer dereference if the regma=
p cannot be obtained.
--

commit 41eccb5b69bddbf772e343c7bf76be8415a468bc
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a new clock driver for the ZTE zx297520v3 SoC.
It adds support for the top clocks, including various PLLs, AHB, timers,
and USB controllers. The patch wires up the clock configuration structures
and registers the driver via the zx_clk_probe framework.

Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..50263bca6e087
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +	/* Default value 0x4834902d. Feeds dpll. 46.08 MHz. Bit 25 can be set, =
so two parents are
> +	 * possible. It looks like both values select the 26 MHz oscillator tho=
ugh.
> +	 */
> +	{
> +		.id =3D 0,
> +		.name =3D "unknownpll",
> +		.parents =3D clk_main,
> +		.num_parents =3D ARRAY_SIZE(clk_main),

[Severity: High]
The documentation block here states this PLL has two possible parents, but =
it
is restricted to the single parent in clk_main. Does hardcoding a single pa=
rent
cause an out-of-bounds index lookup if the hardware selects a parent index =
> 0?

> +		.rate =3D 0,
> +		.postdivs =3D unknownpll_postdivs,
> +		.num_postdivs =3D ARRAY_SIZE(unknownpll_postdivs),
> +		.reg =3D 0x100,
> +	},
> +
> +	/* The documentation says 491.52 MHz and measurement with the LSP TDM d=
evice supports this.
> +	 * The default value is 0x480c2011, but not all boot loaders set it up.=
 To get to 491.52
> +	 * with these settings it needs a 23.04 MHz reference clock, which matc=
hes unknownpll_d2.
> +	 * If unknownpll is disabled, dpll loses its lock. We set the frequency=
 on this PLL if we
> +	 * find it is not enabled by the boot loader.
> +	 *
> +	 * The proprietary LTE driver or coproc enables and disables it. TDM an=
d I2S can use it.
> +	 *
> +	 * It accepts parent values 0, 1, 2 and 3. Parent 0 is unknownpll_d2. T=
he others look like
> +	 * osc26m. With a parent !=3D 0 dpll never loses its lock even when all=
 other PLLs are off
> +	 * and the TDM counter register increases at a rate consistent with a 2=
6.0/23.04 clock
> +	 * increase.
> +	 */
> +	{
> +		.id =3D ZX297520V3_DPLL,
> +		.name =3D "dpll",
> +		.parents =3D clk_main,
> +		.num_parents =3D ARRAY_SIZE(clk_main),

[Severity: High]
Similarly, the comment states this PLL accepts parent values 0, 1, 2, and 3,
with parent 0 being unknownpll_d2. Since clk_main only contains osc26m, does
restricting this to a single parent cause the clock framework to erroneously
compute all DPLL-derived frequencies using 26 MHz instead of 23.04 MHz?

> +		.rate =3D 491520000,
> +		.postdivs =3D pll_postdivs,
> +		.num_postdivs =3D ARRAY_SIZE(pll_postdivs),
> +		.reg =3D 0x18,
> +	},

[ ... ]

> +static struct platform_driver clk_zx297520v3 =3D {
> +	.probe =3D zx_clk_probe,

[Severity: High]
This is a pre-existing issue, but I noticed two concerns in zx_clk_probe()
located in clk-zx.c:

First, zx_clk_probe() calls device_node_to_regmap(dev->of_node) which
returns an ERR_PTR on failure. The code checks for failure using:

    if (!map)
        return -EINVAL;

Since an error pointer is non-null, will this check evaluate to false and
allow an invalid pointer to be dereferenced later?

Second, zx_clk_probe() allocates the auxiliary device using devm_kzalloc().
When the driver unbinds, devres executes zx_adev_unregister() to uninitiali=
ze
the device before freeing the devm-managed memory.

If an external entity holds an active reference to the auxiliary device,
the reference count will remain non-zero. Could this result in a
use-after-free when the external reference is dropped and put_device() tries
to access the already-freed memory?

> +	.driver =3D {
> +		.name =3D "clk-zx297520v3",
> +		.of_match_table =3D of_match_zx297520v3,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D7
