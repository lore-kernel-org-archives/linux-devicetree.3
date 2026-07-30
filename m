Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A083D34BB
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405934; cv=none; b=fQJSVzoJpjzMncfAY4q/DD2ksn3MfDHLgF1ye9faeeJTJlcK7TXfGiGf4uSnUHwV05eKUsp++wRd7fk7FMuMJESdjL+9Mor0ouCwoBkHg0iYKSfGCyJRY8xxBS7Z7D2zSBqgNW5rlazt6C/clUCg/9TyZlnc+81o0WHeZxO50s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405934; c=relaxed/simple;
	bh=KYsw9z7iSn6Vg7P72Cq7tlTX5g/RidSfRz7K7lDjKh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ob6N3iZC7vCpIPSv1bi2nwADxwn1YkuJft2QVIGgQx9cKw7pD6N9BT2P+ZEQ/fKZh1PPkAbH42l0yC7kaqx6tB7tJk5znSyaZwDYknHzToLIHq5clOOjNaFlbJ8LFaICEyQeciEtWrZyxsI46TaHW78oqZNEbcagsaC7cQ94qtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JprOU/u5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JprOU/u5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923221F000E9;
	Thu, 30 Jul 2026 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405932;
	bh=ieUhxos9/QoJBt685JJCVpqkVQp5ynQlDHKJjPwZXOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JprOU/u5Q9sOtIUhBaGWC/yV+W8mTTX0tvRsrU0gO8dA7w5OLF5+3JWef+KsWUjss
	 mT2OW7tDTesRyxJ2/MMMzZLi0HIL0cWU1CuKV5oMQDfN1gLOagKdoz3iBqqR3ce8V4
	 SksRaUPtfCzoL8ZYni9Lw9XFzx+lsyH9TFz9qm0+tYM8Y74b5nrq8AjWkTdREcO8+Z
	 kOFPieQ63+r3CDwMWUXZftQuYKFM1yI+PiRQnKg6qL6NQyNUqUdT1XsTBCCugvxIH3
	 5FVtfi6KA3ho6nrJeGv+36eHVPCd4oXsHLiWO+eFhPQLHxSiSgLHxaI8JmjsTQ4kwb
	 45s4ntaxteAig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/24] clk: mediatek: pllfh: Add ops for PLLs using
 set/clr regs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-14-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-14-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:32 +0000
Message-Id: <20260730100532.923221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing rollback on error path in `mtk_pll_prepare_setclr` leads=
 to permanent PLL power leak.
--

--- Patch [14]: [PATCH v4 14/24] clk: mediatek: pllfh: Add ops for PLLs usi=
ng set/clr regs ---
commit 6499dae9fef2cef096ef23a01c06293418528fef
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: pllfh: Add ops for PLLs using set/clr regs
   =20
Add new set of PLL FHCTL clock operations, that uses the new prepare
and unprepare methods, added in PLL for MT8189 SoC to support this
logic.

> diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-=
pllfh.c
> index 4878ac6da7da0..8dc50461c485b 100644
> --- a/drivers/clk/mediatek/clk-pllfh.c
> +++ b/drivers/clk/mediatek/clk-pllfh.c
[ ... ]
> @@ -47,6 +47,16 @@ static const struct clk_ops mtk_pllfh_ops =3D {
>  	.set_rate	=3D mtk_fhctl_set_rate,
>  };
> =20
> +const struct clk_ops mtk_pllfh_setclr_ops =3D {
> +	.is_prepared	=3D mtk_pll_is_prepared,
> +	.prepare	=3D mtk_pll_prepare_setclr,
[Severity: Medium]
Could mtk_pll_prepare_setclr() leak power on the error path?

Looking at drivers/clk/mediatek/clk-pll.c:mtk_pll_prepare_setclr() which was
introduced earlier in this series:

	mtk_pll_prepare_common(pll, pll->en_set_addr);

	if (pll->data->flags & HAVE_RST_BAR) {
		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);

		ret =3D readl_poll_timeout(pll->rst_bar_addr, val,
					(val & pll->data->rst_bar_mask), 1,
					RST_BAR_TIMEOUT);
		if (ret)
			return ret;
	}

If readl_poll_timeout() fails, it returns the error directly without calling
mtk_pll_unprepare_common() to undo the state change.

Since the Common Clock Framework won't call .unprepare() on a clock that
failed to prepare, wouldn't the PLL be left permanently powered on?

> +	.unprepare	=3D mtk_pll_unprepare_setclr,
> +	.recalc_rate	=3D mtk_pll_recalc_rate,
> +	.determine_rate =3D mtk_pll_determine_rate,
> +	.set_rate	=3D mtk_fhctl_set_rate,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D14
