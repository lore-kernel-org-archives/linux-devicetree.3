Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A5270EC3
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171779; cv=none; b=ViOnsdlRJ4IlT1qGfcTd1qToAQpVB1w+eX1J06RFS5Tm0zybuJq1z40H13Wmt27QFlPrpb2FhW6gWw1sEeuf8UkvJF34DGL9SrdOS0zN81IVg5aKh+89xJp6LkmwRcXJVDQm+7ps4kj/Th8foSCmBjeiSjG9Y5+9TPeWGnRJOcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171779; c=relaxed/simple;
	bh=MqiVtMbGewciDQakFiiLtZ+z8DagvSctnR02dz4/7Q8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D+6gkeXcjs9lT/4UW/q1NHNvzPmKlJVFIijV+IX1dNYvpWC55Xr08y+e/NVUFMNSzmWuCP4gpbitQ5S8/riqyxsGNvXXS46RYwgFgk01yXAqB20VaLz4n4QDsm7AMkF3PofN7vvwbfVk6f6qb1QgtMY4ocxmPr5IPsBQ0Y4PfgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFfprff4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFfprff4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C81F00898;
	Thu, 11 Jun 2026 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171777;
	bh=yfOi0pzwtU/Opdv8dHXnwzRMBvi+fUOJRvsxY74E8js=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eFfprff4saJc4ZvHWIosoLnRZaGwIMHfwa82//0rjuI0yA11/U1psuwtQDQyzs5+t
	 pWrjsyTCSPCgwRDaf3ejXumQTWkv0o2MJrEP24Jj6Z90Nj37pReTd11sQbMCTvXEop
	 8BoqWeLuPJhGEXX0/Y7xxt1QwYl5Zk0bn44NPx2ZsnWfqZ0q92p8mKBJ4nVvvP4jlv
	 TtG74yomczZDv8nxSunET9oKOUL9nJ20xmrVcOADhrE6oP5sT0RL9n5+AscjrgHHYT
	 uxAEyxOpEhcdje9SuXmBQF4Mt2h+ha+dPUlK+uFf5bgXkbrAz4/rwGO6zTS3I1v1ZN
	 tI60Ko0f3li5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] clk: ultrarisc: add DP1000 clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611-ultrarisc-clock-v1-2-2d93ebb4cc13@ultrarisc.com>
References: <20260611-ultrarisc-clock-v1-2-2d93ebb4cc13@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:56:16 +0000
Message-Id: <20260611095617.765C81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing clocks in `clk_data->hws` evaluate to `NULL` instead of an=
 error pointer, creating dummy clocks.
- [High] Read-modify-write operations on clock control registers fail to ma=
sk the self-clearing load bit, risking spurious loads and preventing divide=
r updates.
- [Low] Missing `<linux/module.h>` include.
--

commit 8cba5aa205eda7abb58c5b279348bd81f69fdc45
Author: Jia Wang <wangjia@ultrarisc.com>

clk: ultrarisc: add DP1000 clock driver
   =20
Add a clock driver for the UltraRISC DP1000 SoC.
   =20
The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
and SPI0-1.

> diff --git a/drivers/clk/ultrarisc/clk-ultrarisc.c b/drivers/clk/ultraris=
c/clk-ultrarisc.c
> index 0000000000000..2b970565a4be8
> --- /dev/null
> +++ b/drivers/clk/ultrarisc/clk-ultrarisc.c
> @@ -0,0 +1,417 @@
[ ... ]
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>

[Severity: Low]
Should <linux/module.h> be explicitly included here?

The file uses module macros like MODULE_DESCRIPTION and EXPORT_SYMBOL_GPL(),
and relying on implicit inclusion can sometimes cause build failures.

