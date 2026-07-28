Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E6042EEB3
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240690; cv=none; b=eRtWJ1Rd4WnEOHKteKoX1kMYAaeSyXrdTZ2H+cQvN1srfeYraEN2SK9OEGeCiWXOFSBP8zuIZvxrxkIoKU8Gk3DsYFDDQyL3QW4v5k2t0B60556H8/TD3qPtxJZvp7VO2N3mP1mDhcAkFQg7J8+miY47i8LsEmz0/avrZ64zA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240690; c=relaxed/simple;
	bh=M+SHFvNvIJXoNCl/TLPd5mTq8xsGfcHXG2o3WORY18I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CWztFkRhabaMY3Slt8qUeOqS9sf/wUNf+DqUy7SVZd/CrawswQFElELjt5RcrfhsbNsXtVmWFzMU0cypfJnPxwVqLej90YlCb1UmgTUjUTyPi3ADvSVNW563sjsxLitqH94Md7+n4wS/Vc2kMdKeZ+es3g/mUCf4PNMdxZ60LKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdIgAwpz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdIgAwpz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612291F00A3E;
	Tue, 28 Jul 2026 12:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785240688;
	bh=K8KFjhsauRBx0lJ6+4v6b1ttA5B/6STzvSEdEMRcEVo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gdIgAwpzvAajju+Ng3zO4DguZohB2EC36BD3QMxJ8z96P0Beo3GavfBIvK+nsyjI0
	 Bgfee+JsA3Tl+VElzvCoG/qG8cOjxWoq285/tSW46odxPH7QTm3etrKkTNx1HYQAth
	 RWRp4KM4XMzn0p7o0pvznpr2Ubn+njhlE6oW/USFIjaRY06IfxeBJILp0L6ZxtGaNj
	 fWvzfcg9RAK8oZZWkCs9KYejyOX9q5h8CC7eTyTtzX7U3e9tDmaykFN3PpYZ2W826j
	 SlRuJQYbuU5K3V7hVqnEjAJpfysPPBZFC4tW+1o0F+Rc/osCF2kepkm7XzC9Tsr2zW
	 TP7kCqaye10Eg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/13] clk: samsung: exynos8855: add block top and peric
 clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: raghav.s <raghav.s@samsung.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260728121111.2077860-4-raghav.s@samsung.com>
References: <20260728121111.2077860-1-raghav.s@samsung.com>
 <CGME20260728115251epcas5p19aaf5fc01e0f847bc2adcec67bebda3a@epcas5p1.samsung.com>
 <20260728121111.2077860-4-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 12:11:28 +0000
Message-Id: <20260728121128.612291F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The UART DBG PCLK gate clock is incorrectly assigned the functiona=
l (baud rate) clock as its parent instead of the NOC peripheral bus clock.
--

--- Patch [3]: [PATCH 03/13] clk: samsung: exynos8855: add block top and pe=
ric clock support ---
commit 749ec1f523b7d61993f27762dded3422cad15aae
Author: raghav.s <raghav.s@samsung.com>

clk: samsung: exynos8855: add block top and peric clock support

This commit adds support for the CMU_TOP and CMU_PERIC clock domains
on the Exynos 8855 SoC. It registers compatible strings and cmu_info
data to provide clocks for these blocks.

> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/c=
lk-exynos8855.c
> new file mode 100644
> index 0000000000000..93528f0077a4f
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos8855.c

[ ... ]

> +static const struct samsung_gate_clock peric_gate_clks[] __initconst =3D=
 {
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_CMU_PERIC_IPCLKPORT_PCLK, "gout_cmu_peric_ipclkport_pclk",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_CMU_PERIC_IPCLKPORT_PCLK,
> +	     21, CLK_IS_CRITICAL, 0),
> +	GATE(CLK_GOUT_SYSREG_PERIC_IPCLKPORT_PCLK, "gout_sysreg_peric_ipclkport=
_pclk",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_SYSREG_PERIC_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +	/* System will hang if this critical clock is gated */
> +	GATE(CLK_GOUT_UART_DBG_PERIC_IPCLKPORT_PCLK, "gout_uart_dbg_peric_ipclk=
port_pclk",
> +	     "dout_clkcmu_peric_uart_dbg",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_UART_DBG_IPCLKPORT_PCLK,
> +	     21, CLK_IS_CRITICAL, 0),

[Severity: High]
Is dout_clkcmu_peric_uart_dbg the correct parent clock for the UART DBG
PCLK here?=20

It looks like this assigns the functional baud rate clock to the PCLK,
whereas other IPCLKPORTs use the dout_clkcmu_peric_nocp peripheral bus
clock.

If register accesses to the UART_DBG block are clocked by the functional
clock rather than the NOC peripheral bus clock, could changing the UART baud
rate improperly scale the APB bus clock for this IP? This might lead to bus
stalls or system hangs when the kernel scales the baud rate or transitions
states, especially since this clock is marked as CLK_IS_CRITICAL.

> +	GATE(CLK_GOUT_USI_PERIC_IPCLKPORT_PCLK, "gout_usi_peric_ipclkport_pclk",
> +	     "dout_clkcmu_peric_nocp",
> +	     CMU_PERIC_CLK_CON_GAT_BLK_PERIC_UID_USI00_USI_IPCLKPORT_PCLK,
> +	     21, 0, 0),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728121111.2077=
860-1-raghav.s@samsung.com?part=3D3
