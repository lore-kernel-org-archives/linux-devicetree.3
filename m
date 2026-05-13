Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD03655F5
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 23:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778715287; cv=none; b=f+ntBI3aIXpJdOEVMAWOXm9dOFuHtEZBd+MD1FBXnvdW7j18B/DSIwn69fueHubJaOzLrWGdCBtNC4LNsCprv2fxN+a1XB06oggVGu5kHXNP5QniqPWC+FoIp7+rPUaDZcrkyXfBcdeDofh6AJ/NV0/NKHzLd8iRcCXJhy/SnNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778715287; c=relaxed/simple;
	bh=B0/OAMz258wgbDw3koJ7Gzw8BSzya320uDMqXygw/Bg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VrDYW8WL0c7io+Cd90A6sQptiep0Q2TXV16mWCQ4fPnB4gZpUNlVpasq/S01h5G+PJGoWuVX/pdWs1gDu1MoNSnTVME9JGDrsxJXEPmA5PqKrL23+mcrW4u6lW/WjByzuflnPKWov8KFYwJEMH7uFTbGsA75Jml8XdeH3YuFOz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoYwnePl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoYwnePl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89872C19425;
	Wed, 13 May 2026 23:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778715286;
	bh=B0/OAMz258wgbDw3koJ7Gzw8BSzya320uDMqXygw/Bg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GoYwnePliYRDC+rkcpdIp8BIA1tHFDvNEYqIVTWZebQm4rtg00dSIH//33D7Y0zev
	 Wonb6+4HNtQEdSYLb/6fm79pmFsQaaXr36fW2w1GUYIc7HLg9mX56AGGrlA94XYOWR
	 Jo2kbeGYsawPorS8CwU0byPuq5tsEW62JiPWozXPBpyzaqXG9XELjJZD1yEqvm2gIp
	 +4vNt0FcQRofROZUZ7UxmpV783663JBEMfzPNXEGb3xj8jJIe96FQsEt6t+B/5U+Uh
	 kEq8sFLsYTRFEWoj8faj4KShg19H0D252I2u3uTyS0wT+qrn5wsvltY4Nodh79qBDd
	 f9KDfHkeDPcNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] clk: eyeq: Introduce a generic clock type
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512-clk-eyeq7-v6-6-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-6-0540cce18fb2@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 23:34:45 +0000
Message-Id: <20260513233446.89872C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Clock probe functions incorrectly return a boolean value instead=
 of a negative error code upon failure.
- [Medium] eqc_probe_divider() drops the device_node parameter, breaking de=
vice tree linkage for early dividers.
- [Medium] eqc_fill_parent_data() fails to handle parent clocks that belong=
 to the early clock provider.
--

commit 7d25c6d0cb4fb3419bcfe17efee3ab5acfc0310a
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Introduce a generic clock type

This commit introduces a new generic clock type to support complex
clock interdependencies in the OLB, including probe and unregister
function pointers. It updates the match data structures and adds
probe callbacks for dividers, fixed factors, and PLLs.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index e4e690a12a238..623b1d3f041df 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c

[ ... ]

