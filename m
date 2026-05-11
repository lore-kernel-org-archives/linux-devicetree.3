Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E976E383318
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539293; cv=none; b=VsPLMh5tM/CjETElJrm9PsHAEAxI0mMQ4u5dPRCS5CgO8OvMDysxhbp69+TNUhSn7am/+B1NcCa+8Fc6W+GEBmoOp3tivpaLu+dd6CIc++RMjNQgnEe098C8pSEXKlhKuhrbcyFn32ZMiCtsN78VWSZk1sfmw6Tf6mYm48rMFv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539293; c=relaxed/simple;
	bh=UWv+hHq/aOuO1UWu+qVEEHCiygh8+grSbEWsdkJxJQQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xmaq4AOlKBBDez3Hvpoqm9RQ9Sfn60zlBTrJMtNGGcLPzgevNTCCSYI2ekXcR7Qvj93l1eKWOXbzeqWM+i6aEKpIRFaPyK85/iS9AnL6tJZpSO2m0bBcM8y2mz+3oFREp6sjk7t09vVimFJ5/HAKPyE/0Y8c2hwpnSU/rOdyNV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDKX+AJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDKX+AJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9BAC2BCB0;
	Mon, 11 May 2026 22:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539292;
	bh=UWv+hHq/aOuO1UWu+qVEEHCiygh8+grSbEWsdkJxJQQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pDKX+AJO+PSpsoy2TgPqyDc62HDh8C74oh3+YDzF57XUmR+JDxfw+iqrNewhDDEKQ
	 PxK3SY6iKTu8Uq1hHJ4P6ftRnpmikgP4Zp9aLtvugQiz+GUd27rab39Hu7CDkLzqNI
	 aLIAehwdITYkhMSI58Ei9YMuD8oZ5dB4xMehaMQAFP+BXqNtKCUCDjJ2tEf07gu/kw
	 9NxMYejyM8ifvsIDxvsbhepBog3LFPz8Cm9i61YObRI9FJpfCOi+8SZTXdpMzLieDW
	 ALtvZbkkyUKo5alqYjNl4NA8b/Lq1t7wSQtM+AZw6iRnhhsP93UPsC/EzK0e5DVjQQ
	 ZOFcZhqzhgbDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 2/4] clk: zte: Introduce a driver for zx297520v3
 top clocks and resets.
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260511-zx29clk-v2-2-29f0edc300f5@gmail.com>
References: <20260511-zx29clk-v2-2-29f0edc300f5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:41:31 +0000
Message-Id: <20260511224132.4E9BAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The driver cannot be loaded as a module because it uses the unexpo=
rted internal function `__clk_lookup()`.
- [High] The driver leaks the OF clock provider registration on probe failu=
re or module unload, causing a Use-After-Free.
- [High] The driver checks for MMIO remapping failure using `!top->base` in=
stead of `IS_ERR()`, leading to a guaranteed kernel crash if mapping fails.
- [High] The reset controller's assert and deassert operations perform unpr=
otected read-modify-write (RMW) operations on shared hardware registers.
- [High] The reset operations do not verify if a requested reset ID corresp=
onds to an initialized register pointer before dereferencing it.
- [Medium] The `zx297520v3_rst_status` function returns inverted status log=
ic.
- [Medium] The Kconfig symbol `COMMON_CLK_ZX297520V3` depends on and select=
s non-existent architecture and SoC configurations.
--

commit 907b20d81591d5c194abf35b53c48cd6ec44122c
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
clk: zte: Introduce a driver for zx297520v3 top clocks and resets.

This patch introduces a clock and reset driver for the ZTE zx297520v3 SoC t=
op
clocks. It provides basic clock gating, multiplexing, and reset controls for
various core devices like PLLs, timers, and USB. The driver also registers a
restart handler for the board.

> diff --git a/drivers/clk/zte/Kconfig b/drivers/clk/zte/Kconfig
> new file mode 100644
> index 0000000000000..e7acd28832cd7
> --- /dev/null
> +++ b/drivers/clk/zte/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# ZTE Clock Drivers
> +#
> +menu "Clock driver for ZTE SoC"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +
> +config COMMON_CLK_ZX297520V3
> +	tristate "Clock driver for ZTE zx297520v3"
> +	default SOC_ZX297520V3

