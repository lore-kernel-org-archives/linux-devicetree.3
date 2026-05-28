Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E3348C6E
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779999014; cv=none; b=l8BvYVV4xiVsZa6rrYOje2UFCjvdiTyV3asjekGdTjxGvrkg++jN2xobFoZWoe17m6fM1h0BQo8rkD4vsMMcsyb/KHtPfOtpXIJtldLzVIJOx9eogOhrqVkOglQFkbMtKI1b+QVXQHk4DQs/fK+cpD/Wk+zILS6/PoCJ9YfFQvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779999014; c=relaxed/simple;
	bh=kvpla4NCh2y6PwjLJ2kMd+LVUxvWm9suSqA842tWvaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u7gOqpsQnWidf05EXoQcm5W9xaPPBLgODqckIaMjmLkyRvIiq6hV0PGC/93FdsGaT40lQVj9r/U+uFGKYm/mzO1ey/JY/JM5u8G5T63H0VJV53TMjzY0O8yXfuB4I0zW38WMOVAZcdwSDfiZ2EqJln38K0clrmjELtvrID6bskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=daJ/wX+n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="daJ/wX+n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6168A1F00A3A;
	Thu, 28 May 2026 20:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779999013;
	bh=h0xIwpmgS7Vpp653Zh26VtDY0AJGiKQy/lkAIxDCW3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=daJ/wX+n2cn6fyTkYY4TMyTB7N9f+R4GgnixqODzLWwr5Fe7mDKzKneYICBf5/CPG
	 3juqEs+4NTpZXu00VvqJ92FT9Ns8dTTq/numqIRT9ZCwDbjCo+JSVhCc65GgI11R8v
	 13oetc0UBz8Q0YXxOEDAJLEZCiqL2b7/2ktiQ7tOlDP7DnHv7wWts2L+xUo7PZoOTg
	 PFoRwujz20UjBvcDn4ECtGHZ5IqYes0ZsGFLjkPDBrc0nWSwBtQ82ghCaU3mDlQngN
	 7sP5ljBgQ5J9RKKrFzYcIPYqm84ja8VZNtfnMBlvvD+5JFymR4qjxghdh98PJAA9aj
	 ACLrNFWNhn9zw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] clk: en7523: add support for Airoha AN7583 clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528190000.9164-4-ansuelsmth@gmail.com>
References: <20260528190000.9164-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 20:10:13 +0000
Message-Id: <20260528201013.6168A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Clocks registered via clk_hw_register_fixed_rate() and clk_hw_regi=
ster() are leaked and leave dangling pointers in the Common Clock Framework=
 if probe fails.
- [High] Read-modify-write race condition in `en7523_reset_update` without =
a lock.
--

commit bef5b4bfdccbca2ef2af773a13a17e2000ca2bec
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: add support for Airoha AN7583 clock

This commit adds support for the Airoha AN7583 clock and reset. It
introduces a new SoC that shares register addresses with EN7581 but
implements different bits, additional base clocks, and dedicated resets.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 087ff4568124f..217d5d5f932d6 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c

[ ... ]

> @@ -1057,6 +1057,28 @@ static int en7581_clk_hw_init(struct platform_devi=
ce *pdev,
>  				     en7581_rst_ofs);
>  }
> =20
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *base;
> +
> +	map =3D syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu"=
);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	en7581_register_clocks(dev, clk_data, map, base);

[Severity: High]
This isn't a bug introduced by this patch, but does calling
en7581_register_clocks() here leak memory and leave dangling pointers if the
subsequent en7581_reset_register() fails?

en7581_register_clocks() registers clocks using clk_hw_register_fixed_rate()
and clk_hw_register() without their devm counterparts, but allocates the
inner structures (like struct en_clk_gate) using devm_kzalloc().

If en7581_reset_register() fails, the probe will fail. The devres framework
will automatically free the memory allocated by devm_kzalloc(), but the
clocks won't be unregistered from the Common Clock Framework, leaving it
with dangling pointers and memory leaks for the fixed rate clocks.

Could these be switched to the devm_clk_hw_register_* family of functions?

> +
> +	return en7581_reset_register(dev, base, an7583_rst_map,
> +				     ARRAY_SIZE(an7583_rst_map),
> +				     en7581_rst_ofs);
> +}

[Severity: High]
This is a pre-existing issue, but can concurrent resets trigger a race
condition since there is no locking during the reset updates?

en7581_reset_register() assigns en7581_reset_ops, which invokes
en7523_reset_update(). That function performs an unlocked read-modify-write:

    val =3D readl(addr);
    if (assert)
        val |=3D BIT(id % RST_NR_PER_BANK);
    else
        val &=3D ~BIT(id % RST_NR_PER_BANK);
    writel(val, addr);

Since multiple independent peripheral drivers (e.g., PCIe, USB, UART) can
trigger concurrent reset_control_assert() or reset_control_deassert() calls
for different bits within the same register bank, could one CPU overwrite
and drop another CPU's concurrent state change?

Could a spinlock be added to serialize access to these shared reset
registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528190000.9164=
-1-ansuelsmth@gmail.com?part=3D3
