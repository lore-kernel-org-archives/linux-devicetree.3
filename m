Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9004028E6
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779996574; cv=none; b=Ada93aDZ9RpWcaFZTO2+TgzfqtzW/26KAaz69TVwfX22xoo/wbeLOPGbfVaNd0s8A46T+NnbssMAlqnEWryRMCG4/NiwxL8XEwU6nLN8qte46eXLgchm9Wq6mGKhW0xEYHMieqqhlVTLXFo1z/CIily9HSA25nVMOFtd5OZ0kro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779996574; c=relaxed/simple;
	bh=eZt6eZFEZZU3baT4PYHYZqNsnWIHStqn9OgZpG7HdjE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P24lbWpqBtoYQkjweHu6T4SWYR0X4OcQ1rhV5PYcT94KbJgZiYUtm2NEZAa03lzdSa/aHQtobLHmlDqH5GEcK/09DCioVtTjt1676QbGsJnaCdXfIRYV6kVgWsrshEiJcXWJutKompWCuAi7ag8wWh8TPiZBda3qipFeGAF0Ufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oewhIzIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oewhIzIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB81D1F00A3A;
	Thu, 28 May 2026 19:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779996573;
	bh=AxT52/kB0AnBbEIKurbtHJ9Vc3gUiydaWgj7XuWaZBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oewhIzIXkNMBrPc3zyVVC4SrQ2Vsvd2pw0CJl8rROeCVnsV57e1nfZ75jjhsqaFA8
	 ja9lYnVERKXdBHph+tpo0Kd89v6wJaf/fJki36mNJ4VWud6BQTtAzFsNCTSvOGt0b3
	 ygGKMpTQ6q7UDas3EvKEoToVY4VpYYAlyA8hBV13Df0zsO3UF3BCE9C/zDrmPHy61o
	 btsrBaZ1fDVnP53HhgLKaOCGLSeL1Qhdv+bP5xGfjj84oQYr65QUJrXpBbdiehK0lB
	 iGmhLRe56jvg90FXntRExRyqM0ewL9+pdyuEvgCLb9s40IoRv/rJxYhvpqDkbQLxUe
	 KwlG0bMOjjFTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] clk: en7523: generalize register clocks function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528190000.9164-3-ansuelsmth@gmail.com>
References: <20260528190000.9164-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 19:29:32 +0000
Message-Id: <20260528192932.DB81D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The PCIe clock backing structure is allocated with `devm_kzalloc()=
` but registered with non-managed `clk_hw_register()`, leading to a UAF if =
probe fails.
--

commit 8b129b6c8b9f7c7f67a06021102b7f5673eead5f
Author: Christian Marangi <ansuelsmth@gmail.com>

clk: en7523: generalize register clocks function

This commit generalizes the clock registration logic used by the Airoha
EN7581 SoC to also support the AN7583 SoC. It updates the implementation
to register clocks defined in the new soc_data structures.

> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d32..087ff4568124f 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
[ ... ]
> @@ -711,12 +712,15 @@ static int en7523_clk_hw_init(struct platform_devic=
e *pdev,
>  static void en7581_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
>  				   struct regmap *map, void __iomem *base)
>  {

[Severity: High]
This isn't a bug introduced by this patch, but looking at=20
en7523_register_pcie_clk() which is called at the end of this function, it=
=20
appears the clock backing structure is allocated with devm_kzalloc() but=20
registered with the non-managed clk_hw_register().

If probe fails later, the driver core will automatically unwind devm resour=
ces=20
and free the structure. However, because the clock was not registered with=
=20
devm_clk_hw_register(), CCF is never notified to unregister the clock and=20
retains dangling pointers to it.

Could this lead to a use-after-free if the CCF is subsequently accessed, fo=
r=20
example by reading clk_summary? Should en7523_register_pcie_clk() be update=
d=20
to use devm_clk_hw_register() instead?

> +	const struct en_clk_soc_data *soc_data;
>  	struct clk_hw *hw;
>  	u32 rate;
>  	int i;
> =20
> -	for (i =3D 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> -		const struct en_clk_desc *desc =3D &en7581_base_clks[i];
> +	soc_data =3D device_get_match_data(dev);
> +
> +	for (i =3D 0; i < soc_data->num_clocks - 1; i++) {
> +		const struct en_clk_desc *desc =3D &soc_data->base_clks[i];
>  		u32 val, reg =3D desc->div_reg ? desc->div_reg : desc->base_reg;
>  		int err;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528190000.9164=
-1-ansuelsmth@gmail.com?part=3D2
