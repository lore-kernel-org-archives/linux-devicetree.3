Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC5E42DFE4
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222816; cv=none; b=PvacOhAJwj3iJ+SvtYiBejbfF3RP6bMESjGJlc9q9oz8aieRiVQZfRgHFLcBgP+i42RgBoUd++anjWFEJGH2dqsQmC1x4n6vY1alR5ewvAN2vgqx28FnIriPn+1Knf4wYwDqFwI7Jr6eypOzO0V0JUUTuabJYyQ0e0/nKO2uTiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222816; c=relaxed/simple;
	bh=LPCaBZUg34Nlk6q9Z1cOriCqeplp2FoLmpMYdGSc0F0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b1Iptff9Eqxd6AfWwG69ezuc9dlhojuM5MW90KwgB6OFqy8gy98wMeAPJuW+wODizhZTEnLvy+LRRQ6N+zYlbHPjPgtVUkOQ712ViDt+P2FZT+x2RACgNdwDQ1jyevuNVDQjztfCiAV6gvXD64nf4p6w34GnoL/TOQs4zlq7XuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAgYf+56; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAgYf+56"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A8B41F000E9;
	Thu, 16 Jul 2026 17:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784222813;
	bh=MK+1PurMIbCnFT5xBtPbQzEWhrKMqqPbp1w0eZgGEQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UAgYf+56RCNfyh2pLc6cS0Nj8Jz8wbdRrrFyUgmbuIgjzVIfviFgJL6aj6CeMyK6I
	 hFLqp+FM46dPh4qA5ucDo74DTlitiuApxIrCIgmtc8IGwbddcwyZm+0AG0BYUAB67k
	 Oj/z++e7nfDuRGrBtLrsc8O3OtVQzqtw62kQXuP0IuxTnAVa96PjmH2Ufke+zLKSET
	 ICr8L7ArsWExvUx+5A/SaxOu8mcsdkwLgHK5tFbkWGJe2fk4txdf8PD646Qe9Z5wNI
	 iCLOq0eOZ7FeftP7adJ8K7EqG7Vnd/f6DXD9uhD/8msGrvS58U1Z+Ccq9T0wBpWpUu
	 RJX1Sg8YQ+nFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] clk: samsung: clk-pll: Add support for pll_1061x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandru Chimac" <alex@chimac.ro>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260716-exynos9610-clocks-v2-3-c13ce8ef1861@chimac.ro>
References: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
 <20260716-exynos9610-clocks-v2-3-c13ce8ef1861@chimac.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 17:26:52 +0000
Message-Id: <20260716172653.1A8B41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the fast-path ch=
eck `samsung_pll46xx_mpk_change()` hardcodes a 9-bit mask for `mdiv`, which=
 incorrectly truncates the 10-bit `mdiv` used by the newly added `pll_1061x=
` and the existing `pll_1460x`. This can bypass the main multiplier update =
and leave the PLL running at the wrong frequency.
--

--- Patch [3]: [PATCH v2 3/5] clk: samsung: clk-pll: Add support for pll_10=
61x ---
commit 22c944c044739f58fab83d8908a877841003ecb0
Author: Alexandru Chimac <alex@chimac.ro>

clk: samsung: clk-pll: Add support for pll_1061x

This patch adds support for the pll_1061x found in the Exynos9610 and
Exynos9810 SoCs. It reuses the logic from pll_1460x, adapting it to use
CON3 instead of CON1.

> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index fdb84bcec9127..5ec9423009c7b 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c

[ ... ]

> @@ -827,7 +832,10 @@ static int samsung_pll46xx_set_rate(struct clk_hw *h=
w, unsigned long drate,
>  	}
> =20
>  	con0 =3D readl_relaxed(pll->con_reg);
> -	con1 =3D readl_relaxed(pll->con_reg + 0x4);
> +	if (pll->type =3D=3D pll_1061x)
> +		con1 =3D readl_relaxed(pll->con_reg + 0xc);
> +	else
> +		con1 =3D readl_relaxed(pll->con_reg + 0x4);
> =20
>  	if (!(samsung_pll46xx_mpk_change(con0, con1, rate))) {
>  		/* If only s change, change just s value only*/
> @@ -845,7 +853,7 @@ static int samsung_pll46xx_set_rate(struct clk_hw *hw=
, unsigned long drate,

[Severity: High]
This isn't a bug introduced by this patch, but does the fast-path check
samsung_pll46xx_mpk_change() incorrectly truncate the 10-bit mdiv for
the newly added pll_1061x and the existing pll_1460x?

Looking at samsung_pll46xx_mpk_change(), it hardcodes a 9-bit mask for
the comparison:

    old_mdiv =3D (pll_con0 >> PLL46XX_MDIV_SHIFT) & PLL46XX_MDIV_MASK;

If the hardware boots with a 10-bit MDIV and the driver requests a new rate
where the lower 9 bits match the current hardware state, old_mdiv =3D=3D ra=
te->mdiv
will incorrectly evaluate to true.

Will this cause the driver to mistakenly take this SDIV-only fast-path,
skipping the required main multiplier (MDIV) update and leaving the PLL
running at the wrong frequency?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-exynos9610=
-clocks-v2-0-c13ce8ef1861@chimac.ro?part=3D3
