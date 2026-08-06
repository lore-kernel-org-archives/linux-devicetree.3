Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5E643B48C
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009143; cv=none; b=YmGsYAlfwGUXlzEe47FtJTH7v8Abt3shYkguXS5fJTUQ3POPWaz3SoP/eQumJ0uuSi+G+WhvHx/WH6i/12gv3y8kXSVkSjUdcsWNi9dfNAPAjY5Urz/KcxepyMqCylaE3Z8jsjAWwpLTLITH21Ljeq1e4ki0PyhNYjNTsif04+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009143; c=relaxed/simple;
	bh=gVvsa7tBtajcXlHf9HVwBk4OkHDFarWt7NmNDscKBKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lL0TzT/XacEkNdOLSnmSX+HFLm8dY77+P5PvfO8JI/hkB7DEeXO3SXzArVoJtnF94BV6y3v4lo9aqOLFc2Ll4qTAKYtzDajoauSuUOrqHilzvATYOpPbIiONliRvT+TwwqeK1eqopTYaIUrnu8H1NjpfS6DBgUi99HOru9WyY2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCe5QUh3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCe5QUh3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ACA71F000E9;
	Thu,  6 Aug 2026 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786009140;
	bh=hZUt084qEQo+w7aN/Zx/Cbv6AbKmXa93Zu15LSEPZAQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GCe5QUh3yJVP6V43bo3khxqco57jDY0rRJroffBmymU1p2SYjuQGunzefGxeT0UeH
	 mtwrkIirrmmotzyvRn4zzbpnnzbkqmWmpxznRrZudDbtjm26NTOkab1zPW1XKot0qE
	 qabsrNGlUXDNZHMuhAueIqMoWAPffwOcHz2WhKUiY3pBrU0B4/Jg+p64OrmdPAtdqc
	 Tp/UKBGJsLBusxNMKmKdtYmhI13J3jf4UakeYDoAXPwbFGxvkt6Bs5GMcPef5m83Og
	 T2KRB/j2hJYX5phr9EkqzRjgY6nHv5QSCemJxCa5Fy37+72GccFMaX+IYv9RPg5uVY
	 fOOFXqrDN76Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] clk: socfpga: agilex72: add clock manager driver
 for Agilex72
Reply-To: sashiko-reviews@lists.linux.dev
To: evon.chiam@altera.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <97675c0efd40a9407b6b1a1941cc73b73dd45d39.1786006669.git.evon.chiam@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:38:59 +0000
Message-Id: <20260806093900.6ACA71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] The `struct clk_init_data init` variable is declared on the st=
ack without zero-initialization, leaving fields like `parent_data` and `par=
ent_hws` containing uninitialized garbage.
- [High] The `gateclk_ops` structure lacks `.enable`, `.disable`, and `.is_=
enabled` callbacks, rendering software clock gating completely non-function=
al.
- [High] Independent clocks `dma_0_core_clk` and `dma_0_hs_clk` are registe=
red with the exact same hardware gate register and bit, leading to uncoordi=
nated hardware state changes.
- [High] Probe error paths leak `kzalloc_obj` memory and leave non-devm clo=
cks registered with the CCF, containing dangling `__iomem` pointers that le=
ad to Use-After-Free.
--

--- Patch [3]: [PATCH 3/5] clk: socfpga: agilex72: add clock manager driver=
 for Agilex72 ---
commit fb18cfcc77d7e1e9f2bfe18c6b8c94bdd0fbad23
Author: Chiam, Evon <evon.chiam@altera.com>
Subject: clk: socfpga: agilex72: add clock manager driver for Agilex72

This commit adds a new clock manager driver to support the Altera Agilex72
platform.

> diff --git a/drivers/clk/socfpga/clk-agilex72.c b/drivers/clk/socfpga/clk=
-agilex72.c
> new file mode 100644
> index 0000000000000..e350d8a9bb4d9
> --- /dev/null
> +++ b/drivers/clk/socfpga/clk-agilex72.c

[ ... ]

> +static const struct clk_ops gateclk_ops =3D {
> +	.recalc_rate =3D agilex72_gate_clk_recalc_rate,
> +	.get_parent  =3D agilex72_gate_get_parent,
> +};