[ ... ]
> +static int ultrarisc_divider_set_rate(struct clk_hw *hw, unsigned long r=
ate,
> +				      unsigned long parent_rate)
> +{
[ ... ]
> +	scoped_guard(spinlock_irqsave, divider->lock) {
> +		val =3D readl_relaxed(divider->reg);
> +		val &=3D ~(clk_div_mask(divider->width) << divider->shift);
> +		val |=3D value << divider->shift;
> +		writel_relaxed(val, divider->reg);

[Severity: High]
Does this read-modify-write sequence need to mask out divider_clk->load_mask
from the read value before the first write?

If the hardware hasn't cleared the bit from a previous operation, the first
write could write it as 1. Then the second write (below) would also write 1,
failing to provide the required 0->1 transition to trigger the hardware.

> +
> +		if (divider_clk->load_mask) {
> +			/*
> +			 * The divider update is triggered by writing 1 to the
> +			 * self-clearing load bit after programming the new
> +			 * divider field.
> +			 */
> +			writel_relaxed(val | divider_clk->load_mask,
> +				       divider->reg);
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]
> +static struct clk_hw *
> +ultrarisc_clk_register_divider(struct device *dev,
> +			       const struct ultrarisc_divider_desc *desc,
> +			       struct clk_hw *parent_hw, void __iomem *base,
> +			       spinlock_t *lock)
> +{
[ ... ]
> +	if (desc->gate_bit !=3D ULTRARISC_CLK_NO_GATE) {
> +		divider->gate.reg =3D reg;
> +		divider->gate.bit_idx =3D desc->gate_bit;
> +		divider->gate.flags =3D desc->gate_flags;
> +		divider->gate.lock =3D lock;
> +		gate_hw =3D &divider->gate.hw;
> +		gate_ops =3D &clk_gate_ops;

[Severity: High]
Can using the standard clk_gate_ops here cause spurious loads?

The standard gate ops perform a generic read-modify-write. If a gate
operation executes while the load_mask bit is still 1, it will blindly
write 1 back to the load bit, potentially triggering a spurious hardware
reload or corrupting the update state machine.

> +	}
> +
> +	return devm_clk_hw_register_composite_pdata(dev, desc->name, &pdata, 1,
> +						    NULL, NULL,
> +						    &divider->divider.hw,
> +						    &ultrarisc_divider_ops,
> +						    gate_hw, gate_ops,
> +						    CLK_GET_RATE_NOCACHE);
> +}

[ ... ]
> +static int ultrarisc_clk_register_fixed_factors(struct device *dev,
> +						struct clk_hw_onecell_data *clk_data,
> +						const struct ultrarisc_clk_soc_data *soc_data)
> +{
[ ... ]
> +		parent_hw =3D clk_data->hws[desc->parent_id];
> +		if (!parent_hw)
> +			return -EINVAL;

[Severity: High]
If the clk_data initialization (below) is fixed to use error pointers
instead of NULL, should this validation check use IS_ERR_OR_NULL() or
IS_ERR() to avoid dereferencing an ERR_PTR?

> +
> +		hw =3D devm_clk_hw_register_fixed_factor_parent_hw(dev, desc->name,
> +								 parent_hw,

[ ... ]
> +int ultrarisc_clk_probe(struct platform_device *pdev,
> +			const struct ultrarisc_clk_soc_data *soc_data)
> +{
[ ... ]
> +	clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws,
> +						 soc_data->num_clks),
> +				GFP_KERNEL);

[Severity: High]
Since this array is zero-initialized, any unpopulated clock IDs will remain
NULL. Does this need to be explicitly filled with ERR_PTR(-ENOENT)?

When a consumer requests an invalid clock index, of_clk_hw_onecell_get()
returns this NULL pointer. The clock framework considers NULL a valid
optional dummy clock, allowing consumer drivers to silently succeed at
enabling the clock instead of failing. If they then access peripheral
registers without the clock actually being enabled, it could trigger a bus
fault.

> +	if (!clk_data)
> +		return -ENOMEM;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611-ultrarisc-=
clock-v1-0-2d93ebb4cc13@ultrarisc.com?part=3D2
