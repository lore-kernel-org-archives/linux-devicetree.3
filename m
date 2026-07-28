Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8023394B
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249618; cv=none; b=P4F7mO2Qpz378OzgrqlKmyDUeTQQjYSVmrDf5u8qEh/4/L+gB7t0JHOOJUcSWpfGhLVjEJALBjRhBAajXk4+SAn4Lnrl+6h6RgwFqzXfJCkZq5BdYdlDHMIuC6xIaKbpm5iyzJE9zOn0njUWwI0d4Lxt+htQHtS0v/W5NIkpBOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249618; c=relaxed/simple;
	bh=sc1A7vrhBYDlo/rwcWR2bGMWREWTxeubnUaFQH6qJd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cBUISl1qwDd41CyrLnFGvdqCO7/VDmgH/kDFAGIH1Jbvl+fSGuPxyDEB8SI53A4SssBVpZgjHjUnGh3uEQf867GalJOLEQro+3b/yu/vI+DQgPusTVwI6huQTmLf+jb7NOmr/jzkXFoKRewIJtzk5nOKUEjqipIRb4aA4UVAwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX6logAS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX6logAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F7B1F000E9;
	Tue, 28 Jul 2026 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249617;
	bh=d2lQELmkfqwuWM2KYAGBMp0387YqiQiruVpy12awkUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fX6logASd6Fb1+Kvbm3SyJsvdjNiB3ZrQz2WK350T9vfASzVIiItbzlfjj+fYvNKP
	 Pi6U3r2HMn7UpIeDsAiXjDs4tphOfjSO22W8qTaLss5lMnvSYIH2cr4d3zduKe5wDd
	 LlfE+7q9Ub2S0sCDt4MRF3zAqWgaAz6XJPBIkzBAb11pxSriNtTcyRMlikssvYb6Wr
	 0xOxTgfipN+mACwegerKCXrFecmqodyDeyp/51/3u/4mG5QdA75p1ez6IDycZOPgah
	 6UOFG0jaie+1ixp4aan1bHFWZdTnLrKC0CqBNoIYqgdrysG5qLHJwxaRJRTTGzdA5a
	 AmzuCOl1FtqtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/11] clk: realtek: Add support for MMC-tuned PLL
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728142806.1954638-9-eleanor.lin@realtek.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-9-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 14:40:16 +0000
Message-Id: <20260728144016.B1F7B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] CCF API contract violation: determine_rate calculates dynamic rate=
s while set_rate hardcodes fixed PLL settings.
- [Medium] Intermediate integer overflow in 32-bit clock rate calculation w=
ithin determine_rate.
--

--- Patch [8]: [PATCH v11 08/11] clk: realtek: Add support for MMC-tuned PL=
L clocks ---
commit d6c866691778847bec596fd7ef12315587301b82
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for MMC-tuned PLL clocks

This commit adds clk_pll_mmc_ops for enable/disable, prepare, rate control,
and status operations on MMC PLL clocks. It also adds clk_pll_mmc_phase_ops
to support phase get/set operations.

> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> index 0000000000000..8da1933a5a079
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
[ ... ]
> +static int rtk_clk_regmap_pll_mmc_determine_rate(struct clk_hw *hw, stru=
ct clk_rate_request *req)
> +{
> +	u32 val;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	val =3D DIV_ROUND_CLOSEST_ULL((u64)req->rate * 4, req->best_parent_rate=
);
> +	val =3D clamp_t(u32, val, RTK_PLL_MMC_VAL_MIN, RTK_PLL_MMC_VAL_MAX);
> +	req->rate =3D req->best_parent_rate * val / 4;

[Severity: Medium]
Could this calculation overflow on 32-bit platforms where unsigned long is
32 bits?

With a parent rate of 27MHz and val of 255, the intermediate result of
req->best_parent_rate * val is ~6.88 billion. This exceeds U32_MAX and
truncates to ~2.59 billion before dividing by 4, returning an incorrect
target rate to the caller.

> +
> +	return 0;
> +}
> +
> +static int rtk_clk_regmap_pll_mmc_set_rate(struct clk_hw *hw, unsigned l=
ong rate,
> +					   unsigned long parent_rate)
> +{
> +	struct rtk_clk_regmap_pll_mmc *clkm =3D to_clk_pll_mmc(hw);
> +	u32 val =3D RTK_PLL_MMC_SSC_DIV_N_VAL;

[Severity: High]
Does this violate the Common Clock Framework API contract by hardcoding a f=
ixed
multiplier here, while allowing dynamic rate calculations in
rtk_clk_regmap_pll_mmc_determine_rate()?

Because rtk_clk_regmap_pll_mmc_determine_rate() calculates requested
rates dynamically, it signals to callers that arbitrary target rates can be
achieved. However, this function ignores the requested rate and uncondition=
ally
applies a static multiplier to the hardware.

Downstream consumers relying on clk_round_rate() or clk_set_rate() returning
the truth might miscalculate their internal dividers, as they would assume =
the
dynamically requested rate was successfully applied rather than the fixed r=
ate.
=20
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728142806.1954=
638-1-eleanor.lin@realtek.com?part=3D8
