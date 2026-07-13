Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6331C2F7EFC
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958996; cv=none; b=Mf1VAhu6RyvjnQtbfKQZkkY1wVeZMlyp1/jmGhmktbYX08VsfY61rm3yVE4DAXqlu397UoqdBSjQWAIwPYffOeSnDlPlkSsk5wy5HU+yX84mYOftKWUjEKKta6Amp7qzAgGZv/sEylYEySOPcJaemcduoAfIQRX8vgsirGUX75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958996; c=relaxed/simple;
	bh=RhJGfDOWJDOBHpdJj3A1MAntdco//8nqgNugxHOtBk0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ia3SGAaHKdI7s0Zjt7caVu5PlEEZ/3NBHnscJFTm/aNjMzI8TuH1h+UBcAd5p4VNKEv5F5lwe47KwdO053BmviOYNPaUHBb1uKRs3x7Zsm+WJ48EojfKPtCkgE4x99kt0z7MrBBwGPIRgSf4z0v1J/CHgCVjmwxku6l4ADOLBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J92Qgz3a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J92Qgz3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66331F000E9;
	Mon, 13 Jul 2026 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783958995;
	bh=OO3AMpKb9rhYvd4kT/uYewvA8rC8L5SPhVG2BUMDlvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J92Qgz3aNeUxjf+jLHtxLFPzRmNef0DalvYt499OilUKPfQYYEpYK8D+E1lQw3gtA
	 6fc+h0ay/7w2yJ5A4cJhxPBPpCdZest9AC7LJTZno0LGVfq8jUGLfxYIxfp9DzoOkh
	 1xsetPfCaCfDsY1jqRL8fosEnbXHE9z6TPOAqXOUx+zltaFPTIDKu1A6VCdsu+fQET
	 lk7Jhiv0ltnBcE2entyIszLzWQG+/9VL/epWNMNZqa58D1gV50kGVNCUq2xmLbzfZT
	 hFxpiqY2b2YmscTvDQqmQ+S9aWBG5hvbtvYveXK4To6VgziGLuHLHTKSeeAinipT7o
	 0rzPN2pG0FnuA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713155630.3054636-6-eleanor.lin@realtek.com>
References: <20260713155630.3054636-1-eleanor.lin@realtek.com>
 <20260713155630.3054636-6-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 16:09:54 +0000
Message-Id: <20260713160954.B66331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Asymmetry in enable/disable logic permanently bricks PLLs that lac=
k a readable power status register.
- [Low] The header file `freq_table.h` lacks include guards.
--

--- Patch [5]: [PATCH v10 05/11] clk: realtek: Add support for phase locked=
 loops (PLLs) ---
commit 1e05dd1885eded463b663e611cd68c039c2be096
Author: Cheng-Yu Lee <cylee12@realtek.com>
clk: realtek: Add support for phase locked loops (PLLs)

This commit provides a full set of PLL operations for programmable PLLs
and a read-only variant for fixed or hardware-managed PLLs.

> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 0000000000000..54c284070e47a
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
[ ... ]
> @@ -173,20 +173,19 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsi=
gned long rate,
>  static int clk_pll_enable(struct clk_hw *hw)
>  {
>  	struct clk_pll *clkp =3D to_clk_pll(hw);
>  	unsigned long flags;
>  	int ret =3D 0;
> =20
>  	if (!clkp->seq_power_on)
>  		return ret;
> =20
>  	spin_lock_irqsave(&clkp->lock, flags);
> =20
>  	if (is_power_on(clkp))
>  		goto unlock;

[Severity: High]
If a PLL has power on/off sequences but no readable status register,
is_power_on() unconditionally returns true. Will this cause the enable path
to permanently skip the power-on sequence if the clock was previously
disabled?

When clk_pll_disable() is called, it executes the power-off sequence:

static void clk_pll_disable(struct clk_hw *hw)
{
        ...
        regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off, ...);
        ...
}

But when clk_pll_enable() is subsequently called, is_power_on() returns true
because power_reg is 0. Does this cause the power-on sequence to be skipped,
leaving the PLL permanently disabled despite the clock core believing it is
enabled?

> +
> +	ret =3D regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		goto unlock;
[ ... ]
> diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_=
table.h
> new file mode 100644
> index 0000000000000..78215aee33007
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +struct freq_table {

[Severity: Low]
Is it intentional to omit the standard include guards here? If this header
is included multiple times in the future, could it lead to redefinition
errors for struct freq_table?

> +	u32 val;
> +	unsigned long rate;
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713155630.3054=
636-1-eleanor.lin@realtek.com?part=3D5
