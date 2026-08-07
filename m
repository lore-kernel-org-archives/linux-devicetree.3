Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FD12B94
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086196; cv=none; b=uyWEoNVt+wjx/CvK7eNS8tzvJyZSbmwS9JF2apwPxa4O2/AVxBW+6vjNT8rYw7gJtQsN8/lcTTVD0suHfGkFkff6/Vl3DRJqFD1wnLPcidmPkHhZYX/4T6nM1XnBw7e6qYG7o40YqmFWWbgKhWMhaeYUNjJijZc5Bbd7D9IncfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086196; c=relaxed/simple;
	bh=7VYSA6XFUbCEcI0D2x3sctayz0cAUQwxSNe1oNFi0yw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PGn4DfTHmZLie20i47PpzGbY3AjoLhsovwZUTVckR0kcuvM8UMMiDdF93z5KegaVMLZtoexy2J1pviMCnsSBNc+DaGEv2FITTDet0RlgNwIjLyG4b6b8XFspYv4K6oHYtNOaRI4rXVvZ1KuB7raURyc0b4SKlp/vhEi9JSPdYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hK57G289; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hK57G289"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4577B1F00A3A;
	Fri,  7 Aug 2026 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086192;
	bh=kAhMcj4VEYTZ3PkOhSonGDrzsrP7i5PoYK8R7panRMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hK57G289yTvRhvGtHUBy554CKwENWMWiRbPybY/qrF5IGjqUpU0ctbexWrFVziqKu
	 x/u/lw8kuHEivhrbW7LQwi1Vxe/lHrLN1UTN58+/UQZnc2PQUorT6fx3FDzTqOXFzo
	 p0wDlmrKl9t2pxkjGNzeOP07LJRRM9U2WkyPbDBDZm3+q80zeCe+yWDxCJqkjXBn5Q
	 ny0aDXaLyir/fx2o8iFiygUS9cV0iRhFDo+1c8RJPu3ZJ0EjPC1R7TdhVwFQXyHpNq
	 dZv4m/W5I+9kQJEA9m6AataG53FMxF7ZNxozC2DL1+RS/BIROCiBQ0W/so9r1pu7G0
	 WZLUekkA/1kmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/12] clk: qcom: ipq-cmn-pll: Add PON reference
 clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-7-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-7-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:03:11 +0000
Message-Id: <20260807070312.4577B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Integer Overflow / Division by Zero when requesting a specific lar=
ge clock rate.
- [Medium] Non-atomic update of the clock mode and divider creates an inval=
id intermediate hardware state.
- [Medium] Misuse of `WARN_ON_ONCE` for valid framework queries and uniniti=
alized hardware states.
--

--- Patch [7]: [PATCH v2 07/12] clk: qcom: ipq-cmn-pll: Add PON reference c=
lock support ---
commit bc0bab1980249d4673b3cc332facefa3306c107a
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add PON reference clock support

This patch adds support for the PON reference clock in the CMN PLL driver.
The clock is derived from the CMN PLL output divided by 2 and then by a
configurable 8-bit divider. It supports both a fixed 31.25 MHz UNIPHY mode
and a configurable PON mode.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index a24e57b33c6b3..356988c03a7ae 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c
[ ... ]
> +static unsigned long clk_pon_refclk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct clk_cmn_pll *pon_clk =3D to_clk_cmn_pll(hw);
> +	u32 val, div;
> +	int ret;
> +
> +	ret =3D regmap_read(pon_clk->regmap, CMN_PLL_PON_CONFIG, &val);
> +	if (WARN_ON_ONCE(ret))
> +		return 0;
> +
> +	/* Check if in UNIPHY mode (bit 9 =3D 0) - fixed 31.25 MHz */
> +	if (!(val & CMN_PLL_PON_MODE_SEL))
> +		return 31250000UL;
> +
> +	/* PON mode: calculate from divider */
> +	div =3D FIELD_GET(CMN_PLL_PON_DIV_CTRL, val);
> +	if (WARN_ON_ONCE(!div))
> +		return 0;

[Severity: Medium]
Is it safe to use WARN_ON_ONCE() for this check?

If the bootloader leaves the PON hardware uninitialized with a divider of 0,
this will throw a stack trace during boot when the clock framework initially
registers the clock.

Returning 0 without the warning might be safer.

> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2ULL * div);
> +}
> +
> +static int clk_pon_refclk_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> +{
> +	unsigned long div, pon_rate, uniphy_rate =3D 31250000UL;
> +
> +	if (WARN_ON_ONCE(!req->rate))
> +		return -EINVAL;

[Severity: Medium]
Will this throw a stack trace for legitimate clock framework queries?

A user can write 0 to the clock's debugfs clk_rate file, or a consumer
driver can call clk_round_rate(clk, 0) to discover the minimum rate, which
are legal queries.

> +
> +	div =3D DIV64_U64_ROUND_CLOSEST((u64)req->best_parent_rate, 2ULL * req-=
>rate);

[Severity: High]
Can this multiplication overflow and cause a divide-by-zero regression?

If req->rate is set to an exceptionally large value like 1ULL << 63 (which
can be requested by writing to the clock framework's debugfs interface),
the multiplication 2ULL * req->rate evaluates to 0 due to 64-bit unsigned
integer wrapping.

This 0 is then passed as the divisor to DIV64_U64_ROUND_CLOSEST.

> +
> +	/* Clamp to valid range (1-255) */
> +	div =3D clamp_t(unsigned long, div, 1, 255);
[ ... ]
> +static int clk_pon_refclk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct clk_cmn_pll *pon_clk =3D to_clk_cmn_pll(hw);
> +	unsigned long div;
> +	int ret;
> +
> +	if (rate =3D=3D 0)
> +		return -EINVAL;
[ ... ]
> +	div =3D DIV64_U64_ROUND_CLOSEST((u64)parent_rate, 2ULL * rate);

[Severity: High]
Might this also trigger a divide-by-zero regression for the same reason?

If rate wraps when multiplied by 2, passing 0 as the divisor to
DIV64_U64_ROUND_CLOSEST will result in a division by zero.

> +	if (div =3D=3D 0 || div > 255)
> +		return -EINVAL;
> +
> +	/* Switch to PON mode */
> +	ret =3D regmap_set_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
> +			      CMN_PLL_PON_MODE_SEL);
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(pon_clk->regmap, CMN_PLL_PON_CONFIG,
> +				  CMN_PLL_PON_DIV_CTRL,
> +				  FIELD_PREP(CMN_PLL_PON_DIV_CTRL, div));
> +}

[Severity: Medium]
Does this non-atomic update create an invalid intermediate hardware state?

When changing from UNIPHY mode to PON mode, the clock mode is switched
before the new divider is programmed.

If the old divider was zero or invalid, the hardware might momentarily
output an out-of-spec frequency or lock up, especially since this clock
lacks the CLK_SET_RATE_GATE flag and rate changes can happen while active.

Could both fields be updated atomically in a single regmap_update_bits()
call?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D7