Are ARCH_ZTE and SOC_ZX297520V3 defined anywhere in the kernel tree? It
appears these config symbols do not exist, which might hide this driver unl=
ess
COMPILE_TEST is explicitly enabled.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..aa304dd34b7ba
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c
[ ... ]
> +static int zx297520v3_rst_assert(struct reset_controller_dev *rcdev, uns=
igned long id)
> +{
> +	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_cl=
k_controller, rcdev);
> +	u32 val;
> +
> +	val =3D readl(data->resets[id].reg);

Could an unpopulated reset ID cause a NULL pointer dereference here? Only a
subset of reset IDs seem to be populated with register pointers in the probe
function. If a consumer requests an uninitialized ID, this might pass a NULL
pointer to readl().

> +	val &=3D ~data->resets[id].mask;
> +	writel(val, data->resets[id].reg);

Can these read-modify-write operations race with clock gate operations? It
looks like multiple reset components and clock gates share the same physical
register (e.g. offset 0x74), but these reset callbacks don't acquire reg_lo=
ck
before modifying the register.

[ ... ]
> +static int zx297520v3_rst_status(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	struct zx29_clk_controller *data =3D container_of(rcdev, struct zx29_cl=
k_controller, rcdev);
> +	u32 val;
> +
> +	val =3D readl(data->resets[id].reg);
> +
> +	return (val & data->resets[id].mask) =3D=3D data->resets[id].mask;

Is the status logic inverted here? The reset controller API expects the sta=
tus
callback to return a non-zero value when the reset line is asserted, but th=
is
appears to return 1 when the reset is deasserted based on the logic in the
assert and deassert callbacks.

[ ... ]
> +static int zx297520_topclk_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	top->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	WARN_ON(!top->base);

Does devm_platform_ioremap_resource() return an error pointer on failure
instead of NULL?

If it fails, checking for !top->base will evaluate to false and the driver
will proceed to pass an error pointer to zx297520v3_pll(), which might
cause a crash when readl() dereferences it.

[ ... ]
> +	/* The documentation says 491.52 MHz and measurement with the LSP TDM d=
evice supports this.
> +	 * The default value is 0x480C2011. To get to 491.52 with these setting=
s it needs a 23.04
> +	 * MHz reference clock, which matches unknownpll_d2. If unknownpll is d=
isabled, dpll loses
> +	 * its lock.
> +	 *
> +	 * The proprietary LTE driver or coproc enables and disables it. TDM an=
d I2S can use it.
> +	 *
> +	 * FIXME: Isn't there a nicer way to get the struct clk for unknownpll_=
d2? I don't want to
> +	 * return all generated clocks from zx297520v3_pll or store them in the=
 controller because
> +	 * I need one of them here. I could always pass the parent by name thou=
gh.
> +	 */
> +	res =3D zx297520v3_pll(dev, top->base + 0x18, "dpll", __clk_lookup("unk=
nownpll_d2"));

Will this cause a linker error when built as a module? The driver is
configured as tristate, but __clk_lookup() is an internal function not
exported to modules.

Additionally, should this be called with the clock framework prepare_lock
held to avoid races against concurrent clock registrations?

[ ... ]
> +	hw =3D devm_clk_hw_register_mux(dev, "m0_wclk", m0_sel, ARRAY_SIZE(m0_s=
el),
> +				      0, top->base + 0x38, 0, 2, 0, &reg_lock);
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);
> +	top->clocks->hws[ZX297520V3_M0_WCLK] =3D hw;
> +
> +	of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get, top->clocks=
);

Does this code leak the OF clock provider on probe failure or module unload?

Since it uses of_clk_add_hw_provider() instead of the managed
devm_of_clk_add_hw_provider(), a failure later in the probe function might
leave a dangling pointer in the system's global clock provider list, result=
ing
in a use-after-free during subsequent clock lookups.

> +
> +	res =3D devm_register_restart_handler(dev, zx_restart_handle, top);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-zx29clk-v2=
-0-29f0edc300f5@gmail.com?part=3D2