> @@ -336,6 +375,101 @@ static void eqc_auxdev_create_optional(struct devic=
e *dev, void __iomem *base,
>  	}
>  }
> =20
> +static int eqc_fill_parent_data(const struct eqc_clock *clk,
> +				struct clk_hw_onecell_data *cells,
> +				struct clk_parent_data *parent_data)
> +{
> +	int pidx =3D clk->parent_idx;
> +
> +	memset(parent_data, 0, sizeof(struct clk_parent_data));
> +
> +	if (pidx =3D=3D PARENT_BY_FWNAME) {
> +		/* lookup the parent clock by its fw_name */
> +		parent_data->index =3D -1;
> +		parent_data->fw_name =3D clk->parent_name;
> +	} else if (pidx =3D=3D PARENT_BY_NAME) {
> +		/* lookup the parent clock by its global name */
> +		parent_data->index =3D -1;
> +		parent_data->name =3D clk->parent_name;
> +	} else if (pidx >=3D 0 && pidx < cells->num && !IS_ERR(cells->hws[pidx]=
)) {
> +		/* get the parent hw directly */
> +		parent_data->hw =3D cells->hws[pidx];
> +	} else {
> +		return -EINVAL;
> +	}

During the late probe phase, early clocks are marked with ERR_PTR(-EINVAL)
in the cells->hws array. If a late clock depends on an early clock,
!IS_ERR(cells->hws[pidx]) will evaluate to false, and this will return -EIN=
VAL.

Does this prevent late clocks from using early clocks as parents?

Should this assign parent_data->index =3D pidx when the hardware pointer is=
 an
error, allowing the clock framework to resolve the parent index via the
device tree?

> +
> +	return 0;
> +}
> +
> +static int eqc_probe_divider(struct device *dev, struct device_node *np,
> +			     const struct eqc_clock *clk, void __iomem *base,
> +			     struct clk_hw_onecell_data *cells)
> +{
> +	struct clk_parent_data parent_data;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	ret =3D eqc_fill_parent_data(clk, cells, &parent_data);
> +	if (ret)
> +		return ret;
> +
> +	hw =3D clk_hw_register_divider_table_parent_data(dev, clk->name,
> +			&parent_data, 0, base + clk->div.reg, clk->div.shift, clk->div.width,
> +			clk->div.table ? 0 : CLK_DIVIDER_EVEN_INTEGERS, clk->div.table, NULL);

The clk_hw_register_divider_table_parent_data() macro hardcodes the
device_node (np) argument to NULL when calling __clk_hw_register_divider().

If this is called during early initialization where dev is NULL, does this
cause both dev and np to be NULL? Could this break device tree-based parent
resolution and prevent of_clk_set_defaults() from working?

> +	if (IS_ERR(hw))
> +		return IS_ERR(hw);

Since IS_ERR() evaluates to a boolean, does this return 1 on failure instead
of the actual negative error code? Should this return PTR_ERR(hw) instead?

> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}
> +
> +static int eqc_probe_fixed_factor(struct device *dev, struct device_node=
 *np,
> +				  const struct eqc_clock *clk, void __iomem *base,
> +				  struct clk_hw_onecell_data *cells)
> +{
> +	struct clk_parent_data parent_data;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	ret =3D eqc_fill_parent_data(clk, cells, &parent_data);
> +	if (ret)
> +		return ret;
> +
> +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_d=
ata, 0,
> +						clk->ff.mult, clk->ff.div, 0, 0);
> +	if (IS_ERR(hw))
> +		return IS_ERR(hw);

Similar to the divider probe function above, does this return a boolean 1
instead of the negative error code?

> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}
> +
> +static int eqc_probe_pll_fracg(struct device *dev, struct device_node *n=
p,
> +			       const struct eqc_clock *clk, void __iomem *base,
> +			       struct clk_hw_onecell_data *cells)
> +{
> +	struct clk_parent_data parent_data;
> +	unsigned long mult, div, acc;
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	ret =3D eqc_pll_parse_fracg(base + clk->pll.reg, &mult, &div, &acc);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eqc_fill_parent_data(clk, cells, &parent_data);
> +	if (ret)
> +		return ret;
> +
> +	hw =3D clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_d=
ata, 0, mult,
> +						div, acc, CLK_FIXED_FACTOR_FIXED_ACCURACY);
> +	if (IS_ERR(hw))
> +		return IS_ERR(hw);

Does this also need to return PTR_ERR(hw) instead of IS_ERR(hw) to
propagate the correct error code?

> +
> +	cells->hws[clk->index] =3D hw;
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512-clk-eyeq7-=
v6-0-0540cce18fb2@bootlin.com?part=3D6
