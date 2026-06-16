Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829E3932DF
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 20:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642337; cv=none; b=LI9Z+C3mLovGFsQyqIDmwlfhGpJ98vVJYHbPIO6Y7/ASLG1xOchfc2pLV2Hv18u7JO4cEqF/PNJ0FFrJwIVFX0wjgu6Tx7NSfJpZFELNzlgQcxT/7fVsmQN34E0nI4zvsgP2Z5WH9bq+oamggsCWZ60ggZwzJHFtHIeiRaEtUhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642337; c=relaxed/simple;
	bh=6L77SelvjnNBrtK1rmdCibmjTVODL8Co6+NUBCmNm/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tTjwN8eCa7SIXh1rfc8CVVBy8pNBgcXOBMdrGYjCjIHw9HrEaLF7KGASwlHDaXpZyETJ8kgPC28cFJpQrnPGQRLjSDP4v1R+KYO4/vC8G0FM8XBqHXxon1UEMzxB1R6aoAN2ZNLE8u/FfZ1qgGEIfmhumltSzZdBIYVO4ekM3uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCtFOXcB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCtFOXcB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0A91F00A3A;
	Tue, 16 Jun 2026 20:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781642336;
	bh=IVluyqDHibxnF3sHDdKzRRC1rVwhzaAJUFSyV01xMKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gCtFOXcBJeS/E4KHmx9X6FjMCXS/KkM+/g/x4M+STeA26eoOQ5Ye2Iliy9+ZuLBqB
	 GzR1iGu3LxLDZtUxqjUOpgbZrkthPnGgItoJR5c2DfffyyPe2ErRIxo7iqGdmGWSEA
	 TB9Erf6e1ufX6BmTlZKJNy7Jsn+8TopfRiOY+5up7POAUlEqAnJWtdxZkdGvnBmmVj
	 ZQhDqGtJe7yAE1Gxs8T5RAw1rv/H3f9nFeTTd3nSpWM8L7MCarXCs6OX+OxNJOC7xY
	 9yT249dDHlD3QY7l8dZkrGUdxXWr+rUCz+af9naZtPuiwkzvmTaJrtd8e54gEgnslV
	 WAV3wzm7LqCVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 09/12] clk: zte: Introduce a driver for
 zx297520v3 LSP clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-zx29clk-v4-9-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-9-ca994bd22e9d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 20:38:55 +0000
Message-Id: <20260616203855.CC0A91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The static array `tdm_lsp_sel` is defined but never used, causing a=
n unused-const-variable compiler warning.
- [Low] Multiple internal data structures contain a typo in their name: `zx=
297529v3_` instead of `zx297520v3_`.
--

commit 62ece0243f8a2453a83a724365246a3a8447995d
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 LSP clocks

This commit introduces a clock driver for the "LSP" (low speed peripherals)
block of the ZTE ZX297520v3 SoC. It adds support for various peripherals
including UART, I2C, SPI, timers, and I2S.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> index d90aadf180269..26b05f2bf97ae 100644
> --- a/drivers/clk/zte/clk-zx297520v3.c
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static const char * const i2s_lsp_sel[] =3D {
> +	"lsp_osc26m",
> +	"lsp_dpll_d4",
> +	"lsp_mpll_d6",
> +	/* Unknown */
> +};
> +
> +static const char * const tdm_lsp_sel[] =3D {
> +	"lsp_tdm_wclk",
> +};

[Severity: Low]
Is this array intended to be used somewhere? It appears to be defined but
never referenced in the file, which might trigger a -Wunused-const-variable
compiler warning.

> +
> +static const char * const spi_lsp_sel[] =3D {
> +	"lsp_osc26m",

[ ... ]

> +	GATE(ZX297520V3_TDM_WCLK,          "tdm_wclk",       "tdm_div",        =
0x50,  0, 0),
> +	GATE(ZX297520V3_TDM_PCLK,          "tdm_pclk",       "lsp_pclk",       =
0x50,  1, 0),
> +};
> +
> +static const char * const zx297529v3_lsp_inputs[] =3D {
> +	"mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
> +	"osc26m", "osc32k", "tdm_wclk", "dpll_d4"
> +};
> +
> +static const char * const zx297529v3_lsp_inputs_enable[] =3D {
> +	"pclk"
> +};

[Severity: Low]
This isn't a bug, but should these arrays be named zx297520v3_lsp_inputs
instead of zx297529v3_lsp_inputs? It looks like there's a typo in the
numbering (9 instead of 0) compared to the other structures and the SoC
device name.

> +
> +static const struct zx_clk_data zx297520v3_lspclk_data =3D {
> +	.inputs_enable =3D zx297529v3_lsp_inputs_enable,
> +	.num_inputs_enable =3D ARRAY_SIZE(zx297529v3_lsp_inputs_enable),
> +	.inputs =3D zx297529v3_lsp_inputs,
> +	.num_inputs =3D ARRAY_SIZE(zx297529v3_lsp_inputs),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-zx29clk-v4=
-0-ca994bd22e9d@gmail.com?part=3D9
