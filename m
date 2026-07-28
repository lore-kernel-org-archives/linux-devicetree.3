Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0454E3A3815
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249682; cv=none; b=K1Fois7F2NYQuHu20432mBo6oZqgB/koFZrRmI7m/EBy9py/An2Yif/3nUEny0PauwSG1c8wTowiDxGIjy2IijzscVwsb3IBuI3aMzPXPObnUtFMDFL2/JXbAXFz9Ne7ed9UCBB8y+wfK0bhczbzvO+wxw9vffDdzs5zCirC0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249682; c=relaxed/simple;
	bh=8wnqOQBLrLD4XwmM9wF0NR9oVFNILXDlhmuRy+JaV+E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BXCzrgfBuH4PH4iv0ZF8Dh5qoDtiqpua/ng95S3eJlHZVLzGGGyjt3rMK83SExToTXaC38rWFF2c2dF2RTGvXdQdhskqiYo8nVRe2idUjbFMfRFuzCpx8L/jCNzILf3eJUvK6MN9hd6zc6rvYL6ISNbTVsixLIxlE5xQW+lFijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMmnlRyA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMmnlRyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402091F000E9;
	Tue, 28 Jul 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249680;
	bh=VPSWbzkEFcgEGmDL6sXVwW/jWw0FsJ4WGhorESWDF+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMmnlRyAPAxWqBZdLxrWrVxj1UOBJZxAK6Z87G2joHwBJDWoK9tB8sEj/qd8Zz3iY
	 zK5Wny6+Olx1if37uvfiJTJddev37Oyxv6j4SbZVqhTAWBTfOz3hmDBaaOPbkbmbTg
	 5JTysIiI9eg9LxkwyMdOtYn6dw2d3u/fsQ79wKbbHDwLPuUGFnnH6JsAFCbAI3lm7g
	 Q0lIJfJfPdK7DDZb46+sROu0S7izjxLoH7pKwhg9et79SASQQOCruJc5z4jdxcMfaK
	 dO7yhGV3dREHaDKGwbwJxG3we7h3t/k6Wzd/+AvdYAXCSOPb7uju3fAELWCrrFfaou
	 8t6sZMBENTn/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728142806.1954638-6-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-6-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:41:19 +0000
Message-Id: <20260728144120.402091F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `rtk_clk_regmap_pll_enable()` skips the hardware readiness check (=
`wait_freq_ready`) if the PLL is already powered on, breaking error recover=
y and trusting potentially unready hardware.
- [Medium] `spinlock_t lock` in `struct rtk_clk_regmap_pll` is defined but =
lacks an initialization API, leading to potential kernel panics.
--

--- Patch [5]: [PATCH v11 05/11] clk: realtek: Add support for phase locked=
 loops (PLLs) ---
commit 6b0f9bf0f933b92885502feb8287d2125013ada0
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for phase locked loops (PLLs)

Provide a full set of PLL operations for programmable PLLs and a read-only
variant for fixed or hardware-managed PLLs.

> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
[ ... ]
> +static int rtk_clk_regmap_pll_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_pll *clkp =3D to_rtk_clk_regmap_pll(hw);
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	if (!clkp->seq_power_on)
> +		return ret;
> +
> +	spin_lock_irqsave(&clkp->lock, flags);
> +
> +	if (is_power_on(clkp))
> +		goto unlock;

[Severity: High]
If the PLL is already powered on (or if power_reg is 0 and is_power_on()
defaults to true), does this skip verifying if the clock is actually locked?

If a previous enable attempt timed out in wait_freq_ready(), a subsequent
retry would see it powered on and return success here without ensuring the
hardware is ready. Could this lead to consumer peripherals operating with
an unstable or missing clock?

> +
> +	ret =3D regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		goto unlock;
> +
> +	ret =3D wait_freq_ready(clkp);
> +	if (ret)
> +		goto unlock;
> +
> +unlock:
> +	spin_unlock_irqrestore(&clkp->lock, flags);
> +
> +	return ret;
> +}
[ ... ]
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.h
[ ... ]
> +struct rtk_clk_regmap_pll {
> +	struct rtk_clk_regmap clkr;
> +	const struct reg_sequence *seq_power_on;
> +	u32 num_seq_power_on;
[ ... ]
> +	u32 power_reg;
> +	u32 power_mask;
> +	u32 power_val_on;
> +
> +	/* This lock prevents race conditions when multiple CPUs or contexts
> +	 * simultaneously access this PLL's registers during multi-step operati=
ons
> +	 */
> +	spinlock_t lock;

[Severity: Medium]
Is there a missing helper macro or function to initialize this lock?

Since consumer drivers instantiate struct rtk_clk_regmap_pll, if they do not
manually initialize this lock using spin_lock_init(), could calls to
spin_lock_irqsave() in functions like rtk_clk_regmap_pll_recalc_rate()
trigger a kernel panic when CONFIG_DEBUG_SPINLOCK is enabled?

> +};
> +
> +#define __rtk_clk_regmap_pll_hw(_ptr)  __rtk_clk_regmap_hw(&(_ptr)->clkr)
> +
> +extern const struct clk_ops rtk_clk_pll_ops;
> +extern const struct clk_ops rtk_clk_pll_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_PLL_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728142806.1954=
638-1-eleanor.lin@realtek.com?part=3D5
