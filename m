Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE53A1E96
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 07:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786086303; cv=none; b=jrfzY0kW+hs4S8awA+nKpDYn6Ov/AOaxS5l8WlOoaEAzSTSk1sQh7180sxWpq4LSrJx2Cr/+xaTUB7zml3lU0FwQj29I1VsJMciEnerJQ2tFyOTzlNwfVqyG5NfcmuIcFFbvzhioURMC4qECU6QS35jmFRwkcHSKX/Uk3NkWz30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786086303; c=relaxed/simple;
	bh=7cMN8X4zEwvUmJMN+dThzpaa7nNZFArQh9IJY5Er6ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZLdORLEJk4MKphYetbNDxb0fJpn8Pw59u1+o1WNzmRHwsnhh6yytrOtlnuwyJw/dw6v/UkS6b//plhuNMEOVbRMSyPqpgy797tLDQLN4gFNmVD5R2b8oqzcK3XxfRo8AENr/NNLSyxQqBWoknr6pqPGMQYcuHCdVUgaFmzktTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyzG8uvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyzG8uvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846A81F00A3D;
	Fri,  7 Aug 2026 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786086297;
	bh=AcibIt5dN6uRTFioO91Mdah4B8qBbPIrM1uf4AZgorw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FyzG8uvyr6tUVlhMQGTZnFAQm3tX7kfAJPQX2VntOYiYpisFKh32eiImGDzR2quvj
	 CLhGEizZO/2d0ittXGp4eZ5FFJirqIJsB2BiJzAQSIghbw9R0pLI0uVvRhiD7K4Ky+
	 YA1RWjOkO0FbDSsgboKV8Zlm5l3GQn3HOZefPQAMsota8YJ7bbLG2a2/vYUCLuNY+L
	 +BA6907qt7zWDFsb5/J2xfp+7wXPFmS5Cax2gAdiuaJFPaZWKzTc2OiWGPvkYhFvdX
	 k8T4bFOfVQmL9Ff0cSLiuNF3AAEf/nDH1hc82czUjPNzgJqEmVSS3idOZ7wNYJ5o32
	 Ixb6Vyu8pkauA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luo Jie" <jie.luo@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-8-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
 <20260806-qcom_ipq5210_cmnpll-v2-8-cce718b8ec17@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 07:04:57 +0000
Message-Id: <20260807070457.846A81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk_ephy_raw_determine_rate() fails to respect req->min_rate and=
 req->max_rate boundaries.
--

--- Patch [8]: [PATCH v2 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock =
support ---
commit 49a391af3ca59aa96545f77e2d5dd595f1603325
Author: Luo Jie <jie.luo@oss.qualcomm.com>

clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock support

This commit introduces EPHY-RAW clock support for the IPQ5210 from the CMN=
=20
PLL, providing the raw reference clock to the SoC-integrated Ethernet PHY. =
It=20
adds clock operations and register definitions to select the output frequen=
cy=20
between 125 MHz and 312.5 MHz based on the required link speed.

> diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pl=
l.c
> index 356988c03a7ae..586f9c620e7e1 100644
> --- a/drivers/clk/qcom/ipq-cmn-pll.c
> +++ b/drivers/clk/qcom/ipq-cmn-pll.c

[ ... ]

> +static int clk_ephy_raw_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
> +	unsigned long rate_125m =3D 125000000UL, rate_312p5m =3D 312500000UL;
> +
> +	/* Pick whichever of the two supported rates is closer to the request */
> +	req->rate =3D abs_diff(req->rate, rate_125m) < abs_diff(req->rate, rate=
_312p5m) ?
> +		    rate_125m : rate_312p5m;
> +
> +	return 0;
> +}

[Severity: Medium]
Does this rate selection logic need to check the req->min_rate and=20
req->max_rate boundaries?

It appears that the target frequency is selected unconditionally based sole=
ly
on the absolute difference from req->rate, ignoring bounds applied via QoS =
or
OPP constraints.=20

If a clock consumer requests a rate with a strict upper boundary (for examp=
le,
req->max_rate is 250 MHz and req->rate is clamped to 250 MHz), the absolute
difference to 312.5 MHz (62.5 MHz) is less than the difference to 125 MHz=20
(125 MHz).=20

Could this result in selecting a frequency outside the permissible bounds,=
=20
violating the Common Clock Framework determine_rate API contract and causing
upstream rate-setting routines to fail?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-qcom_ipq52=
10_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com?part=3D8