[Severity: High]
Are the .enable, .disable, and .is_enabled callbacks intentionally missing
here?

Without these hooks, clk_enable() and clk_disable() calls will return
success without actually writing to the hardware gate registers, leaving the
physical clock ungated or gated incorrectly.

[ ... ]

> +	{ AGILEX72_DMA_0_CORE_CLK, "dma_0_core_clk", lsp_main_parent,
> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_0_HS_CLK, "dma_0_hs_clk", lsp_mp_parent,
> +	  1, 0xd0, 15, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_1_CORE_CLK, "dma_1_core_clk", lsp_main_parent,
> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },
> +	{ AGILEX72_DMA_1_HS_CLK, "dma_1_hs_clk", lsp_mp_parent,
> +	  1, 0xd0, 16, 0, 0, 0, 0, 0, 0 },

[Severity: High]
Will mapping independent clocks to the exact same hardware gate register
and bit cause uncoordinated state changes?

The dma_0_core_clk and dma_0_hs_clk both map to register 0xd0, bit index 15.
Because they are registered as entirely distinct clk_hw instances, if
two consumer paths enable both clocks and one path later disables its clock,
the reference count for that specific clock drops to 0. This clears bit 15,
instantaneously cutting off the clock for the other active consumer.

The same conflict appears to occur for dma_1_core_clk and dma_1_hs_clk on
bit 16.

[ ... ]

> +static struct clk_hw *
> +agilex72_register_pll(const struct agilex72_pll_clock *clks,
> +		      void __iomem *base, void __iomem *pll_base)
> +{
> +	struct clk_hw *hw_clk;
> +	struct agilex72_pll *pll_clk;
> +	struct clk_init_data init;
> +	const char *name =3D clks->name;
> +	int ret;

[Severity: Critical]
Does this leave the init structure partially uninitialized on the stack?

Because init is not zero-initialized, fields like parent_data and parent_hws
might contain uninitialized stack memory. When passed to clk_hw_register(),
the clock framework might check these garbage values and attempt to derefer=
ence
them.

This same pattern appears in agilex72_register_periph(),
agilex72_register_cnt_periph(), and agilex72_register_gate().

[ ... ]

> +static struct clk_hw *
> +agilex72_register_gate(const struct agilex72_gate_clock *clks,
> +		       void __iomem *regbase)
> +{
> +	struct clk_hw *hw_clk;
> +	struct agilex72_gate_clk *socfpga_clk;
> +	struct clk_init_data init;
> +	int ret;
> +
> +	socfpga_clk =3D kzalloc_obj(*socfpga_clk);
> +	if (!socfpga_clk)
> +		return ERR_PTR(-ENOMEM);
> +
> +	socfpga_clk->hw.reg =3D regbase + clks->gate_reg;
> +	socfpga_clk->hw.bit_idx =3D clks->gate_idx;

[Severity: High]
If the gateclk_ops are updated to use standard gate operations, will this
cause a null pointer dereference?

The hw.lock spinlock assignment for struct clk_gate is missing here.

[ ... ]

> +	clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK] =3D
> +		devm_clk_hw_register_fixed_factor(dev, "usb31_ref_clk",
> +						  "usb31_suspend_clk", 0, 1, 1);
> +	if (IS_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]))
> +		return dev_err_probe(dev,
> +			PTR_ERR(clk_data->clk_data.hws[AGILEX72_USB31_REF_CLK]),
> +			"failed to register clock usb31_ref_clk\n");

[Severity: High]
Does this error path leak memory and leave dangling clock registrations
if devm_clk_hw_register_fixed_factor() fails?

The earlier clocks are allocated with kzalloc_obj() and registered using
clk_hw_register(NULL, ...), which bypasses automatic devres cleanup. If this
returns an error, devres will automatically unmap the MMIO resources, but
the clocks remain registered.

If a tool like debugfs clk_summary attempts to access the still-registered
clocks, the framework will invoke driver callbacks that read from the unmap=
ped
memory, resulting in a synchronous external abort. Could we add proper
unregister calls on the error path, or use devm_clk_hw_register() for all
clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786006669.gi=
t.evon.chiam@altera.com?part=3D3
