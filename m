Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB936E48C
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405932; cv=none; b=ZS6/0QXBB/TSj2mwIAMzCxCQjPVkg/8yP15S/d8ne/TpphGoxmUlMqek6x9ttCLwfTZjG5HeKcFrBWNSk8QDgHjagnEY89+mIMnw95n422ocpj21qtoP1eANe8pjqyU+uAqOLS3NmAnxU+4dRf0kxm8ru7c0Ea4b9oGI1ZwMOu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405932; c=relaxed/simple;
	bh=GtZL3Dbcmdl/CWAQzVAGFRLijgbriR2lK6k4rJ9A8g0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oO/rLN33fkKxOAQFbbyzmwQkJwzUgT4KWVpcnxVzi0pS2rQGFW8y69Ldy7jXh0ypdAP0yVIHUqzcAsUcbI8AgjOinXt78P6OjHMLhUApYtxCKSycuMMqAX2253WSiw7/t8ecgibw+NsskEcIYrvKwmpnxQ/eSEqK76J/YlCJYOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocnvOtpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocnvOtpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401011F00A3A;
	Thu, 30 Jul 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405931;
	bh=n4sjOjqX1DEk+sM8YsZ7N4Ckr68OEnIZJMfEW6IjcFU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ocnvOtpc0el1Plht3AdUcFHgrS9kr+k7GeYVDtE3dc6XTys2DmiKGzeIKdj00DtRg
	 pbavPhZ9GI9KCp+zBoURH7dm3r+TmLAhVI5hsVni/SFK4D+ecDvt3pKJJb1sbZgjhv
	 HXOZR1f7b6B44DsabRqJXkVVOLeRho/Mvc2Ic1uZgg7R/x1kvftPg3Tu0xOO08Sup0
	 i6UgpBTxMD1GUNevQow01kjasCeZNYpjkigKepTiFC4CKWiszeuAagJXDRhzWCbS+x
	 N7K6UY4clUrjbXfuKhJBdCvZiFarEJrFA20AooBswAolTsGNcPVkcIkjRu+ZLBh3yV
	 5lJGuES7D465g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/24] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-12-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-12-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:30 +0000
Message-Id: <20260730100531.401011F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Reusing common prepare/unprepare functions for SET/CLR registe=
rs incorrectly performs read-modify-write (RMW) operations, failing to togg=
le the target PLL and potentially disabling unrelated active PLLs.
- [High] `mtk_pll_prepare_setclr` and `unprepare_setclr` improperly call co=
mmon functions that execute `pwr_addr` register writes, contradicting the h=
ardware design.
- [High] Missing hardware state rollback when `rst_bar` polling fails in `m=
tk_pll_prepare_setclr()`.
- [High] Early return on `rst_bar` timeout in `mtk_pll_unprepare_setclr()` =
aborts PLL teardown, leaving the hardware fully powered on.
--

--- Patch [12]: [PATCH v4 12/24] clk: mediatek: pll: Add ops for PLLs using=
 set/clr regs ---
commit 85e380ac652f1fdab76c2fb7262d10466dfdb403
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pll: Add ops for PLLs using set/clr regs

MT8189 SoC uses a new combination of status and set/clr registers to
control its PLL power state and perform BAR reset, that are different
than the current default clock prepare/unprepare operations are using.

Add new set of PLL clock operations to support this logic that relies
on the following registers for prepare/unprepare operations:
  - en/en_set/en_clr, rather than pwr register, for PLL power
    control
  - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
    register for BAR reset control

Also, handle rst_bar register setting/clearing with a timeout, to
verify the operation was correctly performed.

> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pl=
l.c
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -305,6 +307,48 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(mtk_pll_unprepare);
> =20
> +int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll =3D to_mtk_clk_pll(hw);
> +	u32 val =3D 0;
> +	int ret;
> +
> +	mtk_pll_prepare_common(pll, pll->en_set_addr);

[Severity: High]
The commit message mentions these new PLLs use en/en_set/en_clr rather than
the pwr register for power control. Since mtk_pll_prepare_common() executes
read-modify-write operations on pll->pwr_addr (such as setting CON0_PWR_ON),
does this corrupt other configuration bits at REG_CON0 if pwr_addr points to
the default base offset?

> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
> +
> +		ret =3D readl_poll_timeout(pll->rst_bar_addr, val,
> +					(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);
> +		if (ret)
> +			return ret;

[Severity: High]
If the rst_bar readiness polling times out, does this leave the hardware in
an inconsistent state?

Since mtk_pll_prepare_common() was already called to power on the PLL and
enable the tuner, returning the error directly here skips undoing those
steps. The clock core sees the prepare fail and will not invoke the unprepa=
re
callback on error paths, permanently leaking power.

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
> +	int ret;
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
> +
> +		ret =3D readl_poll_timeout(pll->rst_bar_addr, val,
> +					!(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);
> +		if (ret)
> +			return;

[Severity: High]
If this polling times out, does the early return permanently leak the PLL's
active state?

Skipping the final call to mtk_pll_unprepare_common() leaves the hardware
fully powered on, but the clock core considers the clock disabled since this
function returns void. Hardware teardown paths typically proceed on a best
effort basis rather than bailing out at the first error.

> +	}
> +
> +	mtk_pll_unprepare_common(pll, pll->en_clr_addr);

[Severity: Critical]
Does passing a clear (W1C) register to mtk_pll_unprepare_common() cause
unintended side effects?

Looking at mtk_pll_unprepare_common(), it performs a read-modify-write:

    r =3D readl(en_addr) & ~BIT(pll->data->pll_en_bit);
    writel(r, en_addr);

If en_clr_addr reads back the status of all PLLs, wouldn't masking out the
target bit to 0 and writing the result back write 1s for all other active
PLLs, inadvertently disabling them?

> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_unprepare_setclr);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D12
