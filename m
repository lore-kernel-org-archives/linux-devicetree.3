Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49193FF1CD
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 15:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778860452; cv=none; b=hp0JzGP9H6Xspg6+t4Sux/gay3CTBBP53in1UQ2C+06QZVElOFIFHezJEUIlbXy2crxN1QSx2pgMzsaolTQE9mPt25ut9+I4CrLMcuL86dg/JPqr6ScNBF0Dy8MVfgqxN9X++986H7hK0Uy/oS+1bJhmeZTXLqnP81vgbj6Dnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778860452; c=relaxed/simple;
	bh=/Q+hmsYRAXCXGeLf9zWJPNVhnzn2HdaEwm+c1H0hu+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pCh9UhWEZd+6ethLZEoqeTmPTXIU8VHwNS0ug58R2fiZi+ReIaQ11xzPpyli+w+eWt5OE1a4OZ6/xQtk+25tkcn9Q3iLWN18mxdWvP7rehunEfph1gP9Q4lBjM0Hay7zHp6e8qTtG56nL9q/IsOZnRaUsZus1cOAoajDCrZpjFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=db976SVq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="db976SVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9FAC2BCB0;
	Fri, 15 May 2026 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778860452;
	bh=/Q+hmsYRAXCXGeLf9zWJPNVhnzn2HdaEwm+c1H0hu+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=db976SVqUQvMay2TFT9NUKCqyv2eemk6OqbAUVaAGXzlbHrseJsz9wF32TBFnl5xE
	 hefDQBQ+FVqmfZ4dC6D2EbEklLBnk1CFoo/ii9WXjhx7lN7Il29Ayv6F7kyoUAMTsU
	 PAaTQWPI6qsNBBwAm3BBjGlNnjMF4APSP0zeDGFDNHNkmP5XV91DQ5tJJ1rC4BEztp
	 XCkJUvbu/aHL+4t3JLbfpsxbYiIJzu36ZIovjTMwusxV9HJlQzL3/txCMdbUCoJc4f
	 GHZ8ir0/2NOOqyDQHAXRg5OmiZLwp2uJ86ZHf7S7sSFd9lueUWd1eEFTzMzUW7caiq
	 PbSzNxE0Tljtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/28] media: rockchip: rga: use clk_bulk api
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3ZlbiBQw7xzY2hlbA==?= <s.pueschel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515-spu-rga3-v6-7-e547152eb9c9@pengutronix.de>
References: <20260515-spu-rga3-v6-7-e547152eb9c9@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 15:54:11 +0000
Message-Id: <20260515155411.DC9FAC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Switch to `devm_clk_bulk_get_all()` silently drops validation for =
mandatory clocks and alters the hardware initialization sequence.
--

commit 234eed9f39e78b285ced7d7570cee6af431aad44
Author: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

media: rockchip: rga: use clk_bulk api

This commit replaces individual clock retrieval and enablement calls with
the clk_bulk API to reduce code duplication.

> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
[ ... ]
> @@ -771,23 +733,12 @@ static int rga_parse_dt(struct rockchip_rga *rga)
>  	udelay(1);
>  	reset_control_deassert(ahb_rst);
> =20
> -	rga->sclk =3D devm_clk_get(rga->dev, "sclk");
[ ... ]
> -	rga->hclk =3D devm_clk_get(rga->dev, "hclk");
> -	if (IS_ERR(rga->hclk)) {
> -		dev_err(rga->dev, "failed to get hclk clock\n");
> -		return PTR_ERR(rga->hclk);
> +	ret =3D devm_clk_bulk_get_all(rga->dev, &rga->clks);
> +	if (ret < 0) {
> +		dev_err(rga->dev, "failed to get clocks\n");
> +		return ret;
>  	}
> +	rga->num_clks =3D ret;

Does this code introduce a regression when the device tree is missing
the clocks property?

Looking at devm_clk_bulk_get_all(), it returns the number of clocks found,
which is 0 if the clocks property is missing. Because the check is only for
ret < 0, a malformed device tree could cause the probe to succeed without
the required clocks. Accessing the hardware without all three clocks running
might result in an asynchronous external abort.

Also, does this change the required clock enablement sequence?

The previous code explicitly prepared and enabled the clocks in a fixed
order (sclk, aclk, hclk) and disabled them in a specific sequence. By using
devm_clk_bulk_get_all(), the order now depends strictly on the device tree
array index. If the hardware requires a specific sequence, this might cause
initialization issues.

Could devm_clk_bulk_get() with a predefined clk_bulk_data array be used
instead to explicitly define the required clock IDs? This would preserve bo=
th
validation and the enablement sequence.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-spu-rga3-v=
6-0-e547152eb9c9@pengutronix.de?part=3D7
