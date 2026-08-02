Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B538397928
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785669758; cv=none; b=pTiPueASE/tpZyBxrkRLtXNh4q3FuG4hQKIoL9hG+ZXlUf8y/IvLkZEB5szqIPoigREXKthyunFS+KMH5oQWdrM8wUa5uuPdFXSnG24B0F2i37YUNg/hPab9uFPEqOUcPLfnpSOPMPxjkUl9FVdsP0ujPPJCiEPYR/f/xK7iCtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785669758; c=relaxed/simple;
	bh=2LCo2RIKQ/d9hWQSe1dNdBtVbOb8y+mjl/T1zcC7xXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NZcnNs4kf2rW0ecvU6S2T4YjT5pkrL/NekXAjGPx0KdHYutGlTfvRsO8Z5dA8lw+S6oEWeYlzSKwdagE5HNqW4evPoXAQGH5cczvadcydvYa+2MoU7wNcooo9BEUh406G37I56vPJO5xAFKIOgrHmB/a9jDRTb1vpS611lFZtrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJ4c9P48; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJ4c9P48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ED41F00A3A;
	Sun,  2 Aug 2026 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785669755;
	bh=bok1lv1Ugma24YVeRgKEqJs8vLM24Cl5Bywjd4z+si0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bJ4c9P48evt4RswopkbLaI8sBXSRMtSUqhqdmrTXOPShyqxlbkAQW+LiXd+z1W6bB
	 jJ2N/HgG2E2s6rF1TVnu77NwG/GnpCLOPkpCks0XB12lmosoVJoEK0U0F/1Uz7BjCG
	 raTLEkoAw6K+FJcDBGPT0Q3oHl6zqC7Balm+WdVv9uWr9sXLgtFkxPLdfyrTb2dd5C
	 +ufGXnDpPICf8fVkZdNDV+jQcpnRDBckJuB79qTxxzXUbo2aLm6O5lcWLpoarEu2rp
	 WowIptdk3u/j4etBw4eggiSOL1ODpwYz3pqzt3pu+qtvJfTPihEz0cNCpLxrStIuKG
	 OdzD/P4eweEQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 13/25] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 11:22:34 +0000
Message-Id: <20260802112235.99ED41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Inefficient sleeping poll used for an extremely short hardware t=
imeout (20us).
--

--- Patch [13]: [PATCH v5 13/25] clk: mediatek: pll: Add ops for PLLs using=
 set/clr regs ---
commit 7ebf36f5d586a3b3f29b19a31c297cb55dbdcedb
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pll: Add ops for PLLs using set/clr regs

This commit introduces a new set of PLL clock operations for the MT8189 SoC.
It utilizes set/clear registers for enabling PLLs and controlling BAR resets
instead of the default clock prepare/unprepare operations.

> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> index 9a197a657dce0..3118f68aa9ac8 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c

[ ... ]

> @@ -301,6 +303,60 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	mtk_pll_power_off(pll);
>  }
> =20
> +int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +	u32 val =3D 0;
> +	int ret;
> +
> +	mtk_pll_power_on(pll);
> +
> +	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +	__mtk_pll_tuner_enable(pll);
> +
> +	udelay(PLL_STABILIZATION_DELAY);
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
> +
> +		ret =3D readl_poll_timeout(pll->rst_bar_addr, val,
> +					(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);

[Severity: Medium]
Does using readl_poll_timeout() here introduce unnecessary latency?

Since RST_BAR_TIMEOUT is only 20us, specifying a 1us delay translates to
usleep_range(1, 1). Due to hrtimer and context switching overhead, this will
often sleep for much longer than the intended 20us total timeout.

Would it be better to use readl_poll_timeout_atomic() here to avoid the
scheduling overhead for such a short hardware timeout?

> +		if (ret) {
> +			mtk_pll_unprepare_setclr(hw);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
> +
> +void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +	u32 val =3D 0;
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
> +
> +		/* ignore return code to continue unpreparing the PLL if
> +		 * a error occurs on register read poll.
> +		 */
> +		readl_poll_timeout(pll->rst_bar_addr, val,
> +				   !(val & pll->data->rst_bar_mask), 1,
> +				   RST_BAR_TIMEOUT);

[Severity: Medium]
Similarly, should this use readl_poll_timeout_atomic() instead?

The 1us delay on the clock unprepare path will cause the same sleeping
overhead and context switching latency as in mtk_pll_prepare_setclr().

> +	}
> +
> +	__mtk_pll_tuner_disable(pll);
> +
> +	writel(BIT(pll->data->pll_en_bit), pll->en_clr_addr);
> +
> +	mtk_pll_power_off(pll);
> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_unprepare_setclr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-mt8189-clo=
cks-system-base-v5-0-ac4410697cc2@collabora.com?part=3D13
